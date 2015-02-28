
PFont bob;
int bobSize = 40;
String AJ2 = "L6A 1J3";
String[] AJ = {
  "L", "6", "A", "1", "J", "3"};
int counter = 0;
 
void setup(){
  size(250,250);
  smooth();
  background(255);
  bob = createFont("BrushScriptStd",100);
}
 
  
void draw(){
  if (keyPressed) {
    if(key == ' '){
      background(255);
    }
  }
  fill(255,15);
  noStroke();
  rect(0,0,250,250);
  fill(255);
  textFont(bob,bobSize);
 
  
}
  
void mousePressed(){
  textFont(bob, 50);
  fill(0);
  text(AJ2,0,125);
  
  
  fill(random(255),random(0),random(50));
  text(AJ[counter],mouseX,mouseY);
  if(counter<AJ.length-1){
      counter++;
}
 else {
      counter=0;
    }
}


