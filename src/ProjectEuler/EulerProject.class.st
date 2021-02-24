"
This claass contains solutions for Euler project tasks : https://projecteuler.net/
"
Class {
	#name : #EulerProject,
	#superclass : #Object,
	#category : #ProjectEuler
}

{ #category : #helpers }
EulerProject class >> nameValue: s [

^ (s asArray collect: [ :a | 1 + a asInteger - $A asInteger  ]) sum
]

{ #category : #problems }
EulerProject >> can: a beSumOfTwoValues: vector [

^ self can: a beSumOfTwoValues: vector at: vector size
]

{ #category : #problems }
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
result := String new.
9 to: 0 by: -1 do: [ :k |
	x := k factorial.
	m := n // x + 1.
	n := n % x.
	result := result, (input at: m) asString.
	input removeAt: m.
	].
^ result

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
1000 to: 1 by: -1 do: [ :i |
	i isPrime ifTrue: [ ^ i ] ].
^1

]