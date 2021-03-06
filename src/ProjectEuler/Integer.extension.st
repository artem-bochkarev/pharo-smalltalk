Extension { #name : #Integer }

{ #category : #'*ProjectEuler' }
Integer >> divisorPower: anInteger [
|k result|
k := self.
result := 0.
[ k % anInteger = 0 ] whileTrue: [ k := k / anInteger. result := result + 1. ].
^result
]

{ #category : #'*ProjectEuler' }
Integer >> isAbundant [

^ self properDivisorSum > self.
]

{ #category : #'*ProjectEuler' }
Integer >> isCircularPrime [
| len m c|
len := self asString size.
m := 10 ** (len - 1).
c := self deepCopy.
^((1 to: len) collect: [ :i | c := (c * 10 + (c // m)) % (10 * m).  c ]) allSatisfy: [ :x | x isPrime ].
]

{ #category : #'*ProjectEuler' }
Integer >> isDeficient [

^ self properDivisorSum < self.
]

{ #category : #'*ProjectEuler' }
Integer >> isPerfectNumber [

^ self properDivisorSum = self.
]

{ #category : #'*ProjectEuler' }
Integer >> millions [
^self * 1000000
]

{ #category : #'*ProjectEuler' }
Integer >> nextPermutation [

| i str j c |
str := self asString.
i := str size.
[ i > 1 and: [ (str at: i) < (str at: i - 1) ] ] whileTrue: [ i := i - 1 ].
j := str size.
[ j > 1 and: [ (str at: j) > (str at: i) ] ] whileTrue: [ j := j - 1 ].
c := str at: i.
str at: i put: (str at: j).
str at: j put: c.
str 

]

{ #category : #'*ProjectEuler' }
Integer >> primeDivisorList [

| list k |
list := OrderedCollection new.
k := self.
k even ifTrue: [ list add: 2 ].
[ k % 2 = 0 ] whileTrue: [ k := k / 2 ].
3 to: k sqrtFloor by: 2 do: [ :a |
	k % a = 0 ifTrue: [list add: a].
	[ k % a = 0 ] whileTrue: [ k := k / a ].
	k = 1 ifTrue: [ ^ list asArray ]
	].
k > 1 ifTrue: [ list add: k ].
^ list asArray
]

{ #category : #'*ProjectEuler' }
Integer >> properDivisorSum [

| divisors powers sum |
divisors := self primeDivisorList reject: [ :a | a = self ].
powers := Array new: divisors size.
divisors doWithIndex: [ :d :i | powers at: i put: (self divisorPower: d) ].
sum := 1.
divisors doWithIndex: [ :d :i | sum := sum * ((d ** ((powers at: i) + 1) - 1) / (d - 1)) ].
sum := sum - self.
^ sum
]
