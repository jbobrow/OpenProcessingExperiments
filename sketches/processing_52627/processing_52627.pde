
float xPos;
float yPos;
float r;
float g;
float b;
float a;
float diam;
float movingOval;

void setup() {
  size(500, 500);
  //background(0);
  background(mouseX/2,mouseY/2,50,100);
  movingOval=height+100;
  smooth();
  }


void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(500);
  
  xPos = 250;
  yPos = 250;
  
  fill(r,g,b,a);
  stroke(5);
  ellipse(xPos,yPos,diam,diam);
  
  
   if (mouseX>50 && mouseX<150 && mouseY>50 && mouseY<125) {
  } else {

 }
  ellipse(width/2,movingOval,60,60);
  
  movingOval = movingOval - 1;

}



void mousePressed() {
  background(mouseX/2,mouseY/2,50,100);
}

void keyPressed() {
  background(0);
}




