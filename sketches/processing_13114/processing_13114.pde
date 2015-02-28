
PImage skyline;  
 
void setup () {  
  size(600,389);
  skyline = loadImage("SydneySkyline2.jpg");
  background (skyline);
}  
  
void draw () {  
  stroke (0);
  fill (150);
  ellipseMode (CENTER);
  ellipse (mouseX, mouseY, 2, 2);
}
  void mousePressed () {
    stroke (0);
      fill (134,111,177);
    ellipseMode (CENTER);
    ellipse (mouseX+20, mouseY+20, 20, 20);
      fill (90,230,155);
    ellipseMode (CENTER);
    ellipse (mouseX-20, mouseY-20, 20, 20);
      fill (231,236,154);
    ellipseMode (CENTER);
    ellipse (mouseX+40, mouseY+40, 10, 10);
      fill (243,117,76);
    ellipseMode (CENTER);
    ellipse (mouseX-40, mouseY-40, 10, 10);
      fill (54,198,244);
    ellipseMode (CENTER);
    ellipse (mouseX+60, mouseY+60, 5, 5);
      fill (39,57,122);
    ellipseMode (CENTER);
    ellipse (mouseX-60, mouseY-60, 5, 5);
      fill (0,135,72);
    ellipseMode (CENTER);
    ellipse (mouseX+60, mouseY-60, 5, 5);
      fill (240,237,129);
    ellipseMode (CENTER);
    ellipse (mouseX-60, mouseY+60, 5, 5);
      fill (186,32,46);
    ellipseMode (CENTER);
    ellipse (mouseX+40, mouseY-40, 10, 10);
      fill (159,160,208);
    ellipseMode (CENTER);
    ellipse (mouseX-40, mouseY+40, 10, 10);
      fill (0,188,232);
    ellipseMode (CENTER);
    ellipse (mouseX+20, mouseY-20, 20, 20);
      fill (238,54,36);
    ellipseMode (CENTER);
    ellipse (mouseX-20, mouseY+20, 20, 20);
  }


