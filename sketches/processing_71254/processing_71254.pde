
PImage a,b;


void setup() {
  size(500, 500);
  stroke(255,255,255);
  smooth();
  background(0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  a = loadImage("spiral.png");
  b = loadImage("kitty.png");
}
 
int numObjects = 10;
int loops = 8;
int centerX = 250;
int centerY = 250;
float distance = 250;
float angle = 0;
 
void draw() {
  //background(abs(distance/2),125-abs(distance - distance/5),125);
  //image(a,0,0);
  //fill(125-abs(distance - distance/5),125-abs(distance/2),125);;
  background(0);
  int x = 250;
  int y = 250;
  float hy = 0.5;
  int dia = 700;
  
  angle = radians(angle);

  angle = degrees(angle);
  
  float angleObject = 360/numObjects;
  
  distance -= 1 + abs(distance/100);
  if (distance < -500){
    distance = 500;
  }
  angle++;
  
  float shifter = 0.8;
  
  for (int i=0;i<numObjects ;i++)
  {
    
    float posX=centerX + distance *cos( radians(angleObject*i + angle) );
    float posY=centerY + distance *sin( radians(angleObject*i + angle) );
    
    ellipse(posX, posY, 10, 10);

    for(int j = 0; j < loops; j++){
      //fill(i*25.5,j*42.5,i*25.5);
      fill(255,255,255);
      ellipse(posX+j*18, posY+j*18, 10+j*18*shifter, 10+j*18*shifter);
      ellipse(posX-j*18, posY-j*18, 10-j*18*shifter, 10-j*18*shifter);
      line(posX+j*18, posY+j*18,posX-j*18, posY-j*18);

    }
  }
}
