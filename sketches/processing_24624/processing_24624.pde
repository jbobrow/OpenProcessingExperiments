
import processing.pdf.*;
float angle = 0;

void setup() {
  size(400,400);
  smooth();
  colorMode(HSB,100);
}



void draw () {
  
  angle += 0.1;
  // ellipse(random(width),random(height),10,10);
  
 // println(mousePressed);
    if(mousePressed){
   /*   float d= dist(pmouseX, pmouseY, mouseX, mouseY);
      fill(d*5);
     // ellipse(mouseX,mouseY,d,d);
      
      float dicke = 20-d;
      
      if (dicke < 1) { dicke = 1; }
      strokeWeight(dicke);
      line(pmouseX, pmouseY, mouseX, mouseY);  */
      
    //  line(mouseX, mouseY, mouseX + 100, mouseY + 100);
      translate(mouseX,mouseY);
      rotate(angle);
      line(0,0,100,30);
  
    }

  /*
  float d= dist(pmouseX, pmouseY, mouseX, mouseY);
  fill(d*5);
//  line(pmouseX, pmouseY, mouseX, mouseY);
  ellipse(mouseX,mouseY,d,d);
  */

}
 
void mousePressed() {
 //  println("mouse pressed");
   colorMode(HSB, 100);
   stroke(random(60,100),60,50); 


}

void keyPressed(){
  if(key == 's') { saveFrame("Screenshot-####.tif");}
  if(key == 'p') { 
    beginRecord(PDF, "zeichnung.pdf");
    background(0,0,100);
    colorMode(HSB,100);
  }
  if(key == 'e') {endRecord(); }  

}    
  
  




