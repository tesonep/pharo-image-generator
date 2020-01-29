"
I generate a Simple package with the number of classes provided in the parameter.
Also I generate some instance variables with the average provided for each class, and big methods with String literals and ByteArrays
"
Class {
	#name : #SimpleBigPackageGenerator,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'numberOfClasses',
		'averageInstanceVariables',
		'averageStringLiteralMethods',
		'averageByteArrayMethods'
	],
	#category : #ImageGenerator
}

{ #category : #accessing }
SimpleBigPackageGenerator >> averageByteArrayMethods [
	^ averageByteArrayMethods
]

{ #category : #accessing }
SimpleBigPackageGenerator >> averageByteArrayMethods: anObject [
	averageByteArrayMethods := anObject
]

{ #category : #accessing }
SimpleBigPackageGenerator >> averageInstanceVariables [
	^ averageInstanceVariables
]

{ #category : #accessing }
SimpleBigPackageGenerator >> averageInstanceVariables: anObject [
	averageInstanceVariables := anObject
]

{ #category : #accessing }
SimpleBigPackageGenerator >> averageStringLiteralMethods [
	^ averageStringLiteralMethods
]

{ #category : #accessing }
SimpleBigPackageGenerator >> averageStringLiteralMethods: anObject [
	averageStringLiteralMethods := anObject
]

{ #category : #accessing }
SimpleBigPackageGenerator >> generate [

	1 to: numberOfClasses do: [ :index | self generateClass: index ]
]

{ #category : #accessing }
SimpleBigPackageGenerator >> generateAccessorsOf: aClass for: instanceVariables [
	
	instanceVariables do: [ :aName | 
		aClass compile: (String streamContents: [:stream | 
			stream 
				nextPutAll: aName; cr;
				tab; nextPutAll: '^'; nextPutAll: aName ]).

		aClass compile: (String streamContents: [:stream | 
			stream 
				nextPutAll: aName asSymbol asMutator; space; nextPutAll: 'aValue'; cr;
				tab; nextPutAll: aName; nextPutAll: ' := aValue' ])	]
]

{ #category : #accessing }
SimpleBigPackageGenerator >> generateClass: index [

	| instanceVariables aClass |
	instanceVariables := self generateInstanceVariables.

	aClass := Object
		subclass: #AClass , index printString
		instanceVariableNames: (instanceVariables joinUsing: ' ')
		classVariableNames: ''
		package: packageName.
		
	self generateAccessorsOf: aClass for: instanceVariables.
	self generateLiteralStringMethodsFor: aClass.
	self generateLiteralByteArrayMethodsFor: aClass.	
]

{ #category : #accessing }
SimpleBigPackageGenerator >> generateInstanceVariables [

	| numberOfVariables |
	
	numberOfVariables := (averageInstanceVariables * (Random new next)) ceiling.
	
	^ (1 to: numberOfVariables)
		collect: [ :e | 'var' , e printString ]
]

{ #category : #accessing }
SimpleBigPackageGenerator >> generateLiteralByteArrayMethodsFor: aClass [
	
	| numberOfLiteralByteArrayMethods |
	numberOfLiteralByteArrayMethods := (averageByteArrayMethods * Random new next) ceiling.
	
	1 to: numberOfLiteralByteArrayMethods do: [ :index | | byteArray |
		byteArray := ByteArray new: ((Random new next max: 0.25) * 4096) ceiling.
		1 to: byteArray size do: [ :element | byteArray at: element put: (Random new next * 255) floor ].
		
		aClass compile: (String streamContents: [:stream | 
			stream 
				nextPutAll: 'literalBA' , index printString; cr;
				tab; nextPutAll: '^ '; print: byteArray.])]
]

{ #category : #accessing }
SimpleBigPackageGenerator >> generateLiteralStringMethodsFor: aClass [
	
	| numberOfLiteralByteArrayMethods |
	numberOfLiteralByteArrayMethods := (averageStringLiteralMethods * Random new next) ceiling.
	
	1 to: numberOfLiteralByteArrayMethods do: [ :index | | aString |
		aString := String loremIpsum: ((Random new next max: 0.25) * 4096) ceiling.
		
		aClass compile: (String streamContents: [:stream | 
			stream 
				nextPutAll: 'literalString' , index printString; cr;
				tab; nextPutAll: '^ '; print: aString ])]
]

{ #category : #accessing }
SimpleBigPackageGenerator >> initialize [

	packageName := 'SimpleGeneratedPackage'.
	numberOfClasses := 100.
	averageInstanceVariables := 7.
	averageStringLiteralMethods := 3.
	averageByteArrayMethods := 3

]

{ #category : #accessing }
SimpleBigPackageGenerator >> numberOfClasses [
	^ numberOfClasses
]

{ #category : #accessing }
SimpleBigPackageGenerator >> numberOfClasses: anObject [
	numberOfClasses := anObject
]

{ #category : #accessing }
SimpleBigPackageGenerator >> packageName [
	^ packageName
]

{ #category : #accessing }
SimpleBigPackageGenerator >> packageName: anObject [
	packageName := anObject
]
