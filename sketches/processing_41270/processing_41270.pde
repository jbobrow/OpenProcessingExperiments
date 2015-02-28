
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

  for(int i = 10; i <= 800; i += 20) {
    beginShape();
    vertex(x+8-i, y-16.5+i);
    bezierVertex(x+39-i, y-58+i, x+54-i, y-75+i, x+44-i, y-64+i);
    bezierVertex(x+58-i, y-79+i, x+79.5-i, y-74+i, x+67-i, y-74+i);
    bezierVertex(x+83-i, y-79+i, x+92-i, y-56.5+i, x+90-i, y-59+i);
    bezierVertex(x+93-i, y-53+i, x+93-i, y-49+i, x+93-i, y-49+i);
    bezierVertex(x+93-i, y+51-i, x+93-i, y+70-i, x+93-i, y+51-i);
    bezierVertex(x+88-i, y+73-i, x+80-i, y+74-i, x+76-i, y+74-i);
    bezierVertex(x+65-i, y+74-i, x+50-i, y+66-i, x+59-i, y+72-i);
    bezierVertex(x+31-i, y+50-i, x-11+i, y+11+i, x+12-i, y+32-i);
    bezierVertex(x-27+i, y-3+i, x-32+i, y-8+i, x-29+i, y-5+i);
    bezierVertex(x-45+i, y-19+i, x-54+i, y-27+i, x-49+i, y-23+i);
    bezierVertex(x-57+i, y-27+i, x-57+i, y-17+i, x-57+i, y-17+i);
    bezierVertex(x-57+i, y+50-i, x-57+i, y+50-i, x-57+i, y+50-i);
    bezierVertex(x-57+i, y+50-i, x-56+i, y+59-i, x-57+i, y+50-i);
    bezierVertex(x-52+i, y+60-i, x-49+i, y+56-i, x-45+i, y+52-i);
    vertex(x-13+i, y+12-i);
    vertex(x-8+i, y+16-i);
    bezierVertex(x-39+i, y+58-i, x-49+i, y+70-i, x-44+i, y+64-i);
    bezierVertex(x-55+i, y+80-i, x-80+i, y+74-i, x-67+i, y+74-i);
    bezierVertex(x-88+i, y+76-i, x-92+i, y+56-i, x-90+i, y+64-i);
    bezierVertex(x-93+i, y+64-i, x-93+i, y+50-i, x-93+i, y+50-i);
    bezierVertex(x-93+i, y-50+i, x-93+i, y-63+i, x-93+i, y-50+i);
    bezierVertex(x-95+i, y-73-i, x-72+i, y-75+i, x-76+i, y-74+i);
    bezierVertex(x-66.5+i, y-74+i, x-60+i, y-71+i, x-50+i, y-67+i);
    bezierVertex(x-32+i, y-50+i, x-12+i, y-33+i, x+11-i, y-11+i);
    bezierVertex(x+26-i, y+4-i, x+28-i, y+5-i, x+31-i, y+8-i);
    bezierVertex(x+44-i, y+19-i, x+53-i, y+26-i, x+50-i, y+22.5-i);
    bezierVertex(x+57-i, y+23-i, x+57-i, y+17-i, x+57-i, y+17-i);
    bezierVertex(x+57-i, y-50+i, x+56-i, y-50+i, x+57-i, y-50+i);
    bezierVertex(x+57-i, y-50+i, x+56.7-i, y-51+i, x+56-i, y-57+i);
    bezierVertex(x+52-i, y-61+i, x+44-i, y-53+i, x+48-i, y-57+i);
    vertex(x+13-i, y-12+i);
    endShape(CLOSE);
  }
  //frameRate(1);
  //println(mouseX + " : " + mouseY);
}


