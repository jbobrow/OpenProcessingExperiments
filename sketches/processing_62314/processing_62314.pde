
float g = 0;
float gSpeed = 0.8;
PShape a;
import processing.pdf.*;
  
boolean recordPDF = false;
 
 
void setup() {
  size(1000, 300);
  background(255,200,0,0);
  smooth();
  //frameRate(10);
}
float Mspeed;
  
void draw() {
  Mspeed=abs(mouseX-pmouseX);
  println(Mspeed);
  noStroke();
  float taille_ellipse=Mspeed;
 // color ellipse_color = color(random(0,255), random(0,255), random(0,255));
  color ellipse_color = color(150+random(0,100), random(0,21), random(0,21));
   // color ellipse_color = color(150+Mspeed*10, Mspeed*20, Mspeed*10 );
  fill(ellipse_color);
  ellipse(mouseX+random(-20,220),mouseY+random(-20,220), taille_ellipse,taille_ellipse);
  if (mousePressed == true) {
    strokeWeight(0.1+Mspeed/20);
    stroke(0, 50);
    strokeWeight(0.1+Mspeed/20);
 
    stroke(0);
    strokeWeight(0.5+Mspeed/20);
    //line(pmouseX, pmouseY, mouseX, mouseY);
  }
   
 
  if (key =='s') {
  println("Taste gedrückt:" + key);
  if (key == 's') saveFrame("postertool-####.png");
  
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF,  "poster-####.pdf");
      println("recording started");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(255);
    }
  }
}
}

