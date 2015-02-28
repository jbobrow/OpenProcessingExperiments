
/*
2012-06-19
Processing 1.5.1 with the Minim 2.1.0 Beta library

- this prototype of a program converts sequences of moves in the game of Go to frequencies
- the aim of the program is to give the recommended sequences of moves ("joseki") an 
acoustic representation, which can help memorizing them as well as analyse games
- moves are defined in the "moves" array as a series of coordinates on the board
- with these coordinates values are being looked up in the "conversion" array
- these values are used in the following formula to calculate the frequency:
freq=basefreq*((3/2)^fifths)*((5/4)^thirds)
- this formula used together with the conversion table builds a variation of the so-called 
"Tonnetz" with the frequencies rising in so-called "just intonation fifths" along the 
diagonals of the board and the "just intonation thirds" rising vertically and horizontally 
from the points on the diagonals 
- only the upper left corner is defined in the "conversion" array, the other corners are
addressed as being symmetrical to the upper left corner
- combined, these features are thought to correlate with the symmetries of play on the Go board
- several other sequences of moves have been prepared and are commented out. 
they can be used instead of the current definition of the "moves" array
*/

// technical set-tu

//set up "minim" music library (Minim 2.1.0 Beta)
import ddf.minim.*;
import ddf.minim.ugens.*;
Minim minim = new Minim( this );
AudioOutput out = minim.getLineOut();

// set up font 
/*
PFont f;
f = loadFont("ArialMT-12.vlw"); 
textFont(f);
*/

// define variables
int thirds, fifths, xpos, ypos;
int pausetime=300; // (ms), change this to make the pause between sounds longer or shorter, 1000 should be slow enough
float freq;
float basefreq=140; // (hz), change this to transpose the sounds 
String textoutput="";

// define game moves:{horizontal, vertical}; top left is {1,1}
// 44-33-invasion
int[][] moves={{4,4},{3,3},{4,3},{3,4},{3,5},{2,5},{3,6},{2,6},{3,7},{4,2},{5,2},{3,2},{5,3}};
// 44 low approach
// int[][] moves={{4,4},{6,3},{3,6},{4,2},{3,3},{9,3}};
// 44 high extension
// int[][] moves={{4,4},{6,3},{4,6},{4,3},{3,3},{9,3},{3,10}};
// 4-4 point low approach, attach-block joseki
// int[][] moves={{4,4},{6,3},{6,4},{7,4},{5,3},{6,5},{5,4},{7,5},{4,6}};
// mirroring test
// int[][] moves={{1,1},{19,19}};

// define conversion table for the upper left corner: position equals position on the board; 
// [fifths;thirds] from "basefreq"; the 4-4 point has the "basefreq" frequency
int conversion[][][] = {
{{-3,0},{-2,1},{-1,2},{0,3},{1,4},{2,5},{3,6},{4,7},{5,8},{6,9}},
{{-2,1},{-2,0},{-1,1},{0,2},{1,3},{2,4},{3,5},{4,6},{5,7},{6,8}},
{{-1,2},{-1,1},{-1,0},{0,1},{1,2},{2,3},{3,4},{4,5},{5,6},{6,7}},
{{0,3},{0,2},{0,1},{0,0},{1,1},{2,2},{3,3},{4,4},{5,5},{6,6}},
{{1,4},{1,3},{1,2},{1,-1},{1,0},{2,1},{3,2},{4,3},{5,4},{6,5}},
{{2,5},{2,4},{2,3},{2,2},{2,1},{2,0},{3,1},{4,2},{5,3},{6,4}},
{{3,6},{3,5},{3,4},{3,3},{3,2},{3,1},{3,0},{4,1},{5,2},{6,3}},
{{4,7},{4,6},{4,5},{4,4},{4,3},{4,2},{4,1},{4,0},{5,1},{6,2}},
{{5,8},{5,7},{5,6},{5,5},{5,4},{5,3},{5,2},{5,1},{5,0},{6,1}},
{{6,9},{6,8},{6,7},{6,6},{6,5},{6,4},{6,3},{6,2},{6,1},{6,0}}
};

// program window setup

void setup() {  
noLoop(); // execute "draw" only once
size(200, 200);
// print output rate and the moves in the program window
for (int i = 0; i < moves.length; i = i+1) {
  textoutput=textoutput+moves[i][0]+"-"+moves[i][1]+" ";
}
text((textoutput + " (approx. " + 1000/pausetime + " moves per second)"),10,10,190,190);
}

void draw() {
  
// play sound "moves.length" times
for (int i = 0; i < moves.length; i = i+1) {
// read position on the board from "moves"
xpos=(moves[i][0])-1;
ypos=(moves[i][1])-1;
// mirror values for the other corners of the board than the upper left corner
if (xpos>9){xpos=18-xpos;}
if (ypos>9){ypos=18-ypos;}
// calculate frequency
fifths=conversion[ypos][xpos][0];
thirds=conversion[ypos][xpos][1];
freq=basefreq*(pow(1.5,fifths))*(pow(1.25,thirds));

// make sound
out.playNote(freq);
delay(pausetime);

// output information in the console (for test purposes)
print(moves[i][0]);
println(moves[i][1]);
println(fifths);
println(thirds);
println(freq);

}
}


