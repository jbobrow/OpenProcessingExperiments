
//James Robe
//Edit of Nicollete's smiley face
// 1/20/14
// NMD 195
int b = 255;
boolean happy = true;
boolean sad = false;
int x;
int y;

void setup(){
  int value=0;
 size(500,500);
 background(0);
 noStroke();
    fill(#FFcccc);
}

void draw(){
     smooth(); 
 y = mouseY;
x = mouseX;

strokeWeight(10);

//this is the bottom part of here hair
fill(#F2DA91);
 beginShape();
   curveVertex(150, 256);
   curveVertex(155, 249);
   curveVertex(145, 346);
   curveVertex(222, 368);
   curveVertex(316, 353);
   curveVertex(340, 308);
   curveVertex(341, 252);
   curveVertex(345, 249);
   endShape();
   
   //these are the pupils
  fill(#6699FF);
  ellipse(210,210,25,25);
  ellipse(290,210,25,25);
  
  //the structure of the face,  including the outer edge of the eyes
strokeWeight(10);
  fill(255);      
  ellipse(250,200,185,150);
  ellipse(250,250,175,175);
  ellipse(160,225,25,50);
  ellipse(340,225,25,50);
  fill(255);
  ellipse(210,210,30,30);
  ellipse(290,210,30,30);
  fill(0);
  ellipse(210,210,15,15);
  ellipse(290,210,15,15);
  fill(255);
  ellipse(215,205,5,5);
  ellipse(295,205,5,5);
  line(250,225,235,260);
  line(235,260,250,260);
  //bow
  stroke(#00ff00);
  fill(#cc5490); 
  quad(185, 170, 185, 120,
        260, 170, 260, 120);
      fill(0);

  //these statements change whether the face is happy
  //or not impressed
  if (happy == true){
  stroke(0);  
  stroke(#cc5490);
  beginShape();
  line(225, 295, 235, 285);
  line(235, 285, 255, 285);
  line(255, 285, 265, 295);
  line(265, 295, 250, 310);
  line(250, 310, 225, 295);
  endShape();
  
  //these are the blue pupils of the eyes
  fill(#6699FF);
  ellipse(211, 213, 30, 30);
  ellipse(293, 211, 30, 30);
//  arc(250,275,100,75,0,PI);
  }
  
  if (sad == true){
   stroke(5);
    fill(0);
    line(200,275,300,275);
  }
}

//these statements track what keys are being pressed
// and change the boolean variables accordingly
void keyPressed() { 
  
  if (key == CODED) {
    if (keyCode == UP) {
happy = true;
sad = false;
println("happy");
      
    } if (keyCode == DOWN) {
   happy = false;
   sad = true;
   println("sad");
    }
    if (keyCode == ALT) {
      println(x);
      println(y);
    }
  }
} 


