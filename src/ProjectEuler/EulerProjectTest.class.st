Class {
	#name : #EulerProjectTest,
	#superclass : #TestCase,
	#category : #ProjectEuler
}

{ #category : #tests }
EulerProjectTest >> testId22 [

self assert: EulerProject new id22 equals: 871198282
]

{ #category : #tests }
EulerProjectTest >> testNameValue [

	self assert: (EulerProject nameValue: 'COLIN') equals: 53.
	self assert: (EulerProject nameValue: 'COL') equals: 30.
	self assert: (EulerProject nameValue: 'C') equals: 3.
]
