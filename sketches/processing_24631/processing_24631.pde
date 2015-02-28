
import processing.pdf.*;
float angle = 0;
void setup(){
  size(1000,1000);
  
  smooth();
}

void draw(){
  if(mousePressed) {
    
    angle += 0.1;
     
    float abstand= dist(pmouseX,pmouseY, mouseX,mouseY);
    
    fill(abstand*4);
    
    //ellipse(mouseX,mouseY,abstand,abstand);
   /* float dicke = 40-abstand;
    
    if (dicke < 1) {dicke = 1;}
    
    strokeWeight(dicke);*/
    
   // line(pmouseX, pmouseY, mouseX+100, mouseY);

    translate(mouseX,mouseY);
    rotate(angle);
    line(0,0,100,0);
   
  }
}

void mousePressed(){
  colorMode(HSB,100);
    stroke(random(20,30), random(255), 106);  
    
}
void keyPressed(){
    if(key == 's') {saveFrame("screenshot-####.png");}
    
    if(key =='p') { beginRecord(PDF, "zeichnung"+"frameCount"+".pdf");
    background(0,0,150);
  }
    if(key =='e') { endRecord();}
    
}

