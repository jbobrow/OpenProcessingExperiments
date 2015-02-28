
//Steve Smith HW1
//polygon function written based on http://processing.org/learning/anatomy/

int valueR = 255;
int valueB = 255;
int valueG = 255;
int posY;
int posX;
int sideLength;
int numSides;
int maxSize = 75;
int minSize = 15;
boolean grow = true;

void setup() {
  size(700, 700);
  smooth();
  numSides = int(random(2,13)); //selects random shape
  sideLength = int(random(minSize, maxSize)); //selects side length
  background(0); //sets background color 
  posX = int(random(0,700));
  posY = int(random(0,700));
}


void draw() {
  
  fill(valueR, valueG, valueB);
  polygon(numSides, posX, posY, sideLength);
  
  if(grow == true){
    sideLength = sideLength + 2;
    if(sideLength >= maxSize){
      grow = false;
    }
  }else if(grow == false){
    sideLength = sideLength - 2;
    if(sideLength <= minSize){
      grow = true;
    }
  }else {//do nothing
  }

  int changeX = int(random(-50, 50));
  int changeY = int(random(-50, 50)); 
  
  posX = posX + changeX;
  if(posX < 0){
    posX = posX + 50;
  }else if(posX > (695)){
    posX = posX - 50;
  }else{//do nothing
  }
  
  posY = posY + changeY;
  if(posY < 0){
    posY = posY + 50;
  }else if(posY > (695)){
    posY = posY - 50;
  }else{//do nothing
  }
  delay(250);  
  
}

void mousePressed() {
  valueR = int(random(255));
  valueB = int(random(255));
  valueG = int(random(255));
  posX = mouseX;
  posY = mouseY;
  numSides  = int(random(2,13));
}

void polygon(int numSides, int posX, int posY, int sideLength){
  float angle = 360.0 / numSides;
  
  beginShape();
  for (int i = 0; i < numSides; i++){
    vertex(posX + sideLength * cos (radians(angle * i)), 
           posY + sideLength * sin (radians(angle * i)));
  }
  endShape(CLOSE);
}


