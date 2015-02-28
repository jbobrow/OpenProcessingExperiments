
float glassX;
float R;
float G;
float B;
PImage img;
void setup(){
  size(400,400);
  glassX = height/2;
  R = 0;
  G = 0;
  B = 0;  
  img = loadImage("eyes.jpg");
  smooth();
}
void draw(){
  background(250);
  fill(20);
  ellipse(140,205,30,30);
  ellipse(242,205,30,30);
  rectMode(CENTER);
  fill(R, G ,B);
  rect(145,glassX,60,50,50);  
  rect(240,glassX,60,50,50);
  stroke(20);
  fill(0);
  rect(193,glassX,40,5);
  rect(115,glassX,10,20);
  rect(270,glassX,10,20);
  rect(293,glassX,36,18);
  fill(100,161,252,20);
  ellipse(210,190,200,250);
}

void keyPressed( ){
    if( R == 0 && G == 0 && B == 0){
    R = random(150);
    G = random(150);
    B = random(150);
    } else {
      R = 0;
      G = 0;
      B = 0;
    }
}

void mouseClicked(){
  if (mouseButton == LEFT){
  glassX += 40.8;
  smooth();
  } else if(mouseButton == RIGHT){
    glassX = height/4;
  } else {
  }
}


