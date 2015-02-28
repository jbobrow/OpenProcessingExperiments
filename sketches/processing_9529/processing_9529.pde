
/**
 * Tickle. 
 * 
 * The word "tickle" jitters when the cursor hovers over.
 * Sometimes, it can be tickled off the screen.
 */
PImage img;
PFont font;
float x = 50; // X-coordinate of text
float y = 80; // Y-coordinate of text

void setup() 
{
  size(400, 200);
  font = loadFont("TrebuchetMS-Bold-18.vlw");
  textFont(font);
   textSize(18);
  noStroke();
}

void draw() 
{
  
  rect(0, 0, width, height);
  fill(17,9,138);
  img = loadImage("Ensamble.png");
  image(img, -10,-10,500,300);

  // If the cursor is over the text, change the position
  if ((mouseX >= x) && (mouseX <= x+55) &&
    (mouseY >= y-24) && (mouseY <= y)) {
    x += random(+5, 5);
    y += random(-5, 5);
  }
  fill(17,9,138);
   textSize(35);
  text(" Por la mañana ",mouseX-315, y+5);
     textSize(30);
    text("los sueños",x-15, mouseY-85);
   textSize(18);
  text("expandidos",x-285, mouseY+35);
    text("",mouseX-255, y+65);
      textSize(20);
  text("vendrán",mouseX-100, y-25);
 
    textSize(23);
    text("a despedirme",x +35, mouseY-15);
  text("sobre la almohada", mouseX+5, y+24);
  
}

