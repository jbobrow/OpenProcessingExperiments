
// This is my final project. This is an experiment of 
// using mouse and key interactions to show text patterns and color effects
// The canvas is divided into 4 equal squares, different actions happen
// as you click on each of the regions

/*
KEYS
1-3 : stroke color
del, backspace : erase
s : save png


*/

// Global Variables
PFont f;
color strokeColor = color(1,10);


// setup()

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  f = createFont("Georgia", 40, true);

  background(360);
}
//draw()

void draw() {
if(mousePressed && mouseX < width/2 && mouseY < height/2) {
  pushMatrix();
  strokeWeight(2);
  stroke(strokeColor);
  fill(360,100,100,10);
  textFont(f,40);
  text("Great!",  mouseX, mouseY);
  popMatrix();
}

if(mousePressed && mouseX > width/2 && mouseY < height/2) {
  pushMatrix();
  strokeWeight(2);
  stroke(strokeColor);
  fill(strokeColor);
  translate(width/4, 0);
  rect(0,0,mouseX, mouseY);
  popMatrix();
}

if(mousePressed && mouseX < width/2 && mouseY > height/2) { 
   pushMatrix();
   translate(width/4, height/4);
   drawTarget(mouseX, mouseY, 200, 10);
   popMatrix();
   }


if(mousePressed && mouseX > width/2 && mouseY > height/2) {
  pushMatrix();

  noStroke();
  translate(width/2, height/2);
  drawPattern();
  popMatrix();
  }
}



void drawTarget(float xloc, float yloc, int size, int num)  {
  float strokeColor = 360/num;
  float steps = size/num;
  for (int i = 0; i < num; i++) {
    fill(i*strokeColor);
    ellipse(xloc, yloc, size - i*steps, size - i*steps);
  }
}

 void drawPattern() {
//   fill(127);
//    rect(0,0, width/2,height/2);
  for (int i = 0; i < height/2; i +=20) { 
    fill(strokeColor);
//    fill(129, 206, 15);
    rect(0, i, random(width/2), 10);
    fill(255);
    rect(i, 0, 10, random(height/2));
  }
 }  

//keyPressed()

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
  switch(key) {
    case'1':
    strokeColor = color(295, 78, 95, 10);
    break;
    case'2':
    strokeColor = color(267, 68, 93, 10);
    break;
    case'3':
    strokeColor = color(51, 98, 99, 10);
    break;
  }
}





