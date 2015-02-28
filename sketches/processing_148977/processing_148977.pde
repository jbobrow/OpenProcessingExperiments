

/*Konkuk University 
Department of Dynamic Media 
SOS iDesign 
Name:Park Seeun
ID:201420078
*/ 

void setup() { 
  size (displayWidth,displayHeight); 
  smooth(); 
  frameRate(20);
} 

void draw() {
    background(#A3D7BD);
      for (int a=10; a<width; a=a+50) { 
      for (int b=10; b<height; b=b+50) { 
      stroke(255, 255, 255,200); 
      strokeWeight(0.05); 
      ellipse(a, b, 80, 80);
      ellipse(a, b, 50, 50);
      ellipse(a, b, 30, 30); 
    } 
  } 
  strokeWeight(20);
  line(mouseX, mouseY, pmouseX, pmouseY); 
  fill(#AD71AA);
  ellipse(mouseX, mouseY, 200,200);
  fill(#E7D981);
  ellipse(mouseX, mouseY, 130,130);
  fill(#E291B1);
  ellipse(mouseX, mouseY, 100,100);
  fill(#F8C0D6);
  ellipse(mouseX, mouseY, 50,50);
} 

void keyPressed() { 
  background(255,255,255,5); 
  redraw(); 
} 

void title() {  
  fill(100); 
  textAlign(25); 
  text("ParkSeeun,sad,Dynamic Media,2014", 500, 500); 
} 
