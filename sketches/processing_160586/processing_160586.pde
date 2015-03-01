
void setup()
{
  size(500,500);
  background(200,50,50);
  fill(255);
  noLoop();
  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  
}
float h=0;
float s=100;
float b=100;
float dh=1;
float directionc=1;
 

 
void setup() {
  size(600, 400);
  ellipseMode(CENTER);
  strokeWeight(5);
}
 
void draw() {
  colorMode(HSB, 100);
 
  if (mousePressed) {
    //ellipse(mouseX,mouseY,10,10);
    stroke(h, s, b);  
 
    line(mouseX, mouseY, pmouseX, pmouseY);
    h+=.5*directionc;     if (h<=10) {
      directionc=1;
    }
    else if (h>=18) {
      directionc=-1;
    }
  }
} //draw function

  

