
int x, y;
int xspeed, yspeed;

void setup() {

  size(800, 800);
  smooth();
  background(255);
  //PImage b;
  //b = loadImage("Logo.jpg");
  //image(b, (width/2)-197, (height/2)-197);
  stroke(255, 0, 0);
  strokeWeight(.1);
  noFill();
  xspeed = 1;
  yspeed = 2;
  x = width/2;
  y = height/2;
}

void draw() {
  x += xspeed;
  y += yspeed;
    beginShape();
    vertex(x+8, y-16.5);
    bezierVertex(x+39, y-58, x+54, y-75, x+44, y-64);
    bezierVertex(x+58, y-79, x+79.5, y-74, x+67, y-74);
    bezierVertex(x+83, y-79, x+92, y-56.5, x+90, y-59);
    bezierVertex(x+93, y-53, x+93, y-49, x+93, y-49);
    bezierVertex(x+93, y+51, x+93, y+70, x+93, y+51);
    bezierVertex(x+88, y+73, x+80, y+74, x+76, y+74);
    bezierVertex(x+65, y+74, x+50, y+66, x+59, y+72);
    bezierVertex(x+31, y+50, x-11, y+11, x+12, y+32);
    bezierVertex(x-27, y-3, x-32, y-8, x-29, y-5);
    bezierVertex(x-45, y-19, x-54, y-27, x-49, y-23);
    bezierVertex(x-57, y-27, x-57, y-17, x-57, y-17);
    bezierVertex(x-57, y+50, x-57, y+50, x-57, y+50);
    bezierVertex(x-57, y+50, x-56, y+59, x-57, y+50);
    bezierVertex(x-52, y+60, x-49, y+56, x-45, y+52);
    vertex(x-13, y+12);
    vertex(x-8, y+16);
    bezierVertex(x-39, y+58, x-49, y+70, x-44, y+64);
    bezierVertex(x-55, y+80, x-80, y+74, x-67, y+74);
    bezierVertex(x-88, y+76, x-92, y+56, x-90, y+64);
    bezierVertex(x-93, y+64, x-93, y+50, x-93, y+50);
    bezierVertex(x-93, y-50, x-93, y-63, x-93, y-50);
    bezierVertex(x-95, y-73, x-72, y-75, x-76, y-74);
    bezierVertex(x-66.5, y-74, x-60, y-71, x-50, y-67);
    bezierVertex(x-32, y-50, x-12, y-33, x+11, y-11);
    bezierVertex(x+26, y+4, x+28, y+5, x+31, y+8);
    bezierVertex(x+44, y+19, x+53, y+26, x+50, y+22.5);
    bezierVertex(x+57, y+23, x+57, y+17, x+57, y+17);
    bezierVertex(x+57, y-50, x+56, y-50, x+57, y-50);
    bezierVertex(x+57, y-50, x+56.7, y-51, x+56, y-57);
    bezierVertex(x+52, y-61, x+44, y-53, x+48, y-57);
    vertex(x+13, y-12);
    endShape(CLOSE);
    
    if ( (y > height-40) || (y < 40) ) {
      yspeed *= -1;
      stroke(0, 0, 0);
    }
    if ( (x > width-80) || (x < 80) ) {
      xspeed *= -1;
      stroke(255, 0, 0);
    }

    
  //frameRate(1);
  //println(mouseX + " : " + mouseY);
}


