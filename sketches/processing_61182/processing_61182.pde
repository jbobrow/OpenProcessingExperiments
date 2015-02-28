
PImage bild;
boolean recordPDF = false;
int drawMode = 1;


void setup() {
  size (800, 533);
  smooth();
  noCursor();
  bild = loadImage("pic.png");
 noStroke();
}


void draw() {
  background (0);
  //image(bild,0,0);
  // bild.pixels[0];
 
switch(drawMode) {
  

case 1:
    noStroke();
    for ( int x = 0; x <= width; x+=10) {
      for (int y=0; y <= height; y+=10) {
        float durchmesser = mouseX/10;
  
        if (durchmesser > 0) {
          fill(bild.pixels[(x + bild.width*y)]);     
          rect(x, y, durchmesser/10, durchmesser/10);

        }
      }
    }
    break;
 
  
  case 2:
    noStroke();
    for ( int x=0; x <= width; x+=10) {
      for (int y=0; y <= height; y+=10) {   
 float winkel= atan2(mouseY -y,mouseX -x);
      float durchmesser= mouseX/30;
      
     
     
     
      if(durchmesser > 0) {
        pushMatrix();
        translate(x,y);
        rotate(winkel);
        strokeWeight(durchmesser/10);
        float a = atan2(mouseY-height/30, mouseX-width/30);
          rotate(a/10);
      fill(bild.pixels[(x+ bild.width*y)]);
      triangle(0, 0, durchmesser*2, durchmesser,3,10);
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




