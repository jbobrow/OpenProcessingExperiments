
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

import processing.pdf.*;

void setup () {
size(1024, 768);
smooth();
colorMode(HSB, 100);
}


void draw () {

println(mousePressed);

if (mousePressed) {

  float abstand = dist(pmouseX,pmouseY,mouseX,mouseY);

  line(pmouseX,pmouseY,mouseX,mouseY); 
  
  float dicke = 20-abstand;
  if (dicke <1) {dicke = 1;}
  
  strokeWeight(abstand);
  
}
}


void mousePressed() {
  println("mouse pressed");
  colorMode(HSB, 100);
  stroke(random(50,60),60,100);  
}


void keyPressed() {

  if (key == 's') { saveFrame("Screenshot-####.png"); }
  
  if (key == 'p') { beginRecord(PDF, "zeichnung.pdf");

    background(0,0,100);
    colorMode(HSB, 100);
    
  }
  
  if (key == 'e') { endRecord (); }

}



