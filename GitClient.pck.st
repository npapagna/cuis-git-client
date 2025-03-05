'From Cuis7.3 [latest update: #7062] on 5 March 2025 at 2:06:46 pm'!
'Description Refactors'!
!provides: 'GitClient' 1 3!
!requires: 'CommandShell' 1 2 nil!
!requires: 'OSProcess' 1 36 nil!
SystemOrganization addCategory: #'GitClient-Model'!
SystemOrganization addCategory: #'GitClient-UI'!
SystemOrganization addCategory: #GitClient!


!classDefinition: #GitCodePackageFile category: #GitClient!
Object subclass: #GitCodePackageFile
	instanceVariableNames: 'commit codePackage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient'!
!classDefinition: 'GitCodePackageFile class' category: #GitClient!
GitCodePackageFile class
	instanceVariableNames: ''!

!classDefinition: #GitCodePackageFile2 category: #GitClient!
Object subclass: #GitCodePackageFile2
	instanceVariableNames: 'codePackagePath commit codePackage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient'!
!classDefinition: 'GitCodePackageFile2 class' category: #GitClient!
GitCodePackageFile2 class
	instanceVariableNames: ''!

!classDefinition: #GitCodePackageFileHistory category: #GitClient!
Object subclass: #GitCodePackageFileHistory
	instanceVariableNames: 'codepackages'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient'!
!classDefinition: 'GitCodePackageFileHistory class' category: #GitClient!
GitCodePackageFileHistory class
	instanceVariableNames: ''!

!classDefinition: #GitCompiledMethodHistory category: #GitClient!
Object subclass: #GitCompiledMethodHistory
	instanceVariableNames: 'compiledMethod gitCodePackages'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient'!
!classDefinition: 'GitCompiledMethodHistory class' category: #GitClient!
GitCompiledMethodHistory class
	instanceVariableNames: ''!

!classDefinition: #GitPackage category: #GitClient!
Object subclass: #GitPackage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient'!
!classDefinition: 'GitPackage class' category: #GitClient!
GitPackage class
	instanceVariableNames: 'packageFilePath'!

!classDefinition: #GitSourceCodeModel category: #GitClient!
Object subclass: #GitSourceCodeModel
	instanceVariableNames: 'selectedCommitIndex sourceCodeHistory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient'!
!classDefinition: 'GitSourceCodeModel class' category: #GitClient!
GitSourceCodeModel class
	instanceVariableNames: ''!

!classDefinition: #FileLogModel category: #'GitClient-Model'!
Object subclass: #FileLogModel
	instanceVariableNames: 'filePath commits selectedIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-Model'!
!classDefinition: 'FileLogModel class' category: #'GitClient-Model'!
FileLogModel class
	instanceVariableNames: ''!

!classDefinition: #GitClient category: #'GitClient-Model'!
Object subclass: #GitClient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-Model'!
!classDefinition: 'GitClient class' category: #'GitClient-Model'!
GitClient class
	instanceVariableNames: ''!

!classDefinition: #GitCommit category: #'GitClient-Model'!
Object subclass: #GitCommit
	instanceVariableNames: 'commitHash author date message gitClient'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-Model'!
!classDefinition: 'GitCommit class' category: #'GitClient-Model'!
GitCommit class
	instanceVariableNames: ''!

!classDefinition: #GitCommitParser category: #'GitClient-Model'!
Object subclass: #GitCommitParser
	instanceVariableNames: 'readStream gitClient'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-Model'!
!classDefinition: 'GitCommitParser class' category: #'GitClient-Model'!
GitCommitParser class
	instanceVariableNames: ''!

!classDefinition: #GitClientMenus category: #'GitClient-UI'!
Object subclass: #GitClientMenus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitClientMenus class' category: #'GitClient-UI'!
GitClientMenus class
	instanceVariableNames: ''!

!classDefinition: #GitLogWindow category: #'GitClient-UI'!
SystemWindow subclass: #GitLogWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitLogWindow class' category: #'GitClient-UI'!
GitLogWindow class
	instanceVariableNames: ''!

!classDefinition: #GitSourceCodeWindow category: #'GitClient-UI'!
SystemWindow subclass: #GitSourceCodeWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitSourceCodeWindow class' category: #'GitClient-UI'!
GitSourceCodeWindow class
	instanceVariableNames: ''!

!classDefinition: #GitCodePackageListWindow category: #'GitClient-UI'!
CodePackageListWindow subclass: #GitCodePackageListWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitCodePackageListWindow class' category: #'GitClient-UI'!
GitCodePackageListWindow class
	instanceVariableNames: ''!


!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 02:28:59'!
author
	
	^ commit author! !

!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 10:15:12'!
commit
	
	^commit! !

!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 02:27:35'!
commit: aGitCommit package: aCodePackageFile 
	
	commit := aGitCommit.
	codePackage := aCodePackageFile! !

!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 02:28:50'!
commitHash
	
	^ commit commitHash ! !

!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 02:29:19'!
date
	
	^ commit date! !

!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 02:28:05'!
includesSelector: aSymbol in: aSymbol2 
	
	^ (codePackage classNamed: aSymbol2)
		includesSelector: aSymbol! !

!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 09:06:50'!
includesUpToDateSelector: aSymbol in: aSymbol2 
	
	^ codePackage includesUpToDateSelector: aSymbol in: aSymbol2! !

!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 02:29:28'!
message
	
	^ commit message! !

!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 08:59:32'!
removeUpToDateMethods
	
	codePackage classes do: [ :aPseudoClass |
		aPseudoClass removeUpToDateMethods.
		aPseudoClass theMetaClass removeUpToDateMethods ]! !

!GitCodePackageFile methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 02:32:11'!
sourceCodeOf: aSymbol in: aSymbol2 
	
	^ (codePackage classNamed: aSymbol2)
		sourceCodeAt: aSymbol ! !

!GitCodePackageFile class methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 08:55:34'!
cm: cc at: filePath 
	
	| cp |
	cp := CodePackageFile
		at: filePath
		contents: (cc contentsOfFile: filePath) readStream.
		
		
		"cp classes do: [ :aPseudoClass |
		aPseudoClass removeUpToDateMethods.
		aPseudoClass theMetaClass removeUpToDateMethods ]."
	
	^ self new commit: cc package: cp! !

!GitCodePackageFile2 methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:41:16'!
codePackage
	
	^ codePackage ifNil: [
		codePackage := CodePackageFile
			at: codePackagePath
			contents: (commit contentsOfFile: codePackagePath) readStream 
		]! !

!GitCodePackageFile2 methodsFor: 'as yet unclassified' stamp: 'NPM 3/5/2025 14:02:06'!
commit
	
	^ commit! !

!GitCodePackageFile2 methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:39:20'!
initializeAt: aFilePath commit: aCommit 
	
	codePackagePath := aFilePath.
	commit := aCommit! !

!GitCodePackageFile2 class methodsFor: 'instance creation' stamp: 'NPM 3/4/2025 12:38:49'!
at: aFilePath commit: aCommit 
	
	^ self new
		initializeAt: aFilePath
		commit: aCommit! !

!GitCodePackageFileHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:42:09'!
findIndexOfCurrentVersionOfSelection: aSelector inClassNamed: aClassName in: codePackages

	^ codePackages findLast: [ :codePackageCommit | codePackageCommit codePackage includesUpToDateSelector: aSelector in: aClassName ]! !

!GitCodePackageFileHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 10:10:39'!
historyOfCompiledMethod: aCompiledMethod 
	
	^ GitCompiledMethodHistory for: aCompiledMethod withAll: (
		self historyOfSelector: aCompiledMethod selector inClassNamed: aCompiledMethod methodClass name
	)! !

!GitCodePackageFileHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 10:08:35'!
historyOfSelector: aSelector inClassNamed: aClassName 
	
	| codePackages currentVersionIndex |
	codePackages := self
		packagesIncluding: aSelector
		inClassNamed: aClassName.
	
	currentVersionIndex := self
		findIndexOfCurrentVersionOfSelection: aSelector
		inClassNamed: aClassName
		in: codePackages.
	
	^ codePackages
		copyFrom: currentVersionIndex
		to: codePackages size
	
	! !

!GitCodePackageFileHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 09:38:45'!
initializeWithAll: anOrderedCollection 
	
	codepackages := anOrderedCollection! !

!GitCodePackageFileHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:40:00'!
packagesIncluding: aSelector inClassNamed: aClassName

	^ codepackages select: [ :codePackageCommit | codePackageCommit codePackage includesSelector: aSelector in: aClassName ] ! !

!GitCodePackageFileHistory class methodsFor: 'error handling' stamp: 'NPM 3/4/2025 12:39:36'!
at: aCodePackageFilePath

	| commits |
	commits := (GitClient new fileLog: aCodePackageFilePath) collect: [ :commit | GitCodePackageFile2 at: aCodePackageFilePath commit: commit ].
		
	
	^ self new initializeWithAll:  commits! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/5/2025 14:01:43'!
collectCommits: aBlock 
	
	^ gitCodePackages collect: [ :gcp  | aBlock value: gcp commit  ]! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 11:59:33'!
compareLatestVersionWithCommitAt: anIndex 
	
	^ DifferenceFinder
				displayPatchFrom: self latestSourceCodeVersion
				to: (self sourceCodeFromCommitAt: anIndex)
				tryWords: true
				prettyPrintedIn: compiledMethod methodClass! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 10:12:43'!
for: aCompiledMethod withAll: aCollectionOfGitCodePackages 
	
	compiledMethod := aCompiledMethod.
	gitCodePackages := aCollectionOfGitCodePackages! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 11:56:30'!
latestSourceCodeVersion
	
	^ compiledMethod sourceCode! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/5/2025 14:03:50'!
sourceCodeFromCommitAt: anIndex

	^ (gitCodePackages at: anIndex) codePackage sourceCodeOf: compiledMethod selector in: compiledMethod methodClass name! !

!GitCompiledMethodHistory class methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:42:27'!
for: aSymbol2 withAll: anOrderedCollection 
	
	^ self new
		for: aSymbol2 withAll: anOrderedCollection ! !

!GitPackage class methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 09:29:56'!
changesTo: aSelector in: aClassName 
	
	| cm |
	cm := self codePackages.
	! !

!GitPackage class methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 09:30:03'!
codePackages
	self shouldBeImplemented.! !

!GitPackage class methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 09:29:17'!
commits
	
	^ GitClient new fileLog: packageFilePath.! !

!GitPackage class methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 09:26:19'!
fromPackageNamed: aPackageName 
	
	^ self open: (CodePackage installedPackages at: aPackageName) fullFileName! !

!GitPackage class methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 09:26:54'!
initializeAt: aPackageFilePath 
	
	packageFilePath := aPackageFilePath! !

!GitPackage class methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 09:26:40'!
open: aPackageFilePath 
	
	^ self initializeAt: aPackageFilePath! !

!GitSourceCodeModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:04:58'!
commits
	
	^ sourceCodeHistory collectCommits: [ :commit |
		commit commitHash, ' ', commit author, ' ', commit date, ' ', commit message ]! !

!GitSourceCodeModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:05:02'!
initializeSourceCodeHistory: aSourceCodeHistory 
	
	sourceCodeHistory := aSourceCodeHistory! !

!GitSourceCodeModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:01:50'!
selectCommitAt: anIndex

	selectedCommitIndex := anIndex.
	
	self changed: #sourceCode! !

!GitSourceCodeModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:04:58'!
selectedCommit
	
	^ sourceCodeHistory at: selectedCommitIndex! !

!GitSourceCodeModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:00:24'!
selectedCommitIndex
	
	^ selectedCommitIndex ifNil: [ selectedCommitIndex := 0 ]! !

!GitSourceCodeModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:04:58'!
sourceCode
	
	selectedCommitIndex = 0 ifTrue: [ ^ sourceCodeHistory latestSourceCodeVersion ].
	

	^ sourceCodeHistory compareLatestVersionWithCommitAt: selectedCommitIndex
	
	! !

!GitSourceCodeModel class methodsFor: 'instance creation' stamp: 'NPM 3/4/2025 12:12:51'!
forCompiledMethod: aCompiledMethod 
	
	^ self sourceCodeHistory: aCompiledMethod gitHistory! !

!GitSourceCodeModel class methodsFor: 'instance creation' stamp: 'NPM 3/4/2025 12:05:50'!
sourceCodeHistory: aSourceCodeHistory 
	
	^ self new
		initializeSourceCodeHistory: aSourceCodeHistory! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 01:39:02'!
commits
	
	^ commits collect: [ :commit | commit commitHash, ' ', commit author, ' ', commit date, ' ', commit message ]! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 01:47:08'!
compareWithSelectedVersion

	| codePackage |
	
	codePackage := CodePackageFile
		at: filePath
		contents: (self selectedCommit contentsOfFile: filePath) readStream.
	
	(CodeFileBrowser browseCodeSource: codePackage)
		removeUpToDate! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 01:36:56'!
initializeFor: aFilePath log: aCollectionOfGitCommits
	
	filePath := aFilePath.
	commits := aCollectionOfGitCommits.! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 01:39:32'!
selectedCommit
	
	^ commits at: selectedIndex! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 02:16:58'!
selectedIndex
	
	^ selectedIndex ifNil: [ selectedIndex := 0 ]! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:42:16'!
selectedIndex: anIndex 
	
	selectedIndex := anIndex.
	
	anIndex > 0 ifTrue: [ self compareWithSelectedVersion ]! !

!FileLogModel class methodsFor: 'instance creation' stamp: 'NPM 3/3/2025 01:38:03'!
for: aFilePath log: aCollectionOfCommits

	^ self new
		initializeFor: aFilePath
		log: aCollectionOfCommits! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 01:32:20'!
contentsOfFile: aFilePath at: aCommitHash 
	
	| file |
	file := aFilePath asFileEntry.
	
	^ self
		outputOfGitCommand: 'show ', aCommitHash,':./', file name
		on: file parent asString! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 01:35:51'!
fileLog: aFilePath

	| commandOutput |
	commandOutput := self outputOfGitLogCommandForFile: aFilePath.
	
	^ GitCommitParser parseAllIn: commandOutput for: self! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 3/2/2025 10:05:13'!
outputOfGitCommand: aCommand on: aDirectoryPath

	^ OSProcess outputOf: 'git -C ', aDirectoryPath ,' ', aCommand! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 3/5/2025 13:42:44'!
outputOfGitLogCommandForFile: aFilePath

	^ self
		outputOfGitCommand: ' --no-pager log --follow -- ', aFilePath asFileEntry name
		on: aFilePath asFileEntry parent pathName! !

!GitCommit methodsFor: 'accessing' stamp: 'NPM 2/28/2025 13:14:25'!
author
	
	^ author! !

!GitCommit methodsFor: 'accessing' stamp: 'NPM 3/2/2025 10:55:40'!
commitHash
	
	^ commitHash! !

!GitCommit methodsFor: 'accessing' stamp: 'NPM 2/28/2025 13:14:31'!
date

	^ date! !

!GitCommit methodsFor: 'accessing' stamp: 'NPM 2/28/2025 13:14:39'!
message
	 
	^ message! !

!GitCommit methodsFor: 'initialization' stamp: 'NPM 3/2/2025 10:56:13'!
initializeCommitHash: aCommitHash author: anAuthor date: aDate message: aMessage with: aGitClient 
	
	commitHash := aCommitHash.
	author := anAuthor.
	date := aDate.
	message := aMessage.
	gitClient := aGitClient! !

!GitCommit methodsFor: 'reading' stamp: 'NPM 3/3/2025 01:30:44'!
contentsOfFile: aFilePath 

	^ gitClient contentsOfFile: aFilePath at: self commitHash! !

!GitCommit methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:28:25'!
codePackage
	self shouldBeImplemented.! !

!GitCommit class methodsFor: 'instance creation' stamp: 'NPM 3/3/2025 01:28:15'!
commitHash: aCommitHash author: anAuthor date: aDate message: aMessage with: aGitClient 
	
	^ self new
		initializeCommitHash: aCommitHash
		author: anAuthor
		date: aDate
		message: aMessage
		with: aGitClient ! !

!GitCommitParser methodsFor: 'assertions' stamp: 'NPM 3/2/2025 10:29:19'!
assertNextWordIs: aWord

	^ self assert: aWord = (readStream upTo: Character space)! !

!GitCommitParser methodsFor: 'evaluating' stamp: 'NPM 3/3/2025 01:27:49'!
parseCommit

	^ GitCommit
		commitHash: self parseCommitHash
		author: self parseCommitAuthor
		date: self parseCommitDate
		message: self parseCommitMessage
		with: gitClient! !

!GitCommitParser methodsFor: 'evaluating' stamp: 'NPM 3/2/2025 10:36:30'!
parseCommits

	| commits |
	commits := OrderedCollection new.
	
	[ readStream atEnd] whileFalse: [ commits add: self parseCommit ].
	
	^ commits! !

!GitCommitParser methodsFor: 'initialization' stamp: 'NPM 3/2/2025 10:32:37'!
initializeToParse: aReadStream for: aGitClient 
	
	readStream := aReadStream.
	gitClient := aGitClient.! !

!GitCommitParser methodsFor: 'parsing' stamp: 'NPM 3/2/2025 10:31:10'!
parseCommitAuthor

	^ self parseValueOfCommitFieldNamed: 'Author:'! !

!GitCommitParser methodsFor: 'parsing' stamp: 'NPM 3/2/2025 10:31:15'!
parseCommitDate

	^ self parseValueOfCommitFieldNamed: 'Date:'! !

!GitCommitParser methodsFor: 'parsing' stamp: 'NPM 3/5/2025 13:28:48'!
parseCommitHash 

	^ self parseValueOfCommitFieldNamed: 'commit'! !

!GitCommitParser methodsFor: 'parsing' stamp: 'NPM 3/5/2025 13:53:12'!
parseCommitMessage

	| commitMessagex nextLine |
	readStream nextLine.
	commitMessagex := readStream nextLine .
	
	nextLine := nil.
	[ | currentPosition |
		currentPosition :=readStream position.
		nextLine := readStream nextLine.
		(nextLine notNil and: [ nextLine beginsWith: 'commit '])
			ifTrue: [ readStream position: currentPosition. false ]
			ifFalse: [ nextLine notNil ]
	] whileTrue.

	^ commitMessagex ! !

!GitCommitParser methodsFor: 'parsing' stamp: 'NPM 3/2/2025 10:30:41'!
parseValueOfCommitFieldNamed: aName

	self assertNextWordIs: aName.
	
	^ self readToLineEnd! !

!GitCommitParser methodsFor: 'parsing' stamp: 'NPM 3/2/2025 10:30:00'!
readToLineEnd

	^ readStream upTo: Character newLineCharacter! !

!GitCommitParser class methodsFor: 'instance creation' stamp: 'NPM 3/2/2025 10:27:42'!
on: aReadStream for: aGitClient

	^ self new
		initializeToParse: aReadStream readStream
		for: aGitClient! !

!GitCommitParser class methodsFor: 'parsing' stamp: 'NPM 3/2/2025 10:52:34'!
parseAllIn: aReadStream for: aGitClient 
	
	^ (self on: aReadStream for: aGitClient) parseCommits! !

!GitClientMenus class methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 01:51:29'!
initialize

	BrowserWindow at: #messageListMenuSpec registerMenuAndShortcutsSpecProvider:
		(MessageSend receiver: self selector: #messageListMenuSpec).! !

!GitClientMenus class methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 01:52:28'!
messageListMenuSpec
	
	^#(
		#(75		'Git history' 				nil 	model 			gitHistoryOfSelectedMethod 									weatherFewCloudsIcon)
	)! !

!GitLogWindow methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 09:02:11'!
buildMorphicWindow
	
	layoutMorph addMorphUseAll: (
		PluggableListMorph
			withModel: model
			listGetter: #commits
			indexGetter: #selectedIndex
			indexSetter: #selectedIndex: )! !

!GitLogWindow class methodsFor: 'instance creation' stamp: 'NPM 3/3/2025 01:37:31'!
openOnFile: aFilePath 
	
	| commits model gitClient |
	
	
	gitClient := GitClient new.
	
	
	
	
	
	commits := gitClient fileLog: aFilePath.
	model := FileLogModel for: aFilePath log: commits.
	
	self open: model label: 'Git log: ', aFilePath! !

!GitSourceCodeWindow methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 11:47:22'!
buildMorphicWindow
	

	layoutMorph addMorphUseAll: (PluggableListMorph withModel: model listGetter: #commits indexGetter: #selectedCommitIndex indexSetter: #selectCommitAt:).
	layoutMorph addMorphUseAll: (
	


	(TextModelMorph
		textProvider: model
		textGetter: #sourceCode) emptyTextDisplayMessage: 'Selection detail (no change selected?)'
	
	)! !

!GitSourceCodeWindow class methodsFor: 'as yet unclassified' stamp: 'NPM 3/4/2025 12:13:43'!
openCompiledMethod: aCompiledMethod 
	
	^ self
		open: (GitSourceCodeModel forCompiledMethod: aCompiledMethod)
		label: 'Git log: ', aCompiledMethod classAndSelector! !

!GitCodePackageListWindow methodsFor: 'GUI building' stamp: 'NPM 2/28/2025 02:05:50'!
buildButtonPane

	| b |
	b := super buildButtonPane.
	
	b addMorph: (
	PluggableButtonMorph 
							model: self 
							action: #showGitHistory 
							label: 'git history'
	).
	
	^ b! !

!GitCodePackageListWindow methodsFor: 'git' stamp: 'NPM 2/28/2025 13:38:27'!
showGitHistory

	GitLogWindow openOnFile: model selection fullFileName! !

!GitCodePackageListWindow class methodsFor: 'instance creation' stamp: 'NPM 2/28/2025 02:05:33'!
open
	
	self open: CodePackageList new! !

!GitCodePackageListWindow class methodsFor: 'menu-world' stamp: 'NPM 2/28/2025 08:53:59'!
worldMenuOptions
	^ {{
			#submenuOf		-> 		TheWorldMenu openLabel.
			#itemGroup 		-> 		40.
			#itemOrder 		-> 		30.
			#label 				-> 		'Git Client'.
			#object 			-> 		self.
			#selector 			-> 		#open.
			#icon 				-> 		#packageIcon.
		} asDictionary}! !

!CompiledMethod methodsFor: '*GitClient' stamp: 'NPM 3/4/2025 10:08:07'!
gitHistory
	
	^ self methodClass package gitHistory
		historyOfCompiledMethod: self! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 3/5/2025 14:00:20'!
gitHistoryOfSelectedMethod
	self halt.
	GitSourceCodeWindow openCompiledMethod: self currentCompiledMethod! !

!CodePackage methodsFor: '*GitClient' stamp: 'NPM 3/4/2025 09:37:03'!
gitHistory
	
	^ GitCodePackageFileHistory at: fullFileName 
	! !

!CodePackageFile methodsFor: '*GitClient' stamp: 'NPM 3/4/2025 12:31:41'!
includesSelector: aSelector in: aClassName 
	
	^ classes
		at: aClassName
		ifPresent: [ :class |  class includesSelector: aSelector ]
		ifAbsent: [ ^ false ]! !

!CodePackageFile methodsFor: '*GitClient' stamp: 'NPM 3/4/2025 09:16:06'!
includesUpToDateSelector: aSelector in: aClassName 
	
	| class pseudoSourceCode realClass realSourceCode |
	class := classes at: aClassName ifAbsent:[ ^ false ].
	(class includesSelector: aSelector) ifFalse: [ ^ false ].
	
	realClass := class realClass ifNil: [^ false ].
	realSourceCode := realClass sourceCodeAt: aSelector ifAbsent: [ ^ false ].
	pseudoSourceCode := class sourceCodeAt: aSelector.
	^ realSourceCode = pseudoSourceCode ! !

!CodePackageFile methodsFor: '*GitClient' stamp: 'NPM 3/5/2025 14:04:14'!
sourceCodeOf: aSymbol in: aSymbol2 
	
	^(self classNamed: aSymbol2)
		sourceCodeAt: aSymbol ! !

!CodePackageFile class methodsFor: '*GitClient' stamp: 'NPM 2/28/2025 13:21:23'!
at: aFilePath contents: aReadStream

	| file |
	file := aFilePath asFileEntry.
	
	^ self new
		buildFileStream: aReadStream
		packageName: (CodePackageFile packageNameFrom: file pathName)
		fullName: file pathName! !
GitClientMenus initialize!
