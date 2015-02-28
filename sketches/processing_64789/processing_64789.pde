
// this program converts standard Rubik's cube notation to a sequence of notes that can be played back with the space bar

// set up the "minim" music library (Minim 2.1.0 Beta, see Minim website for installation instructions)
import ddf.minim.*;
import ddf.minim.ugens.*;
Minim minim = new Minim( this );
AudioOutput out = minim.getLineOut();

// define variables
float basefreq=140; // (hz), change this to transpose the sounds 
boolean keyDown=false;
int i=0;

// define the sequence of moves in standard Rubik's cube notation
// write RR, not R2, characters that do not belong to Rubik's cube notation are ignored
String notationArray = 
"RR'RR' F'FF'F UU'UU' RUU'R' RUU'R' RURURU U'R'U'R'U'R' RUR'U'RUR'U'RUR'U' RUR'U'RUR'U'RUR'U' *** RB'R'U'R'URDRD'RD' RURURU RURD' RUR'D' *** UU R'URU' U'L'U UUL'UU D'D'LDL' LD'L' D'LDL' DLDL' R'D'D'RD R'D'R *** RU'R' URU'R'U'F'UF UUU U'L'ULUFU'F' U URU'R' U'F'UF *** U'RU'R' UU L'UUL U'RU'R' UU *** R'FU'F'D'FUF'DR L'ULDL'U'LD' *** RB'R'U'B'UFU'BURBR'F' RB'R'U'B'UFU'BURBR'F'"; 
// make an array with 0 elements to hold a representation of the sequence as numbers
int[] valuesArray = new int[0]; 

// define an array to convert values in "valuesArray" to frequencies; construction using "just" intervals: 
// (fifths,fourths,major thirds)
float[] convArray = {
basefreq*pow(1.5,0)*pow(1.33333333,1)*pow(1.25,0), // R (0,1,0) 
basefreq*pow(1.5,-1)*pow(1.33333333,1)*pow(1.25,2), // L (-1,1,2)
basefreq*pow(1.5,0)*pow(1.33333333,1)*pow(1.25,1), // F (0,1,1)
basefreq*pow(1.5,0)*pow(1.33333333,2)*pow(1.25,0), // B (0,2,0)
basefreq*pow(1.5,1)*pow(1.33333333,0)*pow(1.25,0), // U (1,0,0)
basefreq*pow(1.5,0)*pow(1.33333333,-1)*pow(1.25,2), // D (0,-1,2)
basefreq*pow(1.5,0)*pow(1.33333333,0)*pow(1.25,0), // R' (0,0,0)
basefreq*pow(1.5,0)*pow(1.33333333,0)*pow(1.25,2), // L' (0,0,2)
basefreq*pow(1.5,-1)*pow(1.33333333,1)*pow(1.25,1), // F' (-1,1,1)
basefreq*pow(1.5,1)*pow(1.33333333,0)*pow(1.25,1), // B' (1,0,1)
basefreq*pow(1.5,0)*pow(1.33333333,0)*pow(1.25,1), // U' (0,0,1)
basefreq*pow(1.5,-1)*pow(1.33333333,0)*pow(1.25,2) // D' (-1,0,2)
};

void setup() {
noLoop(); // execute "draw" only once
size(220, 400);
// print notation sequence in the program window
text("Ribik's cube sonification. \n\nPress any key to play the next note. Edit the code to modify the sequence.",10,10,190,80);
text(notationArray,10,100,190,390);

// convert notation to values
for (int i = 0; i < notationArray.length(); i = i+1) {
    if(notationArray.charAt(i) == 'R'){valuesArray=append(valuesArray,1);}
    if(notationArray.charAt(i) == 'L'){valuesArray=append(valuesArray,2);} 
    if(notationArray.charAt(i) == 'F'){valuesArray=append(valuesArray,3);} 
    if(notationArray.charAt(i) == 'B'){valuesArray=append(valuesArray,4);} 
    if(notationArray.charAt(i) == 'U'){valuesArray=append(valuesArray,5);} 
    if(notationArray.charAt(i) == 'D'){valuesArray=append(valuesArray,6);} 
    if(notationArray.charAt(i) == '\''){
    valuesArray[valuesArray.length-1] = valuesArray[valuesArray.length-1]+6;}   
}

}


void draw() {
}

void keyPressed(){
    if ((keyDown == false) && i<valuesArray.length){
  // convert values to frequencies and play sound
      out.playNote(convArray[valuesArray[i]-1]); 
keyDown=true;
i=i+1;
}
}

void keyReleased(){
  keyDown=false  ;
}

// test
/*
println(valuesArray);
println(notationArray);
println(convArray);
*/



