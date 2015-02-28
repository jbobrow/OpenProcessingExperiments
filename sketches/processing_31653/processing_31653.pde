
import processing.pdf.*;

void setup(){
  size(500,500);
  beginRecord(PDF, "EIGHT.pdf");

size(500,500);
background(0);
noStroke();
smooth();
stroke(116,902,245,100);
strokeWeight(4);
for(int x =0;x<800;x+=70)
for(int y=0;y<800;y+=80)
line(70,x,y,100);

endRecord();
exit();
}

