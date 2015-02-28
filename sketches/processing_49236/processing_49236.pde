
PFont font;
float angle = 0.0;
 
void setup(){
size(900,900);
smooth();
font = loadFont("AppleGothic-48.vlw");
textFont(font);
}
int circleSize = 10;
int shrinkOrGrow = 1;
 
void setup() {
  size(930, 930);
  background(255);
  smooth();
  noStroke();
  frameRate(20);
 
  PFont font1;
   
  //First Square
  fill(0, 0, 51);
  rect(20, 20, 400, 400);
   
  
   
  //Second Square
  fill(455, 204, 40);
  rect(20, 20, 400, 400);
   
 
   
  //Third Square
  fill(255, 0, 102);
  rect(10, 420, 200, 200);
   
  
  popMatrix();
   
  //Fourth Square
  fill(0, 204, 204);
  rect(420, 420,400, 400);
   
  fill(55);
  font1 = loadFont("Tahoma-80.vlw");
  textFont(font1);
  text("", 432, 340);
}
 
void draw() {
   
  
 
  fill(0, 204, 204);
  ellipse(0, 0, circleSize, circleSize);
 
}
 background(300,20,939);
  smooth(); 
void draw(){
  //background(34);
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(000);
  textSize(19);
  text("Reyhan Web 2.0", width/50, height/50);
  angle += 0.01;
  popMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(#333555);
  textSize(6);
  text("Spin", width/20, height/20);
  angle -= 0.5;
}

                
                                
