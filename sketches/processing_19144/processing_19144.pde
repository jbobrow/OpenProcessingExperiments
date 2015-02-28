
PFont bob;
int bobSize = 32;
String[] louise = {
  "P", "1", "L", "0", "A", "1"}; 
int counter = 0;

void setup(){
  size(250,250);
  smooth();
  background(0);
  bob = createFont("Garamond",100);
}

 
void draw(){
  fill(0,5);
  noStroke();
  rect(0,0,250,250);
  fill(255);
  textFont(bob,bobSize);
}
 
void mousePressed(){
  textFont(bob, 100);
  fill(random(255),random(255),random(255),random(255));
  text(louise[counter],mouseX-(textWidth(louise[counter])/2),mouseY+(bobSize/4));
  if(counter<louise.length-1){
      counter++;
}
 else {
      counter=0;
    }
}


