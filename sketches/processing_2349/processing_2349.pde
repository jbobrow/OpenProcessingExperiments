
/*

Spider
daria@darialanz.com
June 2009
Daria Lanz

*/

void setup() {
  size(800,800);
  smooth();
  frameRate(30);
  
  
  
};

void draw() {
  
  background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  
  //web
  stroke(125,125,125);
  noFill();
  line(0,0,800,800);
  line(800,0,0,800);
  line(200,0,600,800);
  line(400,0,400,800);
  line(600,0,200,800);
  line(800,200,0,600);
  line(800,400,0,400);
  line(800,600,0,200); 
  ellipse(400,400,50,50);
  ellipse(400,400,100,100);
  ellipse(400,400,150,150);
  ellipse(400,400,200,200);
  ellipse(400,400,275,275);
  ellipse(400,400,350,350);
  ellipse(400,400,450,450);
  ellipse(400,400,550,550);
  ellipse(400,400,660,660);
  ellipse(400,400,770,770);
  ellipse(400,400,880,880);
  
  
   //Spidy's body
   stroke(0);
   fill(0);
   ellipse(mouseX, mouseY, 90, 80);
   
   //Spidy's head
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY-30, 60,60);
  
  //Spidy's eyes
  fill(mouseX, 0, mouseY);
  ellipse(mouseX-15, mouseY-37,16,25);
  ellipse(mouseX+15, mouseY-37,16,25);
   
   //Spidy's legs
  stroke(0);
  line(mouseX-10, mouseY+40, pmouseX-10, pmouseY+80);
  line(mouseX+10, mouseY+40, pmouseX+10, pmouseY+80);
  line(mouseX-22, mouseY+34, pmouseX-22, pmouseY+73);
  line(mouseX+22, mouseY+34, pmouseX+22, pmouseY+73);
  line(mouseX-33, mouseY+26, pmouseX-33, pmouseY+60);
  line(mouseX+33, mouseY+26, pmouseX+33, pmouseY+60);
  line(mouseX-45, mouseY, pmouseX-45, pmouseY+50);
  line(mouseX+45, mouseY, pmouseX+45, pmouseY+50);
 
};

