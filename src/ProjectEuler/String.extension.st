Extension { #name : #String }

{ #category : #'*ProjectEuler' }
String >> isPalindrome [
|len|
len := self size.
1 to: len // 2 do: [  :i |
  (	self at: i) ~= (self at: len + 1 - i) ifTrue: [ ^false ]
	].
^true
]
