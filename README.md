# pharo-image-generator
This is a generator to create synthetic images for Pharo.
The idea is to reproduce the behaviour of large images of Pharo, so we can test our tools and generate better benchmarks.

To load it:

```
Metacello new
	baseline: 'ImageGenerator';
	repository: 'github://tesonep/pharo-image-generator';
	load.
```

This generator uses a builder scheme with many builder to configure: 
A simple example with a big array of byte arrays and a simple generated package can be:

```
ImageGenerator new
	targetName: 'bigImage';
	withBigArray;
	withSimpleBigPackage;
	generate.
```

