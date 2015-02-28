
import processing.pdf.*;

void setup () {
  size (567,283); //width and height
 // beginRecord(PDF, "test.pdf");
  background (0); //background colour
  stroke(119,250,222,63);//colour of line
  strokeWeight(5);//thickness of line
  noFill();

  int count = 0;
  int amount = 10;
 
  
  int onex1 = 0;
  int oney1 = 0;
  int onex2 = width;
  int oney2 = height;
 
 int twox1 = width;
  int twoy1 = 0;
  int twox2 = 0;
  int twoy2 = height;
 
 int threex1 = 0;
  int threey1 = height;
  int threex2 = width;
  int threey2 = 0;
  
  int fourx1 = width;
  int foury1 = height;
  int fourx2 = 0;
  int foury2 = 0;
 
  while (count < width ) {
    line(onex1,oney1,onex2,oney2);
    line(twox1,twoy1,twox2,twoy2);
    line(threex1,threey1,threex2,threey2);
    line(fourx1,foury1,fourx2,foury2);
    smooth();
 // rotate(rotatE);
    
  
count++; 
onex2 = onex2-amount;
twox2 = twox2+amount;
threex2 = threex2-amount;
fourx2 = fourx2 + amount;

  }
//endRecord();

}
void draw() {
}


void keyPressed() {
  if (key == 's' || key == 'S') {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if (filePath != null) {
      save(filePath + ".png");
    }
  }
}


