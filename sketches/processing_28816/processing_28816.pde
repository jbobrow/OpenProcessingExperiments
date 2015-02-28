
import processing.pdf.*;
void setup(){
  size(1000,1000);
  smooth();
  background(0);
}

void draw(){
  if(mousePressed) {
    float abstand= dist(pmouseX,pmouseY, mouseX,mouseY); 
    fill(abstand*4);
    float dicke = 40-abstand/4;
    
    if (dicke < 1) {
      dicke = 1;
    }
    
    strokeWeight(dicke);
    ellipse(mouseX,mouseY,abstand,abstand);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mousePressed(){
  colorMode(HSB,100);
    stroke(random(100,200), random(0,100), random(1,100));  
    
}
void keyPressed(){
    if(key == 's') {saveFrame("screenshot-####.png");}
    
    if(key =='p') { beginRecord(PDF, "zeichnung"+frameCount+".pdf");
    background(0,0,150);
  }
    if(key =='e') { endRecord();}
    
}


