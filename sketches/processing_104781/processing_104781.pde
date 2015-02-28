
/**
 * LoadFile 1
 * 
 * Loads a text file that contains two numbers separated by a tab ('\t').
 * A new pair of numbers is loaded each frame and used to draw a point on the screen.
 */

String[] lines;
String[] pieces;
String colour = "0000FF";
int index = 0;
int newElX = -10;
int newElY = -10;
int xPos = 15;
int yPos = 10;
PFont a;
PImage gk;
PImage gkframe;

void setup() {
  size(400, 800);
  background(0, 0);
  stroke(255);
  frameRate(12);
  lines = loadStrings("positions.txt");
  a = createFont("Square721BT-Roman-14.vlw", 14);
  gk = loadImage("gklarge.png");
  gkframe = loadImage("gkframe.png");
  image(gkframe, 0, 0);
  rectMode(LEFT);

  imageMode(CENTER);
}

void draw() {
  if (index < lines.length) {
    pieces = split(lines[index], '\n');
  }
  image(gkframe, width/2, height/2-50);
  color c = get(mouseX, mouseY);
  noStroke();
  fill(0);
  rect(0, 0, width, 700);
  image(gk, width/2, height/2-50);
  fill(255, 0, 0);
  ellipse(newElX, newElY, 5, 5); 
  if (c >= -65281-10 && c <= -65281+10) {
    if (mouseX >= newElX+5 || mouseX <= newElX-5 || 
      mouseY >= newElY+5 || mouseY <= newElY-5) {
      switchPic = 1;
      newElX = mouseX;
      newElY = mouseY;
      fill(255, 0, 0);
      ellipse(newElX, newElY, 6, 6);
      fill(#c0deed);
      noStroke();
      triangle(15, 700, 10, 710, 20, 710);
      rect(10, 710, 390, 790);
      index = int(random(0, lines.length));
      ////text following the mouse
      //text(lines[index], mouseX+5, mouseY+5);
      ////text below the image
      fill(#333333);
      text(lines[index], 12, 712, 350, 790);
      // Go to the next line for the next run through draw()
      index++;
    }
  }
}



