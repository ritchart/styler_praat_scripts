# Amplitude Matcher
# Will Styler - 2008
# 
# This Praat script will create amplitude normalized stimuli in AIFF format and save to a new directory


form Change sample rate in sound files´
   sentence Sound_file_extension .aiff
   comment Directory path of input files:
   text input_directory  /Users/will/Desktop/bandperceptionstimuli/
   comment Directory path of resampled files (old files will be overwritten!):
   text output_directory  /Users/will/Desktop/stimuli60/
endform

Create Strings as file list... list 'input_directory$'*'sound_file_extension$'
numberOfFiles = Get number of strings
for ifile to numberOfFiles
	select Strings list
	sound$ = Get string... ifile
	Read from file... 'input_directory$''sound$'
	objectname$ = selected$ ("Sound", 1)
	Scale intensity... 65
	Write to AIFF file... 'output_directory$''objectname$'.aif
	Remove
	#select Sound 'objectname$'
	#Remove
endfor

select Strings list
Remove
