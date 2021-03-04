Class {
	#name : #MFDirectory,
	#superclass : #Object,
	#instVars : [
		'parent',
		'name',
		'contents'
	],
	#category : #MyFS
}

{ #category : #initialization }
MFDirectory >> addElement: anElement [
anElement parent: self.
contents add: anElement.
]

{ #category : #initialization }
MFDirectory >> children [ 
^contents 
]

{ #category : #initialization }
MFDirectory >> initialize [
contents := OrderedCollection new.
]

{ #category : #initialization }
MFDirectory >> name: aString [
name := aString.
]

{ #category : #initialization }
MFDirectory >> parent [
^parent
]

{ #category : #initialization }
MFDirectory >> parent: aDirectory [
parent := aDirectory.
]

{ #category : #printing }
MFDirectory >> printOn: aStream [
parent ifNotNil: [ parent printOn: aStream ].
aStream << name.
aStream << '/'.
]
