
PFont a;
PFont b;
PFont c;
PFont d; //defining variables
 
String annex = "Z"; //causes text to repeat itself as Z
 
void setup() {
size(250,250); //size of frame
smooth();
noStroke();
background(255); //white background
a = loadFont("Garamond-Bold-48.vlw");
b = loadFont("HelveticaNeue-UltraLight-100.vlw");
frameRate(10); //the rate which the letters will appear on the screen
}
 
 
void draw() {
stroke(0); 
fill(47, 199, 180, 20);
textMode(LEFT);
textFont(a,100);
text("Z",mouseY,mouseX); // mouse pressed
fill(89,10);
textFont(b,100);
noStroke();
text("L1W",mouseX,mouseY); //mouse pressed
fill(59,28, 89,10);
text("3Z2", random(height),random(width)); 
 
 
}
 


