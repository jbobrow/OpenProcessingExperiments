
void setup(){
  size(400,200);
  background (121,184,214);
  smooth();
  fill(255);
  ellipseMode(CENTER);
 
  //clouds left
  ellipse(80,46,15,15);
  ellipse(87,36,20,20);
  ellipse(59,39,20,20);
  ellipse(65,45,10,10);
  ellipse(65,30,20,20);
  ellipse(75,35,30,30);
  ellipse(87,55,5,5);
  ellipse(96,47,5,5);
  ellipse(89,45,5,5);
 
  //clouds center
  ellipse(205,55,20,20);
  ellipse(205,65,10,10);
  ellipse(230,57,25,25);
  ellipse(220,55,30,30);
  ellipse(210,65,5,5);
  ellipse(190,65,5,5);

  //clouds right
  ellipse(360,65,10,10);
  ellipse(360,65,20,20);
  ellipse(370,57,25,25);
  ellipse(350,55,30,30);
  ellipse(320,65,5,5);
  ellipse(290,65,5,5);
 
  //bottom clouds (a mix of center and left clouds with diff't X and Y)
  ellipse(160,165,10,10);
  ellipse(160,165,20,20);
  ellipse(170,157,25,25);
  ellipse(150,155,30,30);
  ellipse(120,165,5,5);
  ellipse(190,165,5,5);
  ellipse(105,155,20,20);
  ellipse(105,165,10,10);
  ellipse(130,157,25,25);
  ellipse(120,155,30,30);
  ellipse(110,165,5,5);
  ellipse(190,165,5,5);
 
}

void draw(){


}


void mousePressed(){
  stroke(0);
  fill(121);
  rectMode(CORNER);
  rect(mouseX, mouseY, 30, 200);
  fill(100);
  quad(mouseX,mouseY, mouseX-10, mouseY+10, mouseX-10, mouseY+200, mouseX, mouseY+200);
 
  /*I figured out quad by first figuring out each line to make perspective.)
  If you only use line, you cant fill it with a color to give it a shadow.)
 
  line(mouseX, mouseY, mouseX-10, mouseY+10);
  line(mouseX-10, mouseY+10, mouseX-10, mouseY+200);
  line(mouseX-10, mouseY+200, mouseX, mouseY+200);*/

}

void keyPressed(){
  stroke(0);
  fill(57,19,19);
  rectMode(CORNER);
  rect(mouseX, mouseY, 20, 200);
  fill(72,44,44);
  quad(mouseX,mouseY, mouseX-10, mouseY+10, mouseX-10, mouseY+200, mouseX, mouseY+200);
  
}

