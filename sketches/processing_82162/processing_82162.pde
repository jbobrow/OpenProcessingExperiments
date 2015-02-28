
void setup() {
  size(800,600);
  
  
}


void draw() {
  
  background(9, 82, 175);
  fill(124,167,64);
  rect(250,250,300,300);
  noStroke(); 
  fill(13, 100, 17);
  ellipse(400,500,900,300);
  fill(124,167,64);
  rect(250,250,300,300);
  fill(255,255,255);
  ellipse(250,270,150,150);
  ellipse(550,270,150,150);
  fill(0);
  ellipse(400,400,180,40);
  fill(0);
  float pupilX = map(mouseX, 0, width, 235, 285);
  float pupilY = map(mouseY, 0, height, 235, 270);
  float pupilA = map(mouseX, 0, width,515, 565);
  ellipse(pupilX,pupilY,60,50);
  ellipse(pupilA,pupilY,60,50);
  ellipse(mouseX,mouseY,30,30);  //<--- supposed to be a fly
   

  }
