Class {
	#name : #MFFile,
	#superclass : #Object,
	#instVars : [
		'parent',
		'name',
		'contents'
	],
	#category : #MyFS
}

{ #category : #accessing }
MFFile >> contents: aString [
contents := aString.
]

{ #category : #accessing }
MFFile >> initialize [
contents := ''.
]

{ #category : #accessing }
MFFile >> name: aString [
name := aString.
]

{ #category : #accessing }
MFFile >> parent [ ^parent
]

{ #category : #accessing }
MFFile >> parent: aDirectory [
parent := aDirectory.
]

{ #category : #accessing }
MFFile >> printOn: aStream [
parent ifNotNil: [ parent printOn: aStream ].
aStream << name.
]
