as yet unclassified
methodsPresentationOn: aComposite for: aMethodsList
	
	^ methodsPresentation := aComposite table
		display: [ aMethodsList sortWithBlock: [ :a :b | a inClass name < b inClass name ]  ];
		column: 'Class' evaluated: [ :aMethod | aMethod inClass name, '(', aMethod category asString, ')' ];
		column: 'Selector' evaluated: [ :aMethod | aMethod selector asString ];
		column: 'Category' evaluated: [ :aMethod | aMethod inClass category asString ];
		withRemoteCodeNavigationActionsForMethods