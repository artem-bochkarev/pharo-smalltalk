Extension { #name : #Fraction }

{ #category : #'*ProjectEuler' }
Fraction >> printAsDecimalFraction [
| result a modulos s |
result := WriteStream on: String new.
result nextPutAll: ( (numerator // denominator) asString ).
a := numerator % denominator.
a > 0 ifFalse: [ ^result contents ].
modulos := Dictionary new.
result nextPut: $..
[ 
	modulos at: a put: result position.
	a := a * 10.
	result nextPutAll: ( (a // denominator) asString ).
	a := a % denominator.
] doWhileTrue: [ a > 0 and: (modulos includesKey: a) not ].

(modulos includesKey: a) ifTrue: [
	result nextPut: $).
	s := result contents.
	s := (s copyFrom: 1 to: (modulos at: a)), '(', (s copyFrom: (modulos at: a)).
	^s
	].

^result contents
]
