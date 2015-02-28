
import processing.pdf.*;

void setup() {
  size(400,400,PDF, "filename.pdf");
}

void draw(){
  line(0,0,frameCount*4,height);
  
  PGraphicsPDF pdf = (PGraphicsPDF) g;
  
  pdf.nextPage();
  
  if (frameCount==100){
    exit();
  }
}
