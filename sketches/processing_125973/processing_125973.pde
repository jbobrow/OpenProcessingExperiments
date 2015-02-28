
import processing.pdf.*;

void setup(){
  size(400,400, PDF, "mipdf.pdf");
}

void draw(){
  
  line (0,0,width/2,height);
  
  println("Por fin terminé");
  exit(); // hacer salirse de draw
  
}
