Class {
	#name : #EulerProjectTest,
	#superclass : #TestCase,
	#instVars : [
		'euler'
	],
	#category : #ProjectEuler
}

{ #category : #running }
EulerProjectTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
euler := EulerProject new.
]

{ #category : #tests }
EulerProjectTest >> testCanBeSumOfTwoValues [

self assert: (euler can: 24 beSumOfTwoValues: #(12 18 24)).

]

{ #category : #tests }
EulerProjectTest >> testDivisorPower [

self assert: (16 divisorPower: 2) equals: 4.
self assert: (100 divisorPower: 5) equals: 2.
]

{ #category : #tests }
EulerProjectTest >> testId22 [

self assert: euler id22 equals: 871198282
]

{ #category : #tests }
EulerProjectTest >> testId24 [

self assert: (euler id24: 0) equals: '0123456789'.
self assert: (euler id24: 1) equals: '0123456798'.
self assert: (euler id24: 2) equals: '0123456879'.
self assert: (euler id24: 3) equals: '0123456897'.
self assert: (euler id24: 4) equals: '0123456978'.
self assert: (euler id24: 5) equals: '0123456987'.
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
EulerProjectTest >> testPrintAsDecimalFraction [

self assert: (1/2) printAsDecimalFraction equals: '0.5'.
self assert: (1/3) printAsDecimalFraction equals: '0.(3)'.
self assert: (1/4) printAsDecimalFraction equals: '0.25'.
self assert: (1/5) printAsDecimalFraction equals: '0.2'.
self assert: (1/6) printAsDecimalFraction equals: '0.1(6)'.
self assert: (1/7) printAsDecimalFraction equals: '0.(142857)'.
self assert: (1/101) printAsDecimalFraction equals: '0.(0099)'.
self assert: (1/999) printAsDecimalFraction equals: '0.(001)'.

]

{ #category : #tests }
EulerProjectTest >> testProperDivisorSum [

self assert: 220 properDivisorSum equals: 284.
self assert: 284 properDivisorSum equals: 220.
self assert: 28 properDivisorSum equals: 28.

]
