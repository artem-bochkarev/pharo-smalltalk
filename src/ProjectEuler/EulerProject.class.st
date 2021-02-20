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
EulerProject >> id22 [

| data sum |
data := 'C:\Users\Admin\Downloads\p022_names.txt' asFileReference contents substrings: ',.;"'.
data sort.
sum := 0.
data doWithIndex: [ :name :i | sum := sum + (i * (self class nameValue: name)) ].
^sum
]
