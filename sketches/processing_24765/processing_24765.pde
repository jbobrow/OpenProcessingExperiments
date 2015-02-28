
int ellipseSize = 200;
int arcPositionX = 100;
int arcPositionY = 100;

int brcPositionX = 100;
int brcPositionY = 130;

int x = 0;

void setup () {
  
  size (250,500);
  strokeWeight(1);
  background(255);
  smooth();
  
}

void draw() {
  
  while (x<15000){
  stroke(0,56,124,random(0,200));
  line (random(-1000,1000),random(-2000,2000),random(-1000,1000),random(-2000,2000));
x=x+1;  
}

while (arcPositionY<1100){

noFill();
stroke(255,240);
strokeCap(SQUARE);
strokeWeight(20);

arc(arcPositionX,arcPositionY,ellipseSize,ellipseSize,PI,TWO_PI-PI/2);
arc(brcPositionX,brcPositionY,ellipseSize,ellipseSize,TWO_PI-PI/2,TWO_PI);

strokeWeight(2);
arc(arcPositionX,arcPositionY,ellipseSize-50,ellipseSize-50,PI,TWO_PI-PI/2);
arc(brcPositionX,brcPositionY,ellipseSize-50,ellipseSize-50,TWO_PI-PI/2,TWO_PI);

arc(arcPositionX,arcPositionY,ellipseSize-60,ellipseSize-60,PI,TWO_PI-PI/2);
arc(brcPositionX,brcPositionY,ellipseSize-60,ellipseSize-60,TWO_PI-PI/2,TWO_PI);

arcPositionY = arcPositionY+100;
brcPositionY = brcPositionY+100;
}

}

