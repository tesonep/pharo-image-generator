"
This generator, generates a big array (with multiple levels) with ByteArrays of a fixed size.
By default it generates two level array with 2048 elements per level and 1024 bytes as size of the byte arrays.
The object is stored in the global named in globalName (by default TheBigArray).

With this conf, it creates: 

- A top array of 2048 entries.
- Each entry is 2048 entries array with a 1024 bytes ByteArray on it.
- It generates > 4GB of space in this object

"
Class {
	#name : #BigArrayOfByteArrayGenerator,
	#superclass : #Object,
	#instVars : [
		'globalName',
		'numberOfLevels',
		'elementsPerLevel',
		'eachByteArraySize'
	],
	#category : #ImageGenerator
}

{ #category : #accessing }
BigArrayOfByteArrayGenerator >> eachByteArraySize [
	^ eachByteArraySize
]

{ #category : #accessing }
BigArrayOfByteArrayGenerator >> eachByteArraySize: anObject [
	eachByteArraySize := anObject
]

{ #category : #accessing }
BigArrayOfByteArrayGenerator >> elementsPerLevel [
	^ elementsPerLevel
]

{ #category : #accessing }
BigArrayOfByteArrayGenerator >> elementsPerLevel: anObject [
	elementsPerLevel := anObject
]

{ #category : #translating }
BigArrayOfByteArrayGenerator >> generate [
	Smalltalk at: globalName put: (self generateLevels: numberOfLevels)
]

{ #category : #translating }
BigArrayOfByteArrayGenerator >> generateLevels: remainingLevel [

	^ remainingLevel = 0
		ifTrue: [ ^ ByteArray new: eachByteArraySize ]
		ifFalse: [ (1 to: elementsPerLevel) collect: [ :e | self generateLevels: remainingLevel - 1 ] ]
]

{ #category : #accessing }
BigArrayOfByteArrayGenerator >> globalName [
	^ globalName
]

{ #category : #accessing }
BigArrayOfByteArrayGenerator >> globalName: anObject [
	globalName := anObject
]

{ #category : #initialization }
BigArrayOfByteArrayGenerator >> initialize [ 
	
	globalName := #TheBigArray.
	numberOfLevels := 2.
	elementsPerLevel := 2048.
	eachByteArraySize := 1024
]

{ #category : #accessing }
BigArrayOfByteArrayGenerator >> numberOfLevels [
	^ numberOfLevels
]

{ #category : #accessing }
BigArrayOfByteArrayGenerator >> numberOfLevels: anObject [
	numberOfLevels := anObject
]
