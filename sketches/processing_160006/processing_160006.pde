
//Variables
int WIDTH = 600;
int HEIGHT = 600;
color color1 = #000000;
color color2 = #FFFFFF;

//Setup
void setup(){
 size(600, 600);
 background(color1);
}

//Structure
void draw(){ 
  frameRate(30);
  stroke(random(170, 255), random(160, 250), random(0, 50), 10);
  fill(random(170, 255), random(160, 250), random(0, 50), 10);
  ellipse(mouseX, mouseY, 350, 350);
  stroke(random(200, 255), random(120, 140), random(0, 60), 20);
  fill(random(200, 255), random(120, 140), random(0, 60), 20);
  ellipse(mouseX, mouseY, 300, 300);
  stroke(random(170, 255), random(0, 160), random(60, 115), 30);
  fill(random(170, 255), random(0, 160), random(60, 115), 30);
  ellipse(mouseX, mouseY, 250, 250);
  stroke(random(180, 255), random(0, 80), random(80, 130), 40);
  fill(random(90, 110), random(0, 55), random(170, 255), 40);
  ellipse(mouseX, mouseY, 200, 200);
  stroke(random(90, 110), random(0, 55), random(170, 255), 50);
  fill(random(90, 110), random(0, 55), random(170, 255), 50);
  ellipse(mouseX, mouseY, 150, 150);
  stroke(random(0, 70), random(180, 240), random(170, 240), 60);
  fill(random(0, 70), random(180, 240), random(170, 240), 60);
  ellipse(mouseX, mouseY, 100, 100);
  stroke(random(30, 70), random(170, 240), random(0, 40), 70);
  fill(random(30, 70), random(170, 240), random(0, 40), 70);
  ellipse(mouseX, mouseY, 50, 50);
}

  
  
  //ELLIPSES INSIDE ELLIPSES WITH DIFFERENT TRANSPARENCIES AND COLORS


