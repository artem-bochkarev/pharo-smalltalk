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
EulerProjectTest >> testFCoins [
|coins|
coins := #(1 2 5 10 20 50 100 200).

self assert: (euler fCoins: 2 coins: coins) equals: 2.
self assert: (euler fCoins: 5 coins: coins) equals: 4.
self assert: (euler fCoins: 4 coins: coins) equals: 3.

]

{ #category : #tests }
EulerProjectTest >> testHasPandigitalProd [

self assert: (euler hasPandigitalProd: 7254).
 
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
EulerProjectTest >> testIsPandigital [

self assert: (euler isPandigital: 12345).
self deny: (euler isPandigital: 123451).
self deny: (euler isPandigital: 100).
self deny: (euler isPandigital: 99).
self assert: (euler isPandigital: 123456789).
"we face 1 to 9 here"
self deny: (euler isPandigital: 1234567890).
self deny: (euler isPandigital: 10).
 
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
EulerProjectTest >> testLargestPrimeFactor [

self assert: (euler largestPrimeFactor: 13195 ) equals: 29.
self assert: (euler largestPrimeFactor: 600851475143 ) equals: 6857.
 
]

{ #category : #tests }
EulerProjectTest >> testNameValue [

	self assert: (EulerProject nameValue: 'COLIN') equals: 53.
	self assert: (EulerProject nameValue: 'COL') equals: 30.
	self assert: (EulerProject nameValue: 'C') equals: 3.
]
