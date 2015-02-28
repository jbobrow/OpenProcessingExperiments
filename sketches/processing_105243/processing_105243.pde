
PImage alex;
PFont label;



void setup(){
 size(800,800);
 alex = loadImage("alex.jpg");
 label = loadFont("label.vlw");


}




void draw(){
image(alex, 0,0,800,800);

//LEFTEYE
if(((mouseX >= 270) && (mouseX <= 390)) && ((mouseY >=280) && (mouseY <= 350))){
 println("lefteye");
  fill(0);
 textFont(label);
 text("Left Eye", mouseX, mouseY);
 }
 
//RIGHTEYE
 if(((mouseX >= 500) && (mouseX <= 610)) && ((mouseY >=280) && (mouseY <= 350))){
 println("lefteye");
  fill(0);
 textFont(label);
 text("Right Eye", mouseX, mouseY);
 }
 


   
 
 //NOSE
 if(((mouseX >= 390) && (mouseX <= 470)) && ((mouseY >=310) && (mouseY <= 490))){
 println("lefteye");
  fill(0);
 textFont(label);
 text("Nose", mouseX, mouseY);
 }
 
 //MOUTH
  if(((mouseX >= 350) && (mouseX <= 530)) && ((mouseY >=550) && (mouseY <= 630))){
 println("lefteye");
  fill(0);
 textFont(label);
 text("Mouth", mouseX, mouseY);
  }
 


}



