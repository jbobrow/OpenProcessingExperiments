
int x, y;

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
  x = width/2;
  y = height/2;
}

void draw() {
  stroke(255, mouseX, mouseY);
  for(int i = mouseX; i <= 800; i += x) {
    for(int j = mouseY; j <= 800; j += y) {
    beginShape();
    vertex(x+8-i, y-16.5+j);
    bezierVertex(x+39-i, y-58+j, x+54-i, y-75+j, x+44-i, y-64+j);
    bezierVertex(x+58-i, y-79+j, x+79.5-i, y-74+j, x+67-i, y-74+j);
    bezierVertex(x+83-i, y-79+j, x+92-i, y-56.5+j, x+90-i, y-59+j);
    bezierVertex(x+93-i, y-53+j, x+93-i, y-49+j, x+93-i, y-49+j);
    bezierVertex(x+93-i, y+51-j, x+93-i, y+70-j, x+93-i, y+51-j);
    bezierVertex(x+88-i, y+73-j, x+80-i, y+74-j, x+76-i, y+74-j);
    bezierVertex(x+65-i, y+74-j, x+50-i, y+66-j, x+59-i, y+72-j);
    bezierVertex(x+31-i, y+50-j, x-11+i, y+11+j, x+12-i, y+32-j);
    bezierVertex(x-27+i, y-3+j, x-32+i, y-8+j, x-29+i, y-5+j);
    bezierVertex(x-45+i, y-19+j, x-54+i, y-27+j, x-49+i, y-23+j);
    bezierVertex(x-57+i, y-27+j, x-57+i, y-17+j, x-57+i, y-17+j);
    bezierVertex(x-57+i, y+50-j, x-57+i, y+50-j, x-57+i, y+50-j);
    bezierVertex(x-57+i, y+50-j, x-56+i, y+59-j, x-57+i, y+50-j);
    bezierVertex(x-52+i, y+60-j, x-49+i, y+56-j, x-45+i, y+52-j);
    vertex(x-13+i, y+12-j);
    vertex(x-8+i, y+16-j);
    bezierVertex(x-39+i, y+58-j, x-49+i, y+70-j, x-44+i, y+64-j);
    bezierVertex(x-55+i, y+80-j, x-80+i, y+74-j, x-67+i, y+74-j);
    bezierVertex(x-88+i, y+76-j, x-92+i, y+56-j, x-90+i, y+64-j);
    bezierVertex(x-93+i, y+64-j, x-93+i, y+50-j, x-93+i, y+50-j);
    bezierVertex(x-93+i, y-50+j, x-93+i, y-63+j, x-93+i, y-50+j);
    bezierVertex(x-95+i, y-73-j, x-72+i, y-75+j, x-76+i, y-74+j);
    bezierVertex(x-66.5+i, y-74+j, x-60+i, y-71+j, x-50+i, y-67+j);
    bezierVertex(x-32+i, y-50+j, x-12+i, y-33+j, x+11-i, y-11+j);
    bezierVertex(x+26-i, y+4-j, x+28-i, y+5-j, x+31-i, y+8-j);
    bezierVertex(x+44-i, y+19-j, x+53-i, y+26-j, x+50-i, y+22.5-j);
    bezierVertex(x+57-i, y+23-j, x+57-i, y+17-j, x+57-i, y+17-j);
    bezierVertex(x+57-i, y-50+j, x+56-i, y-50+j, x+57-i, y-50+j);
    bezierVertex(x+57-i, y-50+j, x+56.7-i, y-51+j, x+56-i, y-57+j);
    bezierVertex(x+52-i, y-61+j, x+44-i, y-53+j, x+48-i, y-57+j);
    vertex(x+13-i, y-12+j);
    endShape(CLOSE);
  }
  }
  //frameRate(1);
  //println(mouseX + " : " + mouseY);
}


