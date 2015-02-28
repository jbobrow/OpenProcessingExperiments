
int zahl = 0;
String mytype = "leaves";
boolean myrecord = false;
import processing.pdf.*;

PShape s,c,t;

void setup(){
  
  size(450,450);
  background(255);
  smooth();
  frameRate(25);
  t = loadShape("the-tree.svg");
  c = loadShape("the-cherry.svg");
  s = loadShape("the-wobble.svg");
  s.disableStyle();
  strokeWeight(0.5);
  
  shape(t, -30, -20, 500, 500);
  
}
void draw(){
  
  if(mousePressed)
  {
      if(mytype=="leaves"){
        translate(mouseX,mouseY);              // Verschiebe Koordinatensystem (Nullpunkt) auf Mausposition
        rotate(radians(zahl=round(random(360))));
        fill(116, 179, 66,140+random(70));
        stroke(100, 160, 50,140+random(70));
        int w = 5+round(random(50));
        shape(s, 0, 0, w, w);
      }
  }
}
void mousePressed(){
  
  if(mytype=="cherry"){
    int w = 20+round(random(20));
    shape(c, mouseX-(w/2),mouseY-(w/2), w, w);
  }
}

void keyPressed(){
 
  if (key == ' '){
    background(255);
  }
  if (key == 'c' || key == 'C'){
    mytype = "cherry";
    println("Spread some cherries!");
  }
  if (key == 'l' || key == 'L'){
    mytype = "leaves";
    println("Let the tree grow!");
  }
    
  if (key =='p' || key =='P') {
    if (!myrecord) {
      beginRecord(PDF,  "jungwirth-tree.pdf");
      background(255);
      shape(t, -30, -20, 500, 500);
      println("Record Start");
      myrecord = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (myrecord) {
      println("Record End. File saved.");
      endRecord();
      myrecord = false;
    }
  }
}


