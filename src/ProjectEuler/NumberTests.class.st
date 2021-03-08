Class {
	#name : #NumberTests,
	#superclass : #TestCase,
	#category : #ProjectEuler
}

{ #category : #tests }
NumberTests >> testDivisorPower [

self assert: (16 divisorPower: 2) equals: 4.
self assert: (100 divisorPower: 5) equals: 2.
]

{ #category : #tests }
NumberTests >> testIsAbundant [

self assert: 12 isAbundant.
self deny: 28 isAbundant.
self assert: 220 isAbundant.
self deny: 284 isAbundant.

]

{ #category : #tests }
NumberTests >> testIsCircularPrime [
self assert: 13 isCircularPrime.
self assert: 31 isCircularPrime.
self assert: 2 isCircularPrime.
self assert: 3 isCircularPrime.
self assert: 79 isCircularPrime.
self assert: 197 isCircularPrime.
self assert: 971 isCircularPrime.
self assert: 719 isCircularPrime.
self deny: 78 isCircularPrime.
self assert: (( 2 to: 100) count: [ :x | x isCircularPrime  ] ) equals: 13.

]

{ #category : #tests }
NumberTests >> testIsDeficient [

self deny: 28 isDeficient.
self assert: 284 isDeficient.
self deny: 220 isDeficient.

]

{ #category : #tests }
NumberTests >> testIsPalindrome [

self assert: 202 isPalindrome.
self assert: 11 isPalindrome.
self assert: 777 isPalindrome.
self assert: 7777 isPalindrome.
self deny: 123 isPalindrome. 
self deny: 12 isPalindrome.
self deny: 103 isPalindrome.


]

{ #category : #tests }
NumberTests >> testIsPerfectNumber [

self assert: 28 isPerfectNumber.
self deny: 27 isPerfectNumber.
self deny: 220 isPerfectNumber.

]

{ #category : #tests }
NumberTests >> testIsTruncatablePrime [

self assert: 3797 isTruncatablePrime.
self assert: 37 isTruncatablePrime.
self assert: 73 isTruncatablePrime.
self deny: 3793 isTruncatablePrime.
self deny: 41 isTruncatablePrime.


]

{ #category : #tests }
NumberTests >> testPrimeDivisorList [

self assert: 2 primeDivisorList equals: #(2).
self assert: 3 primeDivisorList equals: #(3).
self assert: 13 primeDivisorList equals: #(13).
self assert: 6 primeDivisorList equals: #(2 3).
self assert: 72 primeDivisorList equals: #(2 3).
self assert: 39 primeDivisorList equals: #(3 13)
]

{ #category : #tests }
NumberTests >> testPrintAsDecimalFraction [

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
NumberTests >> testProperDivisorSum [

self assert: 220 properDivisorSum equals: 284.
self assert: 284 properDivisorSum equals: 220.
self assert: 28 properDivisorSum equals: 28.

]
