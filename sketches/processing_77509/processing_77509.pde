
import interfascia.*;


PFont myFont;

float r;
float g;
float b;
float a;
float diam;
float x;
float y;


void setup() {
  
myFont = createFont("Tahoma", 15);
textFont(myFont);
  
size(800,800);
background(255);
smooth(102);
loop();  



}
void draw() {
// Fill all variables with random values
text("Premi il mouse del riquadro per resettare", 25,10); 
scritta(); 

r = random(255);
g = random(255);
b = random(255);
a = random(255);
diam = random(200);
x = random(width);
y = random(height);
// Use values to draw an ellipse
noStroke();
fill(r,g,b,a);
ellipse(x,y,diam,diam);
}



void mouseReleased() {
  loop();  // Releasing the mouse stops looping draw()
}

void mousePressed() {

background(255);
}

void scritta()
{
text(" ", 250,50); 
}




