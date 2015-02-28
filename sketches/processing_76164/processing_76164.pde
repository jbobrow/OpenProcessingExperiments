
int myArray[];
int nElements = 100;

color backgroundColor = #413E4A;
color textColor = #F0B49E;

PFont myFont = createFont("Georgia-48",40);


void setup(){
  background(backgroundColor);
  size(200,200);
  
  myArray = new int[nElements];
  for (int i=0; i < nElements; i++){
  int randomInt = (int)random(100);
  myArray[i] = randomInt;
 }
}

void printIndex(){
  fill(backgroundColor, 100);
  noStroke();
  rect(0,0, width,height);
  
  fill(textColor);
  textFont(myFont);
  textAlign(CENTER);
  
  for (int i=0; i<100; i++){
    if (myArray[i] >= 96){
      text(i, mouseX,mouseY);
      break;
    }
  }
}

void draw(){
  smooth();
}

void mousePressed(){
  printIndex();
  
  for (int i=0; i < nElements; i++){
  int randomInt = (int)random(100);
  myArray[i] = randomInt;
 }
}
