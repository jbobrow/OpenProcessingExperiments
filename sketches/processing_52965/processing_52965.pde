


PFont dfont;
float x;
float y;

float mic;
void setup () {
  size (500, 500);
  smooth();
  dfont = loadFont("Dax-Black-80.vlw");
  textFont(dfont);
  x = width/2;
  y = height/2;

  
  
  frameRate(60);

}

void draw() {

  background(255);
  fill(255);
  stroke(150);
  
float d = dist (mouseX, mouseY, x, y);
mic = map(d,0,350,-100,30); 

  textSize(mic);
  fill(150);
  textAlign(CENTER);
  text ("Flip", x, y);

  
  

 
 
}

