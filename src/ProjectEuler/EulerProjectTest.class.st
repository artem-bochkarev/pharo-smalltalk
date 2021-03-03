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
EulerProjectTest >> testFCoins [
|coins|
coins := #(1 2 5 10 20 50 100 200).

self assert: (euler fCoins: 2 coins: coins) equals: 2.
self assert: (euler fCoins: 5 coins: coins) equals: 4.
self assert: (euler fCoins: 4 coins: coins) equals: 3.

]

{ #category : #tests }
EulerProjectTest >> testId1 [

self assert: (euler id1: 10) equals: 23
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
EulerProjectTest >> testId28 [

self assert: (euler id28: 1) equals: 1.
self assert: (euler id28: 3) equals: 25.
self assert: (euler id28: 5) equals: 101.
]

{ #category : #tests }
EulerProjectTest >> testId29Slow [

self assert: (euler id29Slow: 5) equals: 15.

]

{ #category : #tests }
EulerProjectTest >> testId30 [

self assert: (euler id30: 200) equals: 73682.
]

{ #category : #tests }
EulerProjectTest >> testId31 [

self assert: (euler id31: 200) equals: 73682.
self should: [euler id31: 200] notTakeMoreThanMilliseconds: 1/2.
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
EulerProjectTest >> testIsSumOfDigitsPower [

self assert: ( euler is: 1634 sumOfDigitsPower: 4 ).
self assert: ( euler is: 8208  sumOfDigitsPower: 4 ).
self assert: ( euler is: 9474  sumOfDigitsPower: 4 ).

self deny: ( euler is: 9475  sumOfDigitsPower: 4 ).
self deny: ( euler is: 4947  sumOfDigitsPower: 4 ).
self deny: ( euler is: 4361  sumOfDigitsPower: 4 ).

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
