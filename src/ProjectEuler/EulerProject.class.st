"
This claass contains solutions for Euler project tasks : https://projecteuler.net/
"
Class {
	#name : #EulerProject,
	#superclass : #Object,
	#instVars : [
		'id31Array'
	],
	#category : #ProjectEuler
}

{ #category : #helpers }
EulerProject class >> nameValue: s [

^ (s asArray collect: [ :a | 1 + a asInteger - $A asInteger  ]) sum
]

{ #category : #helpers }
EulerProject >> can: a beSumOfTwoValues: vector [

^ self can: a beSumOfTwoValues: vector at: vector size
]

{ #category : #helpers }
EulerProject >> can: val beSumOfTwoValues: vector at: last [

| a b x y|
a := 1.
b := last.
[a <= b] whileTrue: [ 
	x := vector at: a.
	y := vector at: b.
	x + y = val ifTrue: [ ^true ].
	x + y < val ifTrue: [ a := a + 1. ] ifFalse: [ b := b - 1. ].
	].
^ false
]

{ #category : #helpers }
EulerProject >> fCoins: aValue [

| coins maxCoin |
coins := #(1 2 5 10 20 50 100 200).
coins do: [ :x | x < aValue ifTrue: [ maxCoin := x ] ].

aValue = 1 ifTrue: [ ^1 ].
aValue = 2 ifTrue: [ ^2 ].
aValue = 5 ifTrue: [ ^4 ].

]

{ #category : #helpers }
EulerProject >> fCoins: aValue coins: aCoins [

| dict |
dict := Dictionary new.
^self fCoins: aValue coins: aCoins precounted: dict




]

{ #category : #helpers }
EulerProject >> fCoins: aValue coins: aCoins precounted: aDict [

| sum |
(aDict includesKey: aValue) ifTrue: [ ^aDict at: aValue ].
aValue = 0 ifTrue: [ ^1 ].
aValue = 1 ifTrue: [ ^1 ].
aCoins = #(1) ifTrue: [ ^1 ].

sum := 0.
aCoins do: [ :x | x <= aValue ifTrue: [ |r|
		r := (self fCoins: aValue - x coins: (aCoins select: [ :a | a <= x ]) precounted: aDict ).
		sum := sum + r.
		]
		ifFalse: [ aDict add: aValue -> sum. ^sum ].
		x = aValue ifTrue:[ ].
	].
aDict add: aValue -> sum.
^sum




]

{ #category : #helpers }
EulerProject >> hasPandigitalProd: aValue [
| remSet |
remSet := '123456789' asSet difference: aValue asString asSet.
2 to: aValue sqrtFloor do: [ :x |	(aValue % x = 0) ifTrue: [
			(x asString, (aValue / x) asString) asSet = remSet ifTrue: [ ^true ]
	]
].
^false

]

{ #category : #problems }
EulerProject >> id1: value [ 
| n3 n5 n15 |
n3 := value + 3 - 1 // 3.
n5 := value + 5 - 1 // 5.
n15 := value + 15 - 1 // 15. 

n3 := (n3 * (n3 - 1) * 3) / 2.
n5 := (n5 * (n5 - 1) * 5) / 2.
n15 := (n15 * (n15 - 1) * 15) / 2.
^ n3 + n5 - n15.

]

{ #category : #problems }
EulerProject >> id22 [

| data sum |
data := 'C:\Users\Admin\Downloads\p022_names.txt' asFileReference contents substrings: ',.;"'.
data sort.
sum := 1.
data doWithIndex: [ :name :i | sum := sum + (i * (self class nameValue: name)) ].
^sum
]

{ #category : #problems }
EulerProject >> id23 [
|abundands sum|
sum := 66.
abundands := OrderedCollection new.
12 to: 28123 do: [ :a |
	a isAbundant ifTrue: [ abundands add: a ].
	(self can: a beSumOfTwoValues: abundands) ifFalse: [ sum := sum + a ].
	].
^sum


]

{ #category : #problems }
EulerProject >> id24 [

^self id24: 1000000 - 1
]

{ #category : #problems }
EulerProject >> id24: in [

| input n m x result |
input := #(0 1 2 3 4 5 6 7 8 9) asOrderedCollection.
n := in % 10 factorial.
result := WriteStream on: String new.
9 to: 0 by: -1 do: [ :k |
	x := k factorial.
	m := n // x + 1.
	n := n % x.
	result nextPut:  ((input at: m) asCharacterDigit ).
	input removeAt: m.
	].
^ result contents

]

{ #category : #problems }
EulerProject >> id25 [

| a b i c|
i := 12.
a := 89.
b := 144.
[ b asString size < 1000 ] whileTrue: [ 
	c := a + b.
	a := b.
	b := c.
	i := i + 1.
	 ].
^ i

]

{ #category : #problems }
EulerProject >> id26 [
"not true =)"
| a maxLen maxX  |

maxLen := 0.
maxX := 2.
2 to: 1000 do: [ :x |
	a := (1 / x) printAsDecimalFraction size.
	a > maxLen ifTrue: [ maxLen := a. maxX := x. ]
	 ].
^maxX
]

{ #category : #problems }
EulerProject >> id27 [

| primes a n maxN maxA maxB |
primes := self primeListUnder: 1000.
maxN := 0.
primes do: [ :b |
	a := 1 - b.
	a to: 1000 do: [ :aa |
		n := 1.
		[ (n ** 2 + (aa * n) + b) isPrime ] whileTrue: [ n := n + 1 ].
		n > maxN ifTrue: [ maxN := n. maxA := aa. maxB := b. ].
	].
].
Transcript show: 'n^2 ';
	show: maxA;
	show: '*n + ';
	show: maxB;
	cr.
^maxA * maxB
]

{ #category : #problems }
EulerProject >> id28: size [
| sum |
sum := 1.

self assert: size >= 1.
self assert: size odd.

3 to: size by: 2 do: [ :s |
	sum := sum + (4 * s * s)	- (6 * (s - 1)).
].
^ sum
]

{ #category : #problems }
EulerProject >> id29: aValue [

| hasPowers |
hasPowers := OrderedCollection new.
2 to: aValue do: [ :x |
	x * x <= aValue ifTrue: [hasPowers add: x].
	 ].
^hasPowers 
]

{ #category : #problems }
EulerProject >> id29Slow: aValue [

| powers |
powers := Set new.
2 to: aValue do: [ :x |
	2 to: aValue do: [ :y | powers add: x ** y  ].
	 ].
^powers size 
]

{ #category : #problems }
EulerProject >> id2: limit [ 
|a b sum|
a := 2.
b := 8.
sum := 0.
a < limit ifTrue: [ sum := 2 ].
b < limit ifTrue: [ sum := 10 ].
[ a + b < limit ] whileTrue: [ |c|
	c := 4 * b + a.
	sum := sum + c.
	a := b.
	b := c.
].
^sum


]

{ #category : #problems }
EulerProject >> id30 [

^ (self id30: 5) sum

]

{ #category : #problems }
EulerProject >> id30: n [
| x list |
x := 1.
[ (x * (9 ** n)) > (10 ** x) ] whileTrue: [ x := x + 1 ].
x := x - 1.

list := OrderedCollection new.
2 to: (x * (9 ** n)) do: [ :a |
	(self is: a sumOfDigitsPower: n) ifTrue: [ list add: a ].
	].
^list

]

{ #category : #problems }
EulerProject >> id31 [

^self id31_2: 200

]

{ #category : #problems }
EulerProject >> id31: amount [
id31Array := Array2D rows: amount + 1 columns: 8.
id31Array atAllPut: 0.
"id31Array atRow: 1  put: 1."
^self ways: amount maxCoin: 8

]

{ #category : #problems }
EulerProject >> id31_2: amount [ 

|ways coins|
coins := #(1 2 5 10 20 50 100 200).
ways := Array new: amount + 1.
ways atAllPut: 1.
2 to: 8 do: [ :j ||coin|
	coin := coins at: j.
	coin to: amount do: [ :i |
		ways at: i + 1 put: ( (ways at: i + 1) + (ways at: 1 + i - coin)  ).
		 ]
	 ].
^ways at: amount + 1.

]

{ #category : #problems }
EulerProject >> id32 [
| result |
result := 0.
1234 to: 9876 do: [ :x |	(self isPandigital: x) ifTrue: [
		(self hasPandigitalProd: x)	ifTrue: [ result := result + x ]	] ].
^result

]

{ #category : #problems }
EulerProject >> id35: anInteger [

^(2 to: anInteger) count: [:x| x isCircularPrime ]
]

{ #category : #helpers }
EulerProject >> is: aValue divisibleByAny: orderedCollection [

orderedCollection do: [ :x |
	aValue % x = 0 ifTrue: [ ^true ].
	x >= aValue sqrtFloor ifTrue: [ ^false ].
	 ].

^false
]

{ #category : #helpers }
EulerProject >> is: anInteger sumOfDigitsPower: aPower [

| b |
b := anInteger asString inject: 0 into: [ :sum :el | sum + (el digitValue ** aPower). ].
^ b = anInteger
]

{ #category : #helpers }
EulerProject >> isPandigital: aValue [
| set |
set := aValue asString asSet.
(set includes: $0) ifTrue: [ ^false ].
^aValue asString size = set size
]

{ #category : #helpers }
EulerProject >> largestPrimeFactor: aValue [

|a b maxFactor result |
a := aValue.
result := 1.
b := 2.
[ a % b = 0 ] whileTrue: [ a := a / b. result := b. ].
b := 3.
maxFactor := a sqrtFloor.
[ b < maxFactor ] whileTrue: [
	( a % b = 0 ) ifTrue: [ 
		[ a := a / b. result := b ] doWhileTrue: [ a % b = 0 ].
		maxFactor := a sqrtFloor.
	].
	b := b + 2.
].

^result max: a.
]

{ #category : #helpers }
EulerProject >> primeListUnder: n [

| list |
list := OrderedCollection new.
2 < n ifTrue: [list add: 2].
3 to: n by: 2 do: [ :x |
	(list anySatisfy: [ :each | x % each = 0  ]) ifFalse: [ list add: x ].
	 ].
^list
]

{ #category : #helpers }
EulerProject >> ways: amount maxCoin: coin [ 
|result list |
list := #(1 2 5 10 20 50 100 200).
amount = 0 ifTrue: [^1].
coin = 1 ifTrue: [^1].
(id31Array at: amount at: coin) > 0 ifTrue: [ ^ id31Array at: amount at: coin].
result := 0.
0 to: (amount // (list at: coin)) do: [ :i |
	result := result + (self ways: amount - (i * (list at: coin)) maxCoin: coin - 1).
	 ].
id31Array at: amount at: coin put: result.
^result

]
