
import processing.pdf.*;

void setup(){
  size(283,567);
  beginRecord(PDF, "FIVE.pdf");

size(283,567);
background(0);
noStroke();
smooth();
stroke(116,902,245,100);
strokeWeight(5);
for(int x =10;x<1050;x+=150)
for(int y=0;y<1050;y+=150)
line(40,x,y,40);

endRecord();
exit();
}


