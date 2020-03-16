Class {
	#name : #ImageGenerator,
	#superclass : #Object,
	#instVars : [
		'targetName',
		'generators',
		'exitAfterGeneration'
	],
	#category : #ImageGenerator
}

{ #category : #'api - configuration' }
ImageGenerator >> addGenerator: aGenerator [

	generators add: aGenerator
]

{ #category : #'api - configuration' }
ImageGenerator >> exitAfterGeneration [

	exitAfterGeneration := true
]

{ #category : #'api - generate' }
ImageGenerator >> generate [

	self runGenerators.
	self saveImage.
	
]

{ #category : #initialization }
ImageGenerator >> initialize [
	targetName := 'generatedImage'.
	generators := OrderedCollection new.
	exitAfterGeneration := false.
]

{ #category : #internalOperations }
ImageGenerator >> runGenerators [.

	generators do: [ :e | e generate ].
	
]

{ #category : #internalOperations }
ImageGenerator >> saveImage [

	"If saveAs: returns false we are in the generator, not in the new image "
	(Smalltalk saveAs: targetName)
		ifFalse: [
			exitAfterGeneration ifTrue: [ Smalltalk quitPrimitive ]].
]

{ #category : #accessing }
ImageGenerator >> targetName [
	^ targetName
]

{ #category : #'api - configuration' }
ImageGenerator >> targetName: anObject [
	targetName := anObject
]

{ #category : #'api - configuration' }
ImageGenerator >> withBigArray [

	generators add: BigArrayOfByteArrayGenerator new
]

{ #category : #'api - configuration' }
ImageGenerator >> withBigArrayOfLevels: levels elementsPerLevel: elementsPerLevel ofSize: size [

	generators add: (BigArrayOfByteArrayGenerator new
				elementsPerLevel: elementsPerLevel;
				numberOfLevels: levels;
				eachByteArraySize: size;
				yourself)
]

{ #category : #'api - configuration' }
ImageGenerator >> withSimpleBigPackage [

	generators add: SimpleBigPackageGenerator new
]
