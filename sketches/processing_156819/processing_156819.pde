
float posX;
float posY;

float dX;
float dY;

float pX;
float pY;

float ppX;
float ppY;

float a=dist(posX, posY, dX, dY);

void setup () { 
  size (600, 600); 
  posX=width/2;
  posY=height/2;
  dX = width/2;
  dY = height/2;
  pX = dY; 
  pY = dX;
  ppX = dX;
  ppY = dY;
}
void draw () {
  myFunction () ;
  myOther();
}
void myOther() {
  fill(255, 10);
  rect(0, 0, width, height);
  strokeWeight(random(1, 5)); 
  stroke(70, random(0, 255)); 
  ppX=random(0,width);
  ppY=random(0,height);
  //line(posX, posY, ppX, ppY); 
  arc(posX,posY,random(width),random(height),radians(random(360)),radians(random(360)));
  int rd=int(random(0, 15)); 
  if (rd<2) { 
    fill(215, 50, 50, random(100, 255));
  } else if (rd==3) { 
    fill(255, 255, 0, random(200, 255));
  } else { 
    fill(random(0, 255), random(100, 255));
  } 
  float r=random(1, 15); 
  noStroke(); 
  ellipse(posX+random(3-a, a-3), posY+random(-3-a, a-3), r-a/3, r-a/3);
}
void myFunction() {
  fill(255, 10);
  rect(0, 0, width, height);

  dX=random(-30, 30);
  dY=random(-30, 30);
  posX=posX+dX;
  posY=posY+dY;
  fill(random(255), random(255), random(255));
  ellipse(posX+random(-50, 50), posY+random(-50, 50), random(0, 50), random(0, 50));
  if (posX<0) {
    posX = width;
    dX=width;
  } else if (posX>width) {
    posX=0;
    dX=0;
  }
  if (posY<0) {
    posY=height;
    dX=height;
  } else if (posY>height) {
    posY=0;
    dY=0;
  }
  dX=posX;
  dY=posY;
}



