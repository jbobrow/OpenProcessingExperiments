
float g = -10;
float gSpeed = 0.1f;
float radius=0;
PShape a;
PImage hg;
boolean recordPDF = false;

import processing.pdf.*;

void setup (){
size (800, 800);
a = loadShape("b.svg");
smooth();
hg = loadImage("hg.png");
  background(hg);
}

 
void draw(){ 
float d = dist(pmouseX, pmouseY, mouseX, mouseY); 
  if (mousePressed == true){
    radius = radius + g;
    translate(mouseX, mouseY);
    a.rotate (radians(radius));
     shape(a, d*2,d*2,d*2,d*2);
  }
}

public void mousePressed() {
 println("Maus");
  fill(random(80,140),random(100,180),random(20,70));
}

public void keyReleased(){
   println("key pressed");
  

  fill(random(244,0));
 if (key == '1') a = loadShape("b.svg");
 if (key == '2') a = loadShape("m.svg");
}


void keyPressed() {
    
  println("key pressed:" + key);
  if (key == 's') saveFrame("bee-####.png");
  
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF,  "bee-####.pdf");
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
 







