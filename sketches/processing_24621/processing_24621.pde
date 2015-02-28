
import processing.pdf.*;
float angle = 0;


void setup(){
 size(800,800);
smooth(); 
colorMode(HSB, 100);
}


void draw(){
  
  angle += 0.1; //bei jedem durchlauf von draw wird der winkel erhöht
  
  if (mousePressed == true) {
  
  float speed = dist(mouseX,mouseY,mouseX,mouseY);
  
  //line(pmouseX,pmouseY,mouseX +100,mouseY); gleiches wie unten:
  translate(mouseX,mouseY);
  rotate(angle);
  line(0,0,random(100),0);
  }
 
}

void mousePressed(){
  
  stroke(random(50,60),random(60,100),80);
  //stroke(0,random(255),random(255)); -> wenn ichs nicht HSB sondern RGB hab
}

void keyPressed(){
  if (key == 's'){ saveFrame("bild.png");} //muss bild.png nicht hinschreiben, nur wenn i will ;)
  
  if (key == 'p') { 
    beginRecord(PDF, "zeichnung.pdf");
    colorMode(HSB, 100);
    background(0,0,100);
  }
  if (key == 'e'){
    endRecord();
  }
  
}

