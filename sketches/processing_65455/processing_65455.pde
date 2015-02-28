
float time = 0;

void setup() {
  frameRate(80);
  background(#ffffff);
  size(1024, 768);
  smooth();
 
  PImage b;
  b = loadImage("data/graffiti.jpg");
  background(b);
}
 
void fade()
{
  if(time > 5)
  {
    fill(#FFFFFF,50);
    rectMode(CORNER);
    noStroke();
    rect(60,120,836,510);
    time = 0;
  }
}
void draw() {
  
  fade();
  time += 0.01;
  
  float marker = random(3, 6);
  
  int x = mouseX;
  int y = mouseY;
  int px = pmouseX;
  int py = pmouseY;
  
  x = constrain( x, 60, 892);
  y = constrain( y, 120, 624); 
  px = constrain( px, 60, 892);
  py = constrain( py, 120, 624); 
 
  // Draw if mouse is pressed
   if(keyPressed) {
    if (key == 'q' || key == 'Q') {
       stroke(0, 20);
       strokeWeight(marker+4);
       line(px, py, x, y);
       stroke(0);
       strokeWeight(marker);
       line(px, py, x, y);
    }
    else if (key == 'b' || key == 'B' || key == 'w' || key == 'W') {
       stroke(#00008B, 20);
       strokeWeight(marker+4);
       line(px, py, x, y);
       stroke(#00008B);
       strokeWeight(marker);
       line(px, py, x, y);
    }
    else if (key == 'g' || key == 'G' || key == 'e' || key == 'E') {
       stroke(#00611C, 20);
       strokeWeight(marker+4);
       line(px, py, x, y);
       stroke(#00611C);
       strokeWeight(marker);
       line(px, py, x, y);
    }
    else if (key == 'r' || key == 'R') {
       stroke(#8B0000, 20);
       strokeWeight(marker+4);
       line(px, py, x, y);
       stroke(#8B0000);
       strokeWeight(marker);
       line(px, py, x, y);
    }
    else if (key == 't' || key == 'T') {
       stroke(#40E0D0, 20);
       strokeWeight(marker+4);
       line(px, py, x, y);
       stroke(#40E0D0);
       strokeWeight(marker);
       line(px, py, x, y);
    }
    else if (key == 'y' || key == 'Y') {
       stroke(#EEAD0E, 20);
       strokeWeight(marker+4);
       line(px, py, x, y);
       stroke(#EEAD0E);
       strokeWeight(marker);
       line(px, py, x, y);
    }
 }
 else if(mousePressed && (mouseButton == LEFT)) {
       stroke(#FFFFFF);
       strokeWeight(marker+10);
       line(px, py, x, y);
 }
 else if(mousePressed && (mouseButton == RIGHT)) {
       PImage b;
       b = loadImage("data/graffiti.jpg");
       background(b);
 }
} 

