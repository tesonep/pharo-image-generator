properties([disableConcurrentBuilds()])

node('unix') {
	cleanWs()
	checkout scm
	
	sh "wget -O - get.pharo.org/64/90+vmHeadlessLatest | bash"
	sh "./pharo Pharo.image save largeImage"
	sh "./pharo eval --save \"Metacello new baseline: 'ImageGenerator'; repository: 'github://tesonep/pharo-image-generator'; load.\""
	sh "./pharo eval --save \"BigImageBuilder new numberOfPackages: 250;	numberOfClasses: 100; hierarchyDeep: 15; build.\""
}


