
import processing.pdf.*;

void setup(){
  size(283,567);
  beginRecord(PDF, "TWO.pdf");

size(283,567);
background(0);
noStroke();
smooth();
stroke(116,902,245,100);
strokeWeight(5);
for(int x =0;x<1050;x+=100)
for(int y=0;y<1050;y+=100)
line(0,x,y,0);

endRecord();
exit();
}


