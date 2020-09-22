properties([disableConcurrentBuilds()])

node('unix') {
	
	stage("Preparing"){
		cleanWs()
		checkout scm
	
		// Downloading Pharo
		sh "wget -O - get.pharo.org/64/90+vmHeadlessLatest | bash"

		// Installing the baseline of the generator
		sh "./pharo Pharo.image save largeImage"
		sh "./pharo largeImage.image eval --save \"Metacello new baseline: 'ImageGenerator'; repository: 'github://tesonep/pharo-image-generator'; load.\""
	}

	stage("Generating the image"){
		// Generating the Image
		sh "./pharo largeImage.image eval --save \"BigImageBuilder new numberOfPackages: 250;	numberOfClasses: 100; hierarchyDeep: 15; build.\""
	}
	
	// Zipping the image
	stage("Uploading the image"){
		sh "zip -9 largeImage.zip largeImage.* *.sources"

		// Uploading to 
		sshagent (credentials: ['b5248b59-a193-4457-8459-e28e9eb29ed7']) {
			sh "scp -o StrictHostKeyChecking=no \
			largeImage.zip \
			pharoorgde@ssh.cluster023.hosting.ovh.net:/home/pharoorgde/files/image/90/largeImage.zip"
		}
	}

}


