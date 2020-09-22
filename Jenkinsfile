properties([disableConcurrentBuilds()])

node('unix') {
	timeout(0) {
		shell "wget -O - get.pharo.org/64/90+vmHeadlessLatest | bash"
		shell "./pharo Pharo.image save largeImage"
		shell "./pharo eval --save \"Metacello new 
					baseline: 'ImageGenerator'; 
					repository: 'github://tesonep/pharo-image-generator'; 
					load.\""
		shell "./pharo eval --save \"Metacello new 
				baseline: 'ImageGenerator'; 
				repository: 'github://tesonep/pharo-image-generator'; 
				load.\""
				
		shell "./pharo eval --save \"BigImageBuilder new
				numberOfPackages: 250;
				numberOfClasses:  100;
				hierarchyDeep:    15;
				build.\""
	}
}


