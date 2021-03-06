*Glamour-FastTable
fastTableWithSearch
	<glmBrowser: 'Fast Table with search' input: '100'>
	"| f | 
	f := self new fastTableWithSearch.
	f openOn: 1000.
	(f panes first port: #selection) value: 1"
	| wrapper |	
	wrapper := GLMWrapper new.
	wrapper show: [:a | 
		a fastTable
			display: [ :x | 1 to: x ]; 
			column: [:x | 'Numbers from 1 to ', x asString] evaluated: #asString;
			column: 'Even' evaluated: [ :each | each even asString ];
			column: 'Odd' evaluated: [ :each | each odd asString ];
			enableSearch;
			allowDeselection ].
	^ wrapper