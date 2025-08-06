'From Cuis7.5 [latest update: #7398] on 6 August 2025 at 12:11:47 pm'!
'Description Compare with selected revision'!
!provides: 'GitClient' 1 27!
!requires: 'CommandShell' 1 2 nil!
!requires: 'OSProcess' 1 36 nil!
SystemOrganization addCategory: #GitClient!
SystemOrganization addCategory: #'GitClient-Model'!
SystemOrganization addCategory: #'GitClient-UI'!


!classDefinition: #GitCompiledMethodHistory category: #GitClient!
Object subclass: #GitCompiledMethodHistory
	instanceVariableNames: 'compiledMethod gitCodePackageFileHistory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient'!
!classDefinition: 'GitCompiledMethodHistory class' category: #GitClient!
GitCompiledMethodHistory class
	instanceVariableNames: ''!

!classDefinition: #GitUncommitedCodePackage category: #GitClient!
Object subclass: #GitUncommitedCodePackage
	instanceVariableNames: 'codePackage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient'!
!classDefinition: 'GitUncommitedCodePackage class' category: #GitClient!
GitUncommitedCodePackage class
	instanceVariableNames: ''!

!classDefinition: #GitUncommitedCompiledMethod category: #GitClient!
Object subclass: #GitUncommitedCompiledMethod
	instanceVariableNames: 'compiledMethod'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient'!
!classDefinition: 'GitUncommitedCompiledMethod class' category: #GitClient!
GitUncommitedCompiledMethod class
	instanceVariableNames: ''!

!classDefinition: #GitClient category: #'GitClient-Model'!
Object subclass: #GitClient
	instanceVariableNames: 'repositoryFolderPath'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-Model'!
!classDefinition: 'GitClient class' category: #'GitClient-Model'!
GitClient class
	instanceVariableNames: ''!

!classDefinition: #GitCodePackageFileHistory category: #'GitClient-Model'!
Object subclass: #GitCodePackageFileHistory
	instanceVariableNames: 'codePackage commits codePackagesByCommitHash'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-Model'!
!classDefinition: 'GitCodePackageFileHistory class' category: #'GitClient-Model'!
GitCodePackageFileHistory class
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

!classDefinition: #GitHistoryModel category: #'GitClient-UI'!
Object subclass: #GitHistoryModel
	instanceVariableNames: 'gitHistory selectedCommitIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitHistoryModel class' category: #'GitClient-UI'!
GitHistoryModel class
	instanceVariableNames: ''!

!classDefinition: #GitCodePackageFileHistoryModel category: #'GitClient-UI'!
GitHistoryModel subclass: #GitCodePackageFileHistoryModel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitCodePackageFileHistoryModel class' category: #'GitClient-UI'!
GitCodePackageFileHistoryModel class
	instanceVariableNames: ''!

!classDefinition: #GitCompiledMethodHistoryModel category: #'GitClient-UI'!
GitHistoryModel subclass: #GitCompiledMethodHistoryModel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitCompiledMethodHistoryModel class' category: #'GitClient-UI'!
GitCompiledMethodHistoryModel class
	instanceVariableNames: ''!

!classDefinition: #GitHistoryWindow category: #'GitClient-UI'!
SystemWindow subclass: #GitHistoryWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitHistoryWindow class' category: #'GitClient-UI'!
GitHistoryWindow class
	instanceVariableNames: ''!

!classDefinition: #GitCodePackageHistoryWindow category: #'GitClient-UI'!
GitHistoryWindow subclass: #GitCodePackageHistoryWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitCodePackageHistoryWindow class' category: #'GitClient-UI'!
GitCodePackageHistoryWindow class
	instanceVariableNames: ''!

!classDefinition: #GitCompiledMethodHistoryWindow category: #'GitClient-UI'!
GitHistoryWindow subclass: #GitCompiledMethodHistoryWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitCompiledMethodHistoryWindow class' category: #'GitClient-UI'!
GitCompiledMethodHistoryWindow class
	instanceVariableNames: ''!


!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 13:31:50'!
collectCommits: aBlock
	
	^ self commits collect: aBlock! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 02:26:24'!
commits
	
	^ gitCodePackageFileHistory
		commitsIncluding: compiledMethod selector
		inClassNamed: compiledMethod methodClass name! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 02:27:53'!
compareLatestVersionWithCommitAt: anIndex 
	
	^ DifferenceFinder
		displayPatchFrom: self latestSourceCodeVersion
		to: (self sourceCodeFromCommitAt: anIndex)
		tryWords: true
		prettyPrintedIn: compiledMethod methodClass! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 01:20:33'!
initializeFor: aCompiledMethod using: aGitCodePackageFileHistory 
	
	compiledMethod := aCompiledMethod.
	gitCodePackageFileHistory := aGitCodePackageFileHistory.! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 13:32:09'!
latestSourceCodeVersion
	
	^ compiledMethod sourceCode! !

!GitCompiledMethodHistory methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 02:26:43'!
sourceCodeFromCommitAt: anIndex 
	
	^ gitCodePackageFileHistory
		sourceCodeOf: compiledMethod selector
		inClassNamed: compiledMethod methodClass name
		fromCommitAt: anIndex! !

!GitCompiledMethodHistory class methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 01:20:00'!
for: aCompiledMethod using: aGitCodePackageFileHistory 
	
	^ self new
		initializeFor: aCompiledMethod
		using: aGitCodePackageFileHistory ! !

!GitUncommitedCodePackage methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 01:32:49'!
author
	
	^ 'N/A'! !

!GitUncommitedCodePackage methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 01:39:40'!
codePackageFileAt: aCodePackageFilePath

	codePackage fullFileName = aCodePackageFilePath
		ifTrue: [ ^ codePackage codePackageFile ].
		
	self notYetImplemented! !

!GitUncommitedCodePackage methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 01:32:39'!
commitHash
	
	^ 'uncommited'! !

!GitUncommitedCodePackage methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 01:33:02'!
date
	
	^ 'N/A'! !

!GitUncommitedCodePackage methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 01:32:26'!
initializeWith: aCodePackage 
	
	codePackage := aCodePackage! !

!GitUncommitedCodePackage methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 01:33:12'!
message
	
	^ 'N/A'! !

!GitUncommitedCodePackage class methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 01:32:10'!
with: aCodePackage 
	
	^ self
		new
		initializeWith: aCodePackage! !

!GitUncommitedCompiledMethod methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:51:05'!
author
	
	^ compiledMethod author! !

!GitUncommitedCompiledMethod methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:50:26'!
commitHash
	
	^ 'uncommited'! !

!GitUncommitedCompiledMethod methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:51:36'!
date
	
	^ compiledMethod dateMethodLastSaved asString ! !

!GitUncommitedCompiledMethod methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:50:15'!
initializeFor: aCompiledMethod 
	
	compiledMethod := aCompiledMethod ! !

!GitUncommitedCompiledMethod methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:51:50'!
message
	
	^ 'no commit message'! !

!GitUncommitedCompiledMethod class methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:50:05'!
for: aCompiledMethod 
	
	^ self new
		initializeFor: aCompiledMethod! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/24/2025 09:52:49'!
commit: aMessage packageFile: aFilePath 
	
	| file |
	file := aFilePath asFileEntry.

	self outputOfGitCommand: 'add ', file name .
	
	self outputOfGitCommand: 'commit -m ''', aMessage, '''' .! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/24/2025 09:52:49'!
contentsOfFile: aFilePath at: aCommitHash 
	
	| file |
	file := aFilePath asFileEntry.
	
	^ self
		outputOfGitCommand: 'show ', aCommitHash,':./', file name
		! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/24/2025 09:52:49'!
contentsOfFile: aFilePath onBranch: aBranchName 
	
	| fileName |
	
	fileName := aFilePath withoutPrefix: repositoryFolderPath.
	
	^ self
		outputOfGitCommand:  'show ', aBranchName, ':.', fileName
		! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 8/6/2025 12:10:23'!
createTemporaryFile: anExtension 
	
	^ ((self outputOfCommand: 'mktemp'), '.', anExtension) asFileEntry! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/22/2025 09:30:22'!
createTemporaryFolder
	
	^ (self outputOfCommand: 'mktemp -d') asDirectoryEntry! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 8/6/2025 12:08:39'!
downloadFile: aFilePath fromBranch: aBranchName 
	
	| fileContents packageFileEntry |

	fileContents := self contentsOfFile: aFilePath onBranch: aBranchName.
	packageFileEntry := self createTemporaryFile: aFilePath asFileEntry extension.

	packageFileEntry fileContents: fileContents.

	^ packageFileEntry ! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 3/3/2025 01:35:51'!
fileLog: aFilePath

	| commandOutput |
	commandOutput := self outputOfGitLogCommandForFile: aFilePath.
	
	^ GitCommitParser parseAllIn: commandOutput for: self! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/25/2025 13:19:30'!
hasUncommitedChanges
	
	^ (self outputOfGitCommand: 'status --short') withBlanksTrimmed notEmpty! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/24/2025 09:36:25'!
initializeRepositoryFolderPath: aFolderPath 
	
	repositoryFolderPath := aFolderPath! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/22/2025 09:29:40'!
outputOfCommand: aCommand

	^ [  OSProcess outputOf: aCommand ]
		valueWithin: 30 seconds
		onTimeout: [ self error: 'Command timed out: ', aCommand ]! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/24/2025 09:52:49'!
outputOfGitCommand: aCommand 

	^ self outputOfCommand: 'git -C ', repositoryFolderPath ,' ', aCommand! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/24/2025 09:52:49'!
outputOfGitLogCommandForFile: aFilePath

	^ self
		outputOfGitCommand: ' --no-pager log --follow -- ', aFilePath asFileEntry name
		! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/25/2025 17:19:54'!
push
	
	[ self outputOfGitCommand: 'push' ]
		on: Error
		do: [ :error | 
			(error messageText withBlanksTrimmed beginsWith: 'To ')
				ifTrue: [ ^ self ].
			(error messageText withBlanksTrimmed = 'Everything up-to-date')
				ifTrue: [ ^ self ].
				self halt
			]! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 4/25/2025 17:13:28'!
remoteAndLocalBranchesIncludingFile: aFilePath 

	self outputOfGitCommand: 'fetch' .

	^ ((self outputOfGitCommand: 'branch --all' ) lines
		collect: [ :line | | cleanedUp |
			cleanedUp := line withoutLeadingBlanks withoutTrailingBlanks.
			(cleanedUp beginsWith: '*') 
				ifTrue: [ cleanedUp  withoutPrefix: '* ' ]
				ifFalse: [ cleanedUp ]
			 ])
		select: [ :line | line isEmpty not]! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 3/10/2025 13:35:51'!
repositoryRootFor: aFilePath
	
	| repositoryRoot |
	repositoryRoot:= aFilePath asFileEntry.
	
	[
		repositoryRoot := repositoryRoot parent.
		(repositoryRoot directoryMatching: '.git') isNil ] whileTrue: [
		(DirectoryEntry roots includes: repositoryRoot) ifTrue: [ self halt ]
	].
	
	^ repositoryRoot! !

!GitClient methodsFor: 'comparing' stamp: 'NPM 4/25/2025 13:33:58'!
forceSwitchToBranchNamed: aString localName: aString2 
	
	[ self outputOfGitCommand: 'switch -f --force-create ', aString2, ' ', aString ]
		on: Error
		do: [ :error | 
			error messageText withBlanksTrimmed = ('Switched to a new branch ''', aString2,'''') ifTrue: [ ^ self ].
			error messageText withBlanksTrimmed = ('Reset branch ''', aString2,'''') ifTrue: [ ^ self ].
			error messageText withBlanksTrimmed = ('Switched to and reset branch ''', aString2,'''') ifTrue: [ ^ self ].
			self halt.
		
		]! !

!GitClient class methodsFor: 'instance creation' stamp: 'NPM 4/24/2025 09:36:25'!
ofPackageAt: aFilePath
	
	^ self new
		initializeRepositoryFolderPath: (self repositoryFolderOf: aFilePath)! !

!GitClient class methodsFor: 'instance creation' stamp: 'NPM 4/24/2025 09:40:05'!
repositoryFolderOf: aFilePath
	
	| fileEntry repositoryFolderPath parentFolderPath |
	
	fileEntry := aFilePath asFileEntry.
	parentFolderPath := fileEntry parent asString.
	
	repositoryFolderPath := (OSProcess outputOf: 'git -C ', parentFolderPath, ' rev-parse --git-dir') withBlanksTrimmed.
	repositoryFolderPath = '.git' ifTrue: [ repositoryFolderPath := parentFolderPath ].
	
	^ repositoryFolderPath! !

!GitCodePackageFileHistory methodsFor: 'code package files' stamp: 'NPM 3/8/2025 02:22:24'!
codePackageFileFrom: aGitCommit 
	
	^ codePackagesByCommitHash
		at: aGitCommit commitHash
		ifAbsentPut: [ self loadCodePackageFileFrom: aGitCommit ]! !

!GitCodePackageFileHistory methodsFor: 'code package files' stamp: 'NPM 3/8/2025 02:22:31'!
codePackageFileFromCommitAt: anIndex

	^ self codePackageFileFrom: (commits at: anIndex)! !

!GitCodePackageFileHistory methodsFor: 'code package files' stamp: 'NPM 3/8/2025 02:18:34'!
loadCodePackageFileFrom: aGitCommit

	^ CodePackageFile
		at: codePackage fullFileName
		contents: (aGitCommit contentsOfFile: codePackage fullFileName) readStream! !

!GitCodePackageFileHistory methodsFor: 'commits' stamp: 'NPM 3/7/2025 14:05:28'!
collectCommits: aBlock

	^ commits collect: aBlock! !

!GitCodePackageFileHistory methodsFor: 'commits' stamp: 'NPM 3/8/2025 02:22:50'!
commitsIncluding: aSelector inClassNamed: aClassName 
	
	^  commits select: [ :commit | (self codePackageFileFrom: commit) includesSelector: aSelector inClassNamed: aClassName ] 
	
	! !

!GitCodePackageFileHistory methodsFor: 'history' stamp: 'NPM 3/7/2025 13:34:42'!
historyOfCompiledMethod: aCompiledMethod 
	
	^ GitCompiledMethodHistory for: aCompiledMethod using: self! !

!GitCodePackageFileHistory methodsFor: 'initialization' stamp: 'NPM 3/8/2025 02:05:03'!
initializeAt: aCodePackage withAll: aCollectionOfCommits 
	
	codePackage := aCodePackage.
	commits := aCollectionOfCommits.
	
	codePackagesByCommitHash := Dictionary new! !

!GitCodePackageFileHistory methodsFor: 'source code' stamp: 'NPM 3/8/2025 02:22:31'!
sourceCodeOf: aSelector inClassNamed: aClassName fromCommitAt: anIndex 
	
	^ (self codePackageFileFromCommitAt: anIndex)
		sourceCodeOf: aSelector in: aClassName! !

!GitCodePackageFileHistory class methodsFor: 'as yet unclassified' stamp: 'NPM 4/24/2025 09:43:54'!
for: aCodePackage 
	
	^ self new
		initializeAt: aCodePackage
		withAll:  ((GitClient ofPackageAt: aCodePackage fullFileName) fileLog: aCodePackage fullFileName)! !

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

!GitCommit methodsFor: 'initialization' stamp: 'NPM 3/8/2025 02:02:10'!
initializeCommitHash: aCommitHash author: anAuthor date: aDate message: aMessage with: aGitClient 
	
	commitHash := aCommitHash.
	author := anAuthor.
	date := aDate.
	message := aMessage.
	
	gitClient := aGitClient! !

!GitCommit methodsFor: 'reading' stamp: 'NPM 3/8/2025 02:02:00'!
contentsOfFile: aFilePath 

	^ gitClient contentsOfFile: aFilePath at: commitHash! !

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

!GitClientMenus class methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 13:39:07'!
initialize

	"
	self initialize
	"

	BrowserWindow at: #messageListMenuSpec registerMenuAndShortcutsSpecProvider:
		(MessageSend receiver: self selector: #messageListMenuSpec).
	
	BrowserWindow at: #systemCatListMenuSpec registerMenuAndShortcutsSpecProvider:
		(MessageSend receiver: self selector: #systemCatListMenuSpec).! !

!GitClientMenus class methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 13:40:02'!
messageListMenuSpec
	
	^#(
		#(0		'Git history' 				nil 	model 			gitHistoryOfSelectedMethod 									packageIcon)
	)! !

!GitClientMenus class methodsFor: 'as yet unclassified' stamp: 'NPM 6/25/2025 10:40:46'!
systemCatListMenuSpec
	"Spec for the menu and shortcut keys for the system categories list.
	See coment at Morph >> #getMenu
	"
	^#(
		#(0	'Git history' 	nil 	model 	gitHistoryOfSelectedPackage 						packageIcon)
		#(1	'Compare with branch...' 	nil 	model 	compareSelectedPackageWithGitBranch 						packageIcon)
		#(2	'Compare with revision...' 	nil 	model 	compareSelectedPackageWithGitRevision 						packageIcon)
		#(3	'Merge branch...' 	nil 	model 	mergeSelectedPackageFromGitBranch 						packageIcon)
		#(4	'Commit...' 	nil 	model 	commitSelectedPackageInCurrentGitBranch 						packageIcon)
		#(5	'Commit and push...' 	nil 	model 	commitAndPushSelectedPackageInCurrentGitBranch 						packageIcon)
		#(6	'Push' 	nil 	model 	pushSelectedPackageInCurrentGitBranch 						packageIcon)
		#(7 	'-----')
		#(8	'Switch to temporary branch and reinstall package...' 	nil 	model 	switchToTemporaryBranchAndReinstallSelectedPackage 						packageIcon)
		#(9 	'-----')
	)! !

!GitHistoryModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:33:51'!
commits
	
	^ gitHistory collectCommits: [ :commit | commit commitHash, ' ', commit author, ' ', commit date, ' ', commit message ]! !

!GitHistoryModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:34:14'!
initializeFor: aGitHistory 
	
	gitHistory := aGitHistory! !

!GitHistoryModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:37:16'!
notifySelectedCommitIndexChanged

	^ self changed: #selectedCommitIndex! !

!GitHistoryModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:37:16'!
selectCommitAt: anIndex

	selectedCommitIndex := anIndex.

	self notifySelectedCommitIndexChanged! !

!GitHistoryModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:34:02'!
selectedCommitIndex
	
	^ selectedCommitIndex ifNil: [ selectedCommitIndex := 0 ]! !

!GitHistoryModel class methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:40:52'!
fromCodePackage: aCodePackage 
	
	^ GitCodePackageFileHistoryModel fromCodePackage: aCodePackage ! !

!GitHistoryModel class methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:47:09'!
fromCompiledMethod: aCompiledMethod 
	
	^ GitCompiledMethodHistoryModel fromCompiledMethod: aCompiledMethod ! !

!GitCodePackageFileHistoryModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 02:23:29'!
selectedCodePackage
	
	^ gitHistory codePackageFileFromCommitAt: selectedCommitIndex! !

!GitCodePackageFileHistoryModel class methodsFor: 'instance creation' stamp: 'NPM 3/7/2025 14:30:37'!
for: aGitCodePackageFileHistory 
	
	^ self new
		initializeFor: aGitCodePackageFileHistory! !

!GitCodePackageFileHistoryModel class methodsFor: 'instance creation' stamp: 'NPM 3/8/2025 01:26:34'!
fromCodePackage: aCodePackage 
	
	^ self for: aCodePackage gitHistory! !

!GitCompiledMethodHistoryModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:37:33'!
notifySelectedCommitIndexChanged

	super notifySelectedCommitIndexChanged.
	
	self notifySourceCodeChanged.! !

!GitCompiledMethodHistoryModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:38:07'!
notifySourceCodeChanged
	
	self changed: #sourceCode! !

!GitCompiledMethodHistoryModel methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:35:41'!
sourceCode
	
	selectedCommitIndex = 0 ifTrue: [ ^ gitHistory latestSourceCodeVersion ].
	

	^ gitHistory compareLatestVersionWithCommitAt: selectedCommitIndex
	
	! !

!GitCompiledMethodHistoryModel class methodsFor: 'instance creation' stamp: 'NPM 3/7/2025 14:29:49'!
for: aGitCompiledMethodHistory 
	
	^ self new
		initializeFor: aGitCompiledMethodHistory! !

!GitCompiledMethodHistoryModel class methodsFor: 'instance creation' stamp: 'NPM 3/7/2025 14:29:24'!
fromCompiledMethod: aCompiledMethod 
	
	^ self for: aCompiledMethod gitHistory! !

!GitHistoryWindow methodsFor: 'GUI building' stamp: 'NPM 3/7/2025 13:49:39'!
addCommitList

	layoutMorph addMorphUseAll: self buildCommitList! !

!GitHistoryWindow methodsFor: 'GUI building' stamp: 'NPM 3/7/2025 13:49:23'!
buildMorphicWindow
	
	self addCommitList! !

!GitHistoryWindow methodsFor: 'GUI widgets' stamp: 'NPM 3/7/2025 14:05:54'!
buildCommitList

	^ PluggableListMorph
			withModel: model
			listGetter: #commits
			indexGetter: #selectedCommitIndex
			indexSetter: #selectCommitAt:! !

!GitHistoryWindow methodsFor: 'events - handling' stamp: 'NPM 3/7/2025 14:37:52'!
selectedCommitChanged
	
	"Do nothing"! !

!GitHistoryWindow methodsFor: 'label' stamp: 'NPM 3/7/2025 14:12:00'!
update: aSymbol

	aSymbol = #selectedCommitIndex
		ifTrue: [ self selectedCommitChanged ]! !

!GitHistoryWindow class methodsFor: 'instance creation' stamp: 'NPM 3/7/2025 14:10:42'!
openCodePackage: aCodePackage 
	
	^ GitCodePackageHistoryWindow openCodePackage: aCodePackage! !

!GitHistoryWindow class methodsFor: 'instance creation' stamp: 'NPM 3/7/2025 14:25:33'!
openCompiledMethod: aCompiledMethod 
	
	GitCompiledMethodHistoryWindow openCompiledMethod: aCompiledMethod! !

!GitCodePackageHistoryWindow methodsFor: 'as yet unclassified' stamp: 'NPM 4/24/2025 09:50:06'!
selectedCommitChanged

	model selectedCommitIndex = 0
		ifTrue: [ ^ self ].
	
	(CodeFileBrowser browseCodeSource: model selectedCodePackage)
		! !

!GitCodePackageHistoryWindow class methodsFor: 'as yet unclassified' stamp: 'NPM 3/8/2025 02:25:35'!
openCodePackage: aCodePackage 
	
	self
		open: (GitHistoryModel fromCodePackage: aCodePackage)
		label: 'Git history: ', aCodePackage packageName, ' package'! !

!GitCompiledMethodHistoryWindow methodsFor: 'GUI building' stamp: 'NPM 3/7/2025 13:51:50'!
addSourceCodeEditor

	^ layoutMorph addMorphUseAll: self buildSourceCodeEditor! !

!GitCompiledMethodHistoryWindow methodsFor: 'GUI building' stamp: 'NPM 3/7/2025 13:51:54'!
buildMorphicWindow

	super buildMorphicWindow.
	
	self addSourceCodeEditor! !

!GitCompiledMethodHistoryWindow methodsFor: 'GUI widgets' stamp: 'NPM 3/7/2025 13:51:27'!
buildSourceCodeEditor

	^ (TextModelMorph textProvider: model textGetter: #sourceCode)
		emptyTextDisplayMessage: 'Selection detail (no change selected?)'! !

!GitCompiledMethodHistoryWindow class methodsFor: 'as yet unclassified' stamp: 'NPM 3/7/2025 14:40:35'!
openCompiledMethod: aCompiledMethod 
	
	^ self
		open: (GitHistoryModel fromCompiledMethod: aCompiledMethod)
		label: 'Git log: ', aCompiledMethod classAndSelector! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 4/25/2025 17:05:18'!
commitAndPushSelectedPackageInCurrentGitBranch
	
	self commitSelectedPackageAfterDo: [ :codePackage :gitClient | 
		gitClient push ]! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 4/25/2025 17:04:11'!
commitSelectedPackageAfterDo: aBlock 
	
	self selectedPackage
		ifNil: [ ^ self inform: 'No package is selected' ]
		ifNotNil: [ :codePackage | 
			
			
			self request: 'Enter commit message' initialAnswer: '' verifying: [ :commitMessage | commitMessage size <= 50 ]  do: [ :commitMessage | | gitClient |
				
				codePackage description: commitMessage.
				codePackage save.
								
				gitClient := GitClient ofPackageAt: codePackage fullFileName.
				gitClient commit: commitMessage packageFile: self selectedPackage fullFileName.
				aBlock value: codePackage value: gitClient
				 ]
			]! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 4/25/2025 17:05:03'!
commitSelectedPackageInCurrentGitBranch
	
	self commitSelectedPackageAfterDo: [ :codePackage :gitClient | "Do nothing" ]! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 4/25/2025 17:17:20'!
compareSelectedPackageWithGitBranch
	
	self selectedPackage
		ifNil: [ ^ self inform: 'The package does not have a full file name' ]
		ifNotNil: [ :codePackage | | remoteBranches selectedBranchIndex gitClient |
			gitClient := GitClient ofPackageAt: codePackage fullFileName.
			remoteBranches := gitClient remoteAndLocalBranchesIncludingFile: codePackage fullFileName.
			
			selectedBranchIndex := (PopUpMenu labelArray: remoteBranches) startUpWithCaption: 'Select a Git branch to compare to'.
		
			selectedBranchIndex > 0 ifTrue: [ | branch packageFileEntry |
				branch := remoteBranches at: selectedBranchIndex.
				packageFileEntry := gitClient downloadFile: codePackage fullFileName fromBranch: branch.
		
				ChangeListWindow allInstancesDo: [:x | x delete ].
				ChangeList browsePackageContents: packageFileEntry.
				ChangeListWindow allInstances first model
					removeDoIts;
					removeEmptyClassComments;
					removeOlderMethodVersions;
					removeUpToDate
		
		
				
				
				
				
				"(CodeFileBrowser browseCodeSource: packageFile)
					removeUnmodifiedClasses"
			]
	 ]! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 6/24/2025 18:37:43'!
compareSelectedPackageWithGitRevision
	
	self selectedPackage
		ifNil: [ ^ self inform: 'The package does not have a full file name' ]
		ifNotNil: [ :codePackage | | gitClient commitId packageFileEntry |
			
			commitId := self request: 'Enter commit id' initialAnswer: '' orCancel: [ ^ self].
			
			gitClient := GitClient ofPackageAt: codePackage fullFileName.
			
			packageFileEntry := gitClient downloadFile: codePackage fullFileName fromBranch: commitId.
		
				ChangeListWindow allInstancesDo: [:x | x delete ].
				ChangeList browsePackageContents: packageFileEntry.
				ChangeListWindow allInstances first model
					removeDoIts;
					removeEmptyClassComments;
					removeOlderMethodVersions;
					removeUpToDate
			
	 ]! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 3/7/2025 14:23:59'!
gitHistoryOfSelectedMethod
	
	GitHistoryWindow openCompiledMethod: self currentCompiledMethod! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 3/10/2025 10:41:28'!
gitHistoryOfSelectedPackage
	
	self selectedPackage
		ifNil: [ ^ self inform: 'The package does not have a full file name' ]
		ifNotNil: [ :codePackage | GitHistoryWindow openCodePackage: self selectedPackage ]
! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 4/25/2025 17:01:27'!
mergeSelectedPackageFromGitBranch
	
	self selectedPackage
		ifNil: [ ^ self inform: 'The package does not have a full file name' ]
		ifNotNil: [ :codePackage | | remoteBranches selectedBranchIndex gitClient |
			gitClient := GitClient new.
			remoteBranches := gitClient remoteAndLocalBranchesIncludingFile: codePackage fullFileName.
			
			selectedBranchIndex := (PopUpMenu labelArray: remoteBranches) startUpWithCaption: 'Select a Git branch to merge from'.
		
			selectedBranchIndex > 0 ifTrue: [ | branch packageFileContentsInSelectedBranch packageFile changeList |
				branch := remoteBranches at: selectedBranchIndex.
				packageFileContentsInSelectedBranch := gitClient contentsOfFile: codePackage fullFileName onBranch: branch.
				packageFile := CodePackageFile at:codePackage fullFileName  contents: packageFileContentsInSelectedBranch readStream.
				changeList := ChangeList browseCodePackageFile: packageFile contents: packageFileContentsInSelectedBranch readStream.
				changeList
					removeDoIts;
					removeEmptyClassComments;
					removeOlderMethodVersions;
					removeUpToDate.
			]
	 ]! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 4/25/2025 17:08:22'!
pushSelectedPackageInCurrentGitBranch
	
	self selectedPackage
		ifNil: [ ^ self inform: 'The package does not have a full file name' ]
		ifNotNil: [ :codePackage |
			(GitClient ofPackageAt: codePackage fullFileName)
				push ]! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 3/27/2025 09:41:10'!
selectedPackage

	^ CodePackage installedPackages at: (SystemOrganization rootCategoryOf: self selectedSystemCategory)  ifAbsent: [ self halt ]! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 4/25/2025 13:45:55'!
switchToTemporaryBranchAndReinstallSelectedPackage
	
	self
		switchToTemporaryGitBranchWithCaption: 'Select a branch to switch and reinstall the package from'
		afterSwitchDo: [ :currentCodePackage | CodePackageFile installPackage: currentCodePackage fullFileName asFileEntry ]! !

!Browser methodsFor: '*GitClient' stamp: 'NPM 4/25/2025 17:01:27'!
switchToTemporaryGitBranchWithCaption: aCaption afterSwitchDo: aBlock  
	
	^ self selectedPackage
		ifNil: [ self inform: 'The package does not have a full file name' ]
		ifNotNil: [ :codePackage | | remoteBranches selectedBranchIndex gitClient installPackage |
			gitClient := GitClient ofPackageAt: codePackage fullFileName.
			
			gitClient hasUncommitedChanges ifTrue: [ 
				installPackage := self confirm: 'Warning: Uncommited changes to ', codePackage fullFileName asFileEntry name,' (if any) will be lost. Do you want to continue?'.
			installPackage ifFalse: [ ^ self ] ].
			
			
			
			
			
			remoteBranches := gitClient remoteAndLocalBranchesIncludingFile: codePackage fullFileName.
			
			selectedBranchIndex := (PopUpMenu labelArray: remoteBranches) startUpWithCaption: aCaption.
			
			selectedBranchIndex > 0 ifTrue: [ | branch |
				branch := remoteBranches at: selectedBranchIndex.
				gitClient forceSwitchToBranchNamed: branch localName: 'CuisGitClient/temp/', branch.
				aBlock value: codePackage
			]
	 ]! !

!ChangeList class methodsFor: '*GitClient' stamp: 'NPM 3/18/2025 16:02:24'!
browseCodePackageFile: packageFile contents: stream


	"IMPORTANT: this is a copy-paste from browsePackageContents: because it needs an actual
	file to do the work. When comparing changes from Git we dont have a file for the package (the stream
	comes from the Git Server)"


	| changeList |

	changeList := self new scanFile: stream from: 0 to: stream size.
	
	"Add deletions of methods and classes that are in the CodePackage (i.e., active in the system)
	but are no longer in the CodePackageFile being viewed."
	packageFile methodsToRemove do: [ :methodReference |
		changeList
			addItem: (MethodDeletionChangeRecord new methodReference: methodReference)
			text: 'method no longer in package: ', methodReference stringVersion ].
	packageFile classesToRemove do: [ :clsName |
		changeList
			addItem: (ClassDeletionChangeRecord new className: clsName)
			text: 'class no longer in package: ', clsName ].
	changeList clearSelections.
	ChangeListWindow open: changeList label: packageFile packageName.
	^ changeList! !

!CompiledMethod methodsFor: '*GitClient' stamp: 'NPM 3/4/2025 10:08:07'!
gitHistory
	
	^ self methodClass package gitHistory
		historyOfCompiledMethod: self! !

!CodePackage methodsFor: '*GitClient' stamp: 'NPM 3/8/2025 01:41:22'!
codePackageFile
	
	^ CodePackageFile
		at: fullFileName
		contents: self codePackageFileContents readStream! !

!CodePackage methodsFor: '*GitClient' stamp: 'NPM 3/8/2025 01:41:00'!
codePackageFileContents
	
	^ String streamContents: [ :fileContents | self writeOnStream: fileContents ]! !

!CodePackage methodsFor: '*GitClient' stamp: 'NPM 3/8/2025 01:26:50'!
gitHistory
	
	^ GitCodePackageFileHistory for: self
	! !

!CodePackageFile methodsFor: '*GitClient' stamp: 'NPM 3/8/2025 02:07:24'!
includesSelector: aSelector inClassNamed: aClassName 
	
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
