
/*Jenny McCarthy 02/01/14
HW 5: Interactive drawing
*/

void setup (){
  size (400,400);
  frameRate(20);
}

float circleX = 0;
float circleY = 400; //cirlce starting positions
float fade1 = 0;
float fade2 = 0;
float fade3 = 0;
float fade4 = 0; //colored rectangles fade

boolean button = false;
int x = 150;
int y = 150;
int w = 100;
int h = 100; //dimensions of the button

float posX;
float posY; //position of the mouse

void draw(){
  background(255);
  
  if (button) {
    background(0);
    stroke(random(255),random(255),random(255));
  } else {
    background (255);
    stroke(random(255),random(255),random(255)); //when pressing the button, background changes from white to black
  }
  rect(x,y,w,h); //button

  noStroke();
  
  if (mouseX < 300 && mouseY < 100) {
    fade1 = 255; //purple rectangle
  } else if (mouseX > 100 && mouseY < 300) {
     fade2 = 255; //red rectangle
  } else if (mouseX < 100 && mouseY > 100) {
     fade3 = 255; //green rectangle
  } else if (mouseX > 100 && mouseY > 300) {
     fade4 = 255; //blue rectangle
  }
     
  fade4 = fade4 - 10;
  fade3 = fade3 - 10;
  fade2 = fade2 - 10;
  fade1 = fade1 - 10;
  
  fill(150,50,250,fade1);
  rect(0,0,300,100); //purple
  fill(250,50,50,fade2);
  rect(300,0,100,300); //red
  fill(100,250,50,fade3);
  rect(0,100,100,300); //green
  fill(50,150,200,fade4);
  rect(100,300,300,100); //blue
  
  if (mousePressed) {
    fill(random(255),random(255),random(255));
    ellipse(circleX,350,50,50); //left to right
    ellipse(350,circleY,50,50); //bottom to top
    ellipse(50,circleX,50,50); //top to bottom 
    ellipse(circleY,50,50,50); //right to left
    stroke(random(255),random(255),random(255),random(255));
    smooth();
    line(posX,posY,mouseX,mouseY); //when pressing the mouse, beginning of the line stays where you clicked, the end of the line follows mouse
  }
  
  noStroke();
  fill(random(255),random(255),random(255),50);
  ellipse(circleX,350,100,100); //left to right
  ellipse(50,circleX,100,100); //top to bottom
  circleX = circleX +5; 
  ellipse(350,circleY,100,100);  //bottom to top
  ellipse(circleY,50,100,100); //right to left
  circleY = circleY -5;
  
  if (circleX > 400) {
    circleX = 0; //circles loop back to starting position
  }
  if (circleY < 0) {
    circleY = 400; //circles loop back to starting position
  }
  
  stroke(random(255),random(255),random(255),random(255));
  strokeWeight(5);
  line(pmouseX, pmouseY, mouseX, mouseY); //line that changes color follows the mouse 
}

void mousePressed(){
  posX = mouseX;
  posY = mouseY;
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
     button = !button; //pressing the button
  }
}
  


