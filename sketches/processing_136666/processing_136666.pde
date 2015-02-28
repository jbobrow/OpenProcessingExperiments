
// Making an array 
// Played with one from Daniel Shiffmans book to get better used to arrays.
// February 27, 2014
// Arthur Siebesian
int[] xpos = new int[50];
int[] ypos = new int[50];

void setup() {
  size (500,500);
  smooth();
  frameRate(60);
  
  for(int i= 0; i < xpos. length-1; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < xpos.length-1; i++) {
 xpos [i] = xpos[i + 1]; 
 ypos[i] = ypos[i + 1]; 
 }
 
xpos[xpos.length-1] = mouseX;
ypos[ypos.length-1] = mouseY;
 
for(int i = 0; i < xpos. length; i++) {
 noStroke(); 
 fill(random(255),0,0); 
 ellipse(xpos[i],ypos[i],i,i); 
 println("ELLIPSE4LYFE");
 } 
 }
 
 
