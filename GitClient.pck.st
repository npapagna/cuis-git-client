'From Cuis7.3 [latest update: #7053] on 28 February 2025 at 1:57:43 pm'!
'Description '!
!provides: 'GitClient' 1 0!
SystemOrganization addCategory: #'GitClient-Model'!
SystemOrganization addCategory: #'GitClient-UI'!
SystemOrganization addCategory: #GitClient!


!classDefinition: #FileLogModel category: #'GitClient-Model'!
Object subclass: #FileLogModel
	instanceVariableNames: 'gitFileLog selectedIndex'
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
	instanceVariableNames: 'revision author date message gitClient'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-Model'!
!classDefinition: 'GitCommit class' category: #'GitClient-Model'!
GitCommit class
	instanceVariableNames: ''!

!classDefinition: #GitFileLog category: #'GitClient-Model'!
Object subclass: #GitFileLog
	instanceVariableNames: 'filePath commits'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-Model'!
!classDefinition: 'GitFileLog class' category: #'GitClient-Model'!
GitFileLog class
	instanceVariableNames: ''!

!classDefinition: #GitLogParser category: #'GitClient-Model'!
Object subclass: #GitLogParser
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-Model'!
!classDefinition: 'GitLogParser class' category: #'GitClient-Model'!
GitLogParser class
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

!classDefinition: #GitCodePackageListWindow category: #'GitClient-UI'!
CodePackageListWindow subclass: #GitCodePackageListWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GitClient-UI'!
!classDefinition: 'GitCodePackageListWindow class' category: #'GitClient-UI'!
GitCodePackageListWindow class
	instanceVariableNames: ''!


!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:39:28'!
commits
	
	^ gitFileLog commits collect: [ :commit | commit revision, ' ', commit author, ' ', commit date, ' ', commit message ]! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:41:47'!
compareWithSelectedVersion

	| codePackage |
	
	codePackage := CodePackageFile
		at: gitFileLog filePath
		contents: (self selectedCommit contentsOfFile: gitFileLog filePath) readStream.
	
	CodeFileBrowser browseCodeSource: codePackage! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:39:44'!
initializeLog: aGitFileLog 
	
	gitFileLog := aGitFileLog.! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:42:05'!
selectedCommit
	
	^ gitFileLog commitAt: selectedIndex! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 02:16:58'!
selectedIndex
	
	^ selectedIndex ifNil: [ selectedIndex := 0 ]! !

!FileLogModel methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:42:16'!
selectedIndex: anIndex 
	
	selectedIndex := anIndex.
	
	anIndex > 0 ifTrue: [ self compareWithSelectedVersion ]! !

!FileLogModel class methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:32:31'!
log: aGitFileLog 
	
	^ self new initializeLog: aGitFileLog! !

!FileLogModel class methodsFor: 'instance creation' stamp: 'NPM 2/28/2025 13:40:44'!
on: aGitFileLog 
	
	^ self new initializeLog: aGitFileLog! !

!GitClient methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:30:51'!
fileLog: aFilePath

	| commandOutput |
	commandOutput := OSProcess outputOf: 'git -C ', aFilePath asFileEntry parent pathName ,' --no-pager log --follow -- ', aFilePath asFileEntry name.
	
	^ GitFileLog
		for: aFilePath
		commits: (GitLogParser new value: commandOutput readStream with: self)! !

!GitCommit methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:14:25'!
author
	
	^ author! !

!GitCommit methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:18:39'!
contentsOfFile: aPath 

	| file |
	file := aPath asFileEntry.
	
	^ OSProcess outputOf: 'git -C ', file parent asString ,' show ', self revision,':./', file name.! !

!GitCommit methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:14:31'!
date

	^ date! !

!GitCommit methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:12:56'!
initializeRevision: aRevision author: anAuthor date: aDate message: aMessage with: aGitClient 
	
	revision := aRevision.
	author := anAuthor.
	date := aDate.
	message := aMessage.
	gitClient := aGitClient! !

!GitCommit methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:14:39'!
message
	 
	^ message! !

!GitCommit methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:14:18'!
revision
	
	^ revision! !

!GitCommit class methodsFor: 'instance creation' stamp: 'NPM 2/28/2025 13:12:00'!
revision: aString author: aString2 date: aString3 message: aString4 with: aGitClient 
	
	^ self new
		initializeRevision: aString author: aString2 date: aString3 message: aString4 with: aGitClient ! !

!GitFileLog methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:42:53'!
commitAt: anIndex 
	
	^ commits at: anIndex! !

!GitFileLog methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:42:56'!
commits
	
	^ commits! !

!GitFileLog methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:37:04'!
filePath
	
	^filePath! !

!GitFileLog methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:42:46'!
initializeFor: aFilePath commits: aCollectionOfCommits 
	
	filePath := aFilePath.
	commits := aCollectionOfCommits.! !

!GitFileLog class methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:34:45'!
for: aFilePath commits: commits 
	
	^ self new
		initializeFor: aFilePath
		commits: commits! !

!GitLogParser methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 13:11:23'!
value: r with: gitClient

	|commits commit author date msg|
	commits := OrderedCollection new.

	
		"skip commit"
		[ r atEnd ] whileFalse: [
	self assert: 'commit' = (r upTo: Character space).
	commit := r upTo: Character newLineCharacter.
	self assert: 'Author:' = (r upTo: Character space).
	author := r upTo: Character newLineCharacter.
	self assert: 'Date:' = (r upTo: Character space).
	date := r upTo: Character newLineCharacter.
	r nextLine.
	msg := String streamContents: [ :str | 
		|nextLine|
	nextLine := r nextLine.
	[ nextLine notNil and: [nextLine withBlanksTrimmed ~= '']] whileTrue: [
		str nextPutAll: nextLine; cr.
		nextLine := r nextLine.
		]
	].
	commits add: (GitCommit revision: commit author: author date: date message: msg with: gitClient)
	].
^commits! !

!GitLogWindow methodsFor: 'as yet unclassified' stamp: 'NPM 2/28/2025 09:02:11'!
buildMorphicWindow
	
	layoutMorph addMorphUseAll: (
		PluggableListMorph
			withModel: model
			listGetter: #commits
			indexGetter: #selectedIndex
			indexSetter: #selectedIndex: )! !

!GitLogWindow class methodsFor: 'instance creation' stamp: 'NPM 2/28/2025 13:40:22'!
openOnFile: aFilePath 
	
	| gitFileLog model |
	gitFileLog := GitClient new fileLog: aFilePath.
	model := FileLogModel on: gitFileLog.
	
	self open: model label: 'Git log: ', aFilePath! !

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

!CodePackageFile class methodsFor: '*GitClient' stamp: 'NPM 2/28/2025 13:21:23'!
at: aFilePath contents: aReadStream

	| file |
	file := aFilePath asFileEntry.
	
	^ self new
		buildFileStream: aReadStream
		packageName: (CodePackageFile packageNameFrom: file pathName)
		fullName: file pathName! !
