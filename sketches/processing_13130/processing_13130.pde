
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
      fill (138,0,132);
    ellipseMode (CENTER);
    ellipse (mouseX, mouseY+20, 10, 10);
      fill (48,97,122);
    ellipseMode (CENTER);
    ellipse (mouseX, mouseY+50, 10, 10);
      fill (98,120,242);
    ellipseMode (CENTER);
    ellipse (mouseX, mouseY+80, 5, 5);
      fill (178,31,114);
    ellipseMode (CENTER);
    ellipse (mouseX, mouseY-20, 10, 10);
      fill (0,234,250);
    ellipseMode (CENTER);
    ellipse (mouseX, mouseY-50, 10, 10);
      fill (67,139,132);
    ellipseMode (CENTER);
    ellipse (mouseX, mouseY-80, 5, 5);
      fill (245,230,90);
    ellipseMode (CENTER);
    ellipse (mouseX+20, mouseY, 10, 10);
      fill (45,80,234);
    ellipseMode (CENTER);
    ellipse (mouseX+50, mouseY, 10, 10);
      fill (23,45,98);
    ellipseMode (CENTER);
    ellipse (mouseX+80, mouseY, 5, 5);
      fill (138,230,165);
    ellipseMode (CENTER);
    ellipse (mouseX-20, mouseY, 10, 10);
      fill (90,20,243);
    ellipseMode (CENTER);
    ellipse (mouseX-50, mouseY, 10, 10);
      fill (65,30,21);
    ellipseMode (CENTER);
    ellipse (mouseX-80, mouseY, 5, 5);
  }


