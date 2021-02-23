Class {
	#name : #EulerProjectTest,
	#superclass : #TestCase,
	#category : #ProjectEuler
}

{ #category : #tests }
EulerProjectTest >> testCanBeSumOfTwoValues [

|euler|
euler := EulerProject new.

self assert: (euler can: 24 beSumOfTwoValues: #(12 18 24)).

]

{ #category : #tests }
EulerProjectTest >> testDivisorPower [

self assert: (16 divisorPower: 2) equals: 4.
self assert: (100 divisorPower: 5) equals: 2.
]

{ #category : #tests }
EulerProjectTest >> testId22 [

self assert: EulerProject new id22 equals: 871198282
]

{ #category : #tests }
EulerProjectTest >> testIsAbundant [

self assert: 12 isAbundant.
self deny: 28 isAbundant.
self assert: 220 isAbundant.
self deny: 284 isAbundant.

]

{ #category : #tests }
EulerProjectTest >> testIsDeficient [

self deny: 28 isDeficient.
self assert: 284 isDeficient.
self deny: 220 isDeficient.

]

{ #category : #tests }
EulerProjectTest >> testIsPerfectNumber [

self assert: 28 isPerfectNumber.
self deny: 27 isPerfectNumber.
self deny: 220 isPerfectNumber.

]

{ #category : #tests }
EulerProjectTest >> testNameValue [

	self assert: (EulerProject nameValue: 'COLIN') equals: 53.
	self assert: (EulerProject nameValue: 'COL') equals: 30.
	self assert: (EulerProject nameValue: 'C') equals: 3.
]

{ #category : #tests }
EulerProjectTest >> testPrimeDivisorList [

self assert: 2 primeDivisorList equals: #(2).
self assert: 3 primeDivisorList equals: #(3).
self assert: 13 primeDivisorList equals: #(13).
self assert: 6 primeDivisorList equals: #(2 3).
self assert: 72 primeDivisorList equals: #(2 3).
self assert: 39 primeDivisorList equals: #(3 13)
]

{ #category : #tests }
EulerProjectTest >> testProperDivisorSum [

self assert: 220 properDivisorSum equals: 284.
self assert: 284 properDivisorSum equals: 220.
self assert: 28 properDivisorSum equals: 28.

]
