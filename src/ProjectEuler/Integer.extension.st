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
sum := 0.
divisors doWithIndex: [ :d :i | sum := sum + ((d ** (powers at: i) - 1) / (d - 1)) ].
^ sum
]
