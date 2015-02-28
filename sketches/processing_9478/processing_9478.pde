
/**
 * Tickle. 
 * 
 * The word "tickle" jitters when the cursor hovers over.
 * Sometimes, it can be tickled off the screen.
 */

PFont font;
float x = 50; // X-coordinate of text
float y = 80; // Y-coordinate of text

void setup() 
{
  size(400, 200);
  font = loadFont("AmericanTypewriter-24.vlw");
 
  textFont(font);
   textSize(18);
  noStroke();
}

void draw() 
{
  fill(25);
  rect(0, 0, width, height);
  fill(255,0,0);
  // If the cursor is over the text, change the position
  if ((mouseX >= x) && (mouseX <= x+55) &&
    (mouseY >= y-24) && (mouseY <= y)) {
    x += random(+5, 5);
    y += random(-5, 5);
  }
  fill(235);
  text("en silencio",mouseX-315, y+5);
  fill(235);
  text("expandidos",x-285, mouseY+35);
  fill(225,0,0);
  text("fluyendo",mouseX-255, y+65);
  fill(235);
  text("plenos",x-225, mouseY-45);
  text("vacíos",mouseX-100, y-10);
  text("al amanecer",mouseX-60, y-50);
  fill(225,0,0);
  text("Estábamos",x-25, mouseY-25);
  text("unidos", mouseX, y);
   fill(235);
  text("separados",x+225,mouseY +25);
  text("y",X+50,mouseY+50);
  fill(225,0,0);
  text("soñando",x+75,mouseY+75);
  text("en la noche",x-215,mouseY+105);
   fill(235);
  text("despiertos",x-355,mouseY+175);
}

