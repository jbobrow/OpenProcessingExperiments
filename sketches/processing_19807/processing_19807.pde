
PFont joe;
String[] fred = {
  "L", "3", "X", "1", "R", "3" };
int counter = 1;
 
void setup(){
  background(0);
  size(250,250);
  smooth();
  joe = createFont("",48);
}
 
 
void draw(){
  fill(0,random(255),100);
  textFont(joe,50);
  if(keyPressed){
   fill(0,0,0,10);
   rect(0,0,250,250);
 }
}
 
 
void mousePressed(){
    text(fred[counter],mouseX,mouseY);
    if(counter<fred.length-2){
      counter++;
    }
    else {
      counter=0;
    }
}

