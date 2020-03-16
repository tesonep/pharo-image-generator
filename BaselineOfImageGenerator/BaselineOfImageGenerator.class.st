Class {
	#name : #BaselineOfImageGenerator,
	#superclass : #BaselineOf,
	#category : #BaselineOfImageGenerator
}

{ #category : #baselines }
BaselineOfImageGenerator >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec package: 'ImageGenerator' ]
]
