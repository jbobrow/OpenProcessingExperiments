
 PImage b;
  
int yPosition;
int xPosition;
float a = 0.0;
float depth = 200;
float p = 0.0;

void setup() {
  background(225);
  PFont knock;
  knock=loadFont("wedding.vlw");
  textFont(knock);
  size(600, 600, P3D);
  noStroke();
  smooth();
  b = loadImage("newnewcircle.jpg");
  background(b);
}


void draw() {
  
  background(225);
  image(b,0,0);
  lights();





  float h = hour();
  float m = minute();
  float s = second();
 

  if (h > 12) {
    h -= 12;
  }

 

  textAlign(CENTER);
 

  yPosition = -140;
  for (int i = 0; i <60; i = i+1)  {
 
    int a = int(s) + int(map(i, 0, 59, -30, 30));
    if (a > 59) {
      a = a - 60;
    } 
    else if (a < 0) {
      a = 60 - a;
    }
    
  p = p + .001;
  float fuck = noise(p)/2;
  float n = fuck*abs(i-29);
  

    textSize(1.25*abs(i-29));
    fill(225, 8*abs(i-29));
    String time = nf(int(h), 2) + "." + nf(int(m), 2) + "." + nf(a, 2);
    yPosition += abs(i-29);
    text(time, 20*sin(n)/2+290, yPosition);
  }
  
  


  noFill();
  stroke(225);
  strokeWeight (.2);
  pushMatrix();
  translate(width/2, height/2, 200);
//  rotateY(map(mouseX, 0, width, 0, PI));
//  rotateX(map(mouseY, 0, height, 0, PI));
 rotateY(map(second(), 0, 100, 0, PI));
 rotateX(map(minute(), 0, 100, 0, PI));
 

  sphere(153);
  popMatrix();

}


