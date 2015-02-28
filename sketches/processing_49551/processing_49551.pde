
/*

Step 1: Installation (Windows)
Install processing. Once complete, it should have created a folder in My Documents named Processing.
Processing sketches (or, programs) need to be located there in their own folder.  Create a folder in
that Processing folder named LSA.  Copy the zip file you downloaded from open processing to that new
folder you just created (My Documents\Processing\LSA) and extract the contents there.  Now, in that 
folder you should have the following files: LSA.pde, instructions.pde, Lag.pde, datastream.pde, and
yevent.pde (among others, but those are the 4 that you need).  Be aware that sometimes when you 
extract zip files, the program you use may extract the files into a new folder that is the same name
as the zip file (i.e., those files may be located in My Documents\Processing\LSA\applet -- if so, you
need to copy the files back to My Documents\Processing\LSA).

Now, create a new folder named "data" in My Documents\Processing\LSA. That is where you should place 
data files you wish to analyze.

Next, open the sketch from within processing.  To do this, you can either open Processing from the 
Start menu and click on File>Sketchbook>LSA, or click on any of the pde files (e.g., LSA.pde) in 
My Documents\Processing\LSA. When you do this, a window with five tabs should appear: LSA, 
Instructions, Lag, datastream, and yevent.  In addition, there may be a tab named LSA.java.
Openprocessing.org adds this automatically.  Delete this tab by first selecting it at the top of the
Processing window and then clicking the right arrow icon on the top-right hand corner of the window.
Then, select delete and save the sketch.

Step 2: Setup
Before you can analyze any data, you have to setup the program parameters. Open the LSA program from
within processing. 

Go to the LSA tab and scroll down to "Global Options".  The four options you will mostly likely want
to change are filename, xkeys, ykeys, and window.  The program will search for any keys in xkeys that
occur before and after ykeys.  If multiple keys are entered, the program will search for them using a
logical OR.  For example, if you want to know the probability that keys O, L, or E occur after 1, 2 
or 3, then xkeys and ykeys should be set accordingly:
xkeys = "123";
ykeys = "OLE";

The program is case sensitive so, if events are recorded in uppercase (you may need to check the 
datafile if you're not sure), then you need to enter them as uppercase.

Step 3: Running
Once you have set the program parameters correctly and you have placed the datafiles in data\, click
on the run icon located in the upper-left corner of the window. If you did everything above correctly,
then after a few seconds (depending on the speed of your computer) a window should appear displaying
the datastream on the left side and lag-sequential analysis results in the center. You would use this
screen to make sure the program is working as you expect.  Each row of circles represents an occurrence
of any of the y events.  Open circles represent opportunities for x events to occur.  Filled circles
represent an opportunity and an occurrence of an x events. Moving the mouse over a particular row on
the LSA graphic will highlight the corresponding y-event on the datastream to the left.  You can scroll
up or down the datastream or LSA results by moving the mouse cursor to the top or bottoms of their 
graphics, respectively.  Assuming things look right, you can close the program. Results of the analysis
have been saved in your data folder in a new file with the words ".results.csv" tacked on to the end of
the filename you analyzed.

Step 4: Now what?
You should be able to open the results in Excel directly by double clicking on the filename. The top 
of the file contains information related to the program options you set in step 2.  Below that are the
results of the LSA in three columns: time, occurrences, and opportunities. If you're only interested 
in y-events that happen after x, you can ignore or delete all of the negative time values and the 
first 0.  You might notice that there are two 0 times.  That's because InstantData only records events
in 1-s resolution.  So, x events that occur in the same second as y events but before the occurrence 
of the y events can be found in the first 0 time.  Likewise, x events that occur in the same second as
y events  but after the occurrence of the y events can be found in the second 0 time.

The program does not calculate conditional probability for each second, but that's easy to do at this
point.  For each row, divide the number in the occurrences column by the number in the opportunities 
column.  The program does not do this automatically because in most cases, you would most likely be 
aggregating occurrences and opportunities across several sessions before you perform the division step.

The conditional probability and unconditional probability for the range of positive time values is
calculated separately from the LSA analysis because what constitutes an opportunity is different. Results
of these separate analyses and corresponding occurrences and opportunities are visible in the top-half of
the output in the rows labeled "positive conditional probability" and "positive unconditional probability",
respectively. 

Change Log:

0.4 - 3/4/2012 - Clarified instructions for downloading program from openprocessing.org

*/

