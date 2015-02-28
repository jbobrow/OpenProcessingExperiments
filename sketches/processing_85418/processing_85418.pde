
void setup(){
  
  size(800,800);
}


void draw(){

  background(155); // clear background
  
  fill(255);
  println("Mouse X:" + mouseX + "Mouse Y:" +mouseY);
  
  // headshape
  fill(66,116,65);
  triangle(mouseX+0,mouseY+200,mouseX+400,mouseY+25,mouseX+375,mouseY+175);
  
  //cheeks
  fill(79,116,140);
  rect(mouseX+300, mouseY+100, 150, 50);
  rect(mouseX+250, mouseY+150, 150, 50);  
  
  //eye
  fill(mouseX, mouseY, 255);
  ellipse(mouseX+330-55, mouseY+125, 40,40);
  //pupil
  fill(0);
  ellipse(mouseX+322-55, mouseY+125, 20,30);
  
  //Whisker 1
  line(mouseX +112,mouseY  +174,mouseX  +125,mouseY  +210);
  //whisker 2
  line(mouseX +130,mouseY  +180,mouseX  +157,mouseY  +199);
  
  
  fill(110,45,45);
  //top plate
  quad(mouseX+25, mouseY+180,mouseX+275,mouseY+25,mouseX+340,mouseY+75, mouseX+25, mouseY+190);
  //back plate (counter-clockwise)
  quad(mouseX+300, mouseY+25, mouseX+360, mouseY+90, mouseX+460, mouseY+90, mouseX+400, mouseY+10);
}



