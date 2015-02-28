
int xPos;
int yPos;
int dia=100;
boolean testEdge;


void setup() {
  size(500, 500);
  smooth();
  xPos=width/2;
  yPos=height/2;
}

void draw() {
  background(100,56,98);
  fill(200,165,12);
  ellipse(xPos, yPos, dia, dia);
  
  if(testEdge==true){
    xPos-=1;
  }
  
  if(testEdge==false){
    xPos+=1;
  }
if(xPos == width-(dia/2)){
  testEdge=true;
}
if(xPos == 0+(dia/2)){
  testEdge=false;
}

}                
                
