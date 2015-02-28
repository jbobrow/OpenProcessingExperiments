
import processing.pdf.*;

size(900, 900, PDF, "mishqPattern.pdf");
background(255);
smooth();
noFill();
  
//outmost green pattern
translate(width/2,height/2);
stroke(58, 222, 1);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*3.5)*sin(i/0.4),(i*3.5)*cos(i/0.4));
}
endShape();

//green pattern  
stroke(58, 222, 105);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*3)*sin(i/0.4),(i*3)*cos(i/0.4));
}
endShape();

//light green pattern
stroke(58, 222, 135);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*2.5)*sin(i/0.4),(i*2.5)*cos(i/0.4));
}
endShape();

//light blue pattern
stroke(58, 222, 165);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*2)*sin(i/0.4),(i*2)*cos(i/0.4));
}
endShape();

//blue pattern
stroke(58, 222, 195);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*1.5)*sin(i/0.4),(i*1.5)*cos(i/0.4));
}
endShape();

//inner most blue pattern
stroke(26, 179, 225);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i)*sin(i/0.4),(i)*cos(i/0.4));
}
endShape();

exit();
