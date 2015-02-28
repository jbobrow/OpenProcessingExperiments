
import processing.pdf.*;

void setup(){
  size(283,567);
  beginRecord(PDF, "EIGHT.pdf");

size(283,567);
background(0);
noStroke();
smooth();
stroke(116,902,245,100);
strokeWeight(7);
for(int x =70;x<1500;x+=350)
for(int y=40;y<1500;y+=350)
line(150,x,y,150);

endRecord();
exit();
}


