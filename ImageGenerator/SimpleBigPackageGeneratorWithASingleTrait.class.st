Class {
	#name : #SimpleBigPackageGeneratorWithASingleTrait,
	#superclass : #SimpleBigPackageGenerator,
	#instVars : [
		'traitToUse'
	],
	#category : #ImageGenerator
}

{ #category : #accessing }
SimpleBigPackageGeneratorWithASingleTrait >> generate [

	self generateTrait.
	super generate
]

{ #category : #generating }
SimpleBigPackageGeneratorWithASingleTrait >> generateTrait [

	traitToUse := Trait named: 'ATraitIncluded' uses: {} package: packageName.
	traitToUse compile: 'traitMethodA ^ 42'.
	traitToUse compile: 'traitMethodB ^ 43'.	
]

{ #category : #accessing }
SimpleBigPackageGeneratorWithASingleTrait >> traitCompositionOfClasses [

	^ traitToUse
]
