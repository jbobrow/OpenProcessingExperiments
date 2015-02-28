
void setup(){
  size(500,500);
  smooth();
  frameRate(30); 
}
 void draw(){  
      background(255);
      if (mousePressed) {
    fill(0);
    ellipseMode(CENTER);
    //salt specks
    ellipse(250,450,10,5);
    ellipse(265,445,10,5);
    ellipse(230,450,10,5);
    ellipse(225,445,10,5);
    ellipse(215,460,10,5);
    ellipse(200,450,10,5);
    ellipse(180,460,10,5);
    ellipse(130,465,10,5);
    
     //salt dispenser's head
    ellipseMode(CENTER);
    stroke(0);
    fill(255);
   ellipse(mouseX,mouseY,70,70);
   //salt dispenser's holes
   noStroke();
   fill(0);
   ellipse(mouseX,mouseY+14,10,5);
   ellipse(mouseX-20,mouseY+17,10,5);
   ellipse(mouseX+20,mouseY+17,10,5);
   ellipse(mouseX+10,mouseY+25,11,6);
   ellipse(mouseX-10,mouseY+25,11,6);
   ellipse(mouseX,mouseY+33,12,6);
   
  //salt dispenser's body
  stroke(0);
  strokeWeight(1);
  fill(0);
  quad(mouseX-100,mouseY-300,mouseX+100,mouseY-300,mouseX+28,mouseY-20,mouseX-29,mouseY-20);
  //outline
  line(mouseX-105,mouseY-305,mouseX+105,mouseY-305);
  line(mouseX+105,mouseY-305,mouseX+31,mouseY-16);
  line(mouseX-105,mouseY-305,mouseX-32,mouseY-16);
  //center fill/pattern
  fill(255);
  noStroke();
  quad(mouseX-80,mouseY-280,mouseX+70,mouseY-275,mouseX+16,mouseY-22,mouseX-25,mouseY-30);
  fill(0);
  ellipse(mouseX-40,mouseY-245,40,40);
  quad(mouseX-60,mouseY-245,mouseX-20,mouseY-245,mouseX-5,mouseY-37,mouseX-20,mouseY-38);
  ellipse(mouseX+30,mouseY-240,40,40);
  quad(mouseX+10,mouseY-240,mouseX+50,mouseY-240,mouseX+15,mouseY-37,mouseX+5,mouseY-38);
  } else {
    
 //salt dispenser's head
    ellipseMode(CENTER);
    stroke(0);
    fill(255);
   ellipse(mouseX,mouseY,70,70);
   //salt dispenser's holes
   noStroke();
   fill(0);
   ellipse(mouseX,mouseY+14,10,5);
   ellipse(mouseX-20,mouseY+17,10,5);
   ellipse(mouseX+20,mouseY+17,10,5);
   ellipse(mouseX+10,mouseY+25,11,6);
   ellipse(mouseX-10,mouseY+25,11,6);
   ellipse(mouseX,mouseY+33,12,6);
   
  //salt dispenser's body
  stroke(0);
  strokeWeight(1);
  fill(0);
  quad(mouseX-100,mouseY-300,mouseX+100,mouseY-300,mouseX+28,mouseY-20,mouseX-29,mouseY-20);
  //outline
  line(mouseX-105,mouseY-305,mouseX+105,mouseY-305);
  line(mouseX+105,mouseY-305,mouseX+31,mouseY-16);
  line(mouseX-105,mouseY-305,mouseX-32,mouseY-16);
  //center fill/pattern
  fill(255);
  noStroke();
  quad(mouseX-80,mouseY-280,mouseX+70,mouseY-275,mouseX+16,mouseY-22,mouseX-25,mouseY-30);
  fill(0);
  ellipse(mouseX-40,mouseY-245,40,40);
  quad(mouseX-60,mouseY-245,mouseX-20,mouseY-245,mouseX-5,mouseY-37,mouseX-20,mouseY-38);
  ellipse(mouseX+30,mouseY-240,40,40);
  quad(mouseX+10,mouseY-240,mouseX+50,mouseY-240,mouseX+15,mouseY-37,mouseX+5,mouseY-38);
 
 }
}
