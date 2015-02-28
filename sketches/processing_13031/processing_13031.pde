
int x = 225;
int y = 5;
int width = 800;
int height = 600;


void setup() {
  size(800, 600);
  
  background (255);
  mouseX = 600;
  mouseY = 500;
  smooth();
  PImage b; 
    b = loadImage("sydney-city.jpg");
    image(b, 50, 50);
  text();
  text2();
  stroke(225);
  noFill();
  rect (240, 435, 600,140);
  PImage a; 
    a = loadImage("palette.jpg");
    image(a, 560, 400, 285,245);
  }


void draw() {
  if (mousePressed) {
    noStroke();
    fill(random(x),random(x),random(x),random(y));
    ellipse(mouseX, mouseY, 30, 30);
  } else {
    noStroke ();
    ellipse(mouseX, mouseY, 30, 30);
  }
    ellipse (200, 440, 10, 10);
    ellipse (200, 480, 10, 10);
    ellipse (200, 520, 10, 10);
    ellipse (200, 560, 10, 10); 
  }

void text() {
PFont font;
font = loadFont("GillSansMT-Bold-48.vlw"); 
textFont(font); 
fill(0, 0, 0, 255);
text("paint", 45, 480); 
fill(0, 102, 153);
text("your", 55, 510);
fill(0, 102, 153, 51);
text("city", 75, 540);

}

void text2() {
PFont font;
font = loadFont("ArialMT-12.vlw"); 
textFont(font); 
fill(0, 0, 0, 255);
text("Use your pointer to paint your Sydney.", 250, 465); 
fill(0, 102, 153);
text("Click, or touch the paint palette to begin or change colours", 250, 495);
fill(0, 102, 153, 150);
text("Leaving the pointer in one spot will make a colour darker", 250, 525);
fill(0, 102, 153, 80);
text("(note: Best when using tablet pen)", 250, 555);
}


