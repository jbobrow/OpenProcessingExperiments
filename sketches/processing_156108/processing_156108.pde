
PImage picSexy;
PFont fontName;

void setup(){
  size(600,800);
  colorMode(HSB, 360, 100, 100);
  picSexy = loadImage("pic1.jpg");
  fontName = createFont("Baskerville", 32);
}

void draw(){
  float color1 = map(mouseX, 0, width, 0, 360);
  float color2 = map(mouseY, 0, height, 0, 100);
  float pnp = map(sin(frameCount), -1, 1, 50, 100);
 
  background(color1, color2, frameCount);
 
  image(picSexy, mouseX, mouseY, mouseX, mouseY);
  textFont(fontName);
  fill(359, 99, 99);
  text("whatthehellyouwaitingfor!?", mouseX, mouseY-20);
  
  noStroke();
  fill(178, 99, 99);
  ellipse(mouseX, pnp, pnp - 80, pnp - 80);
  fill(178, 99, 99);
  ellipse(mouseY, pnp, pnp - 80, pnp - 80);
  fill(178, 99, 99);
  ellipse(mouseX+60, pnp+40, pnp - 80, pnp - 80);
  fill(178, 99, 99);
  ellipse(mouseY+60, pnp+40, pnp - 80, pnp - 80);
  fill(178, 99, 99);
  ellipse(mouseX+60, pnp, pnp - 80, pnp - 80);
  fill(178, 99, 99);
  ellipse(mouseY+60, pnp, pnp - 80, pnp - 80);
  fill(178, 99, 99);
  ellipse(mouseX+120, pnp+40, pnp - 80, pnp - 80);
  fill(178, 99, 99);
  ellipse(mouseY+1200, pnp+40, pnp - 80, pnp - 80);
  
  
  
  

}


