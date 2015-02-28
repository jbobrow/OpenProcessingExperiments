
//Chelsea Domaleski
//Processing Homework
//September 18

float x = 250;
float y = 190;
float w = 150;
float h = 150;
void setup(){
 size(500,500);
 background(0, 0, 0);
 stroke(0);
 noFill();
}

void draw(){
 background(220, 254, 253);
 ellipse(250,190,150,150);
 fill(200, 40, 20);
 if(mousePressed){
  if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
   println("The mouse is pressed and over the button");
   fill(0);
  }
 } 
}

