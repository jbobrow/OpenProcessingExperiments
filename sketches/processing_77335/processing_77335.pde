
/**
* Words. 
* 
* The text() function is used for writing words to the screen. 
*/

int fontSize = 0;
int x = 30;
PFont fontA;

void setup() 
{
size(200, 200);
background(102);

// Load the font. Fonts must be placed within the data 
// directory of your sketch. Use Tools > Create Font 
// to create a distributable bitmap font. 
// For vector fonts, use the createFont() function. 
fontA = loadFont("Ziggurat-HTF-Black-32.vlw");

// Set the font and its size (in units of pixels)
textFont(fontA, 32);

// Only draw once
// noLoop();
}

void draw() {
background(125);
fontSize+=1;
if (fontSize>100){
fontSize=100; 
}
fontSise-=1;
if (fontsise<0){
fontSise=0;
}
textFont(fontA, fontSize);
// Use fill() to change the value or color of the text
fill(100, 100, 255);
text("personality", x, 60);
textAlign(CENTER);
fill(255, 100, 100);

textFont(fontA, fontSise)
text("PASSION", x, 95);

}
