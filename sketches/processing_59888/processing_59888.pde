
PImage bild;
boolean recordPDF = false;

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  noCursor();
  bild = loadImage("color.jpg");
}

void draw () {
  background(0);


  for ( int x = 0; x <= width; x+=10) {
    for ( int y = 0; y <= height; y+=10) {

       float winkel = atan2(mouseY - y, mouseX - x);
      float durchmesser = mouseX/10;
      
      if (durchmesser > 0) {
        pushMatrix();
        translate(x,y);
        rotate(winkel);
        fill(bild.pixels[x + bild.width*y]);
        triangle(0, 0, durchmesser*3, durchmesser,5,3);
        popMatrix();
      }
    }
  }
}
 
public void mousePressed() {
 println("Mouse");
}
 
public void keyReleased(){
 if (key == '1') bild = loadImage("color.jpg");
 if (key == '2') bild = loadImage("color2.jpg");
}
 
public void keyPressed() {
   
  println("Taste:" + key);
  if (key == 's') saveFrame("line-####.png");
 
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "Geonature-####.pdf");
      println("recording started");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(0);
    }
  }
}





