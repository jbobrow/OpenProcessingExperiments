
PImage bild;
boolean recordPDF = false;
int drawMode = 1;
 
void setup() {
  size(552, 782);
  smooth();
  bild = loadImage("bild1.png");
  noStroke();
  smooth();
}
 
void draw() {
  background(bild);
 
  switch(drawMode) {
 

 
  case 1:
    for ( int x = 0; x <= width; x+=7) {
      for ( int y = 0; y <= height; y+=7) {
        float winkel = atan2(mouseX - x, mouseY - y);
        float durchmesser = mouseX-10;
        if (durchmesser > 0) {
          pushMatrix();
          translate(x, y);
          rotate(winkel);
          fill(bild.pixels[x + bild.width*y]);
          triangle(4*random(2), 0*random(2), 5*random(2), 50, 5, 10);
          popMatrix();
        }
      }
    }
    break;
 

 
  case 2:
    for ( int x=0; x<= width; x+=4) {
      for ( int y=0; y<=height; y+=4) {
        float durchmesser = 20-dist(mouseX, mouseY, x, y)/20;
        durchmesser += dist(width/2, height/2, x, y)/4;
        if (durchmesser > 0) {
          strokeWeight(0.2*random(3));
          stroke (bild.pixels[(x + width)]);
          float a = atan2(mouseY-height/2, mouseX-width/2);
          rotate(a*random(4)/20);
          line(x, y, x+durchmesser+20, y+durchmesser);
        }
      }
    }
    break;
 
  case 3:
   for ( int x = 0; x <= width; x+=5) {
      for ( int y = 0; y <= height; y+=5) {
        float winkel = atan2(mouseX - x, mouseY - y);
        float durchmesser = mouseX-10;
        if (durchmesser > 0) {
          pushMatrix();
          translate(x, y);
          rotate(winkel);
          fill(bild.pixels[x + bild.width*y]);
          triangle(4*random(2)*winkel, 0*random(2), 5*random(2)*winkel, 50*random(4), 5, 10);
          popMatrix();
        }
      }
    }
    break;
 
 
  }
}
 
void keyReleased() {
  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == '3') drawMode = 3;

}
 
public void keyPressed() {
  if (key == 's') saveFrame("img-####.png");
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "img-####.pdf");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      endRecord();
      recordPDF = false;
    }
  }
}



