
import processing.pdf.*;

void setup(){
  size(283,567);
  beginRecord(PDF, "SIX.pdf");

size(283,567);
background(0);
noStroke();
smooth();
stroke(116,902,245,100);
strokeWeight(7);
for(int x =10;x<1200;x+=200)
for(int y=40;y<1200;y+=200)
line(80,x,y,80);

endRecord();
exit();
}


