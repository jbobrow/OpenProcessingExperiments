
size(800,800);
background(0);
smooth();
noFill();
  
//dark green pattern
translate(width/2,height/2);
stroke(103, 222, 110);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*3.5)*sin(i/0.4),(i*3.5)*cos(i/0.4));
}
endShape();

//green pattern  
stroke(42, 175, 50);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*3)*sin(i/0.4),(i*3)*cos(i/0.4));
}
endShape();

//yellow pattern
stroke(245, 226, 57);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*2.5)*sin(i/0.4),(i*2.5)*cos(i/0.4));
}
endShape();

//dark blue pattern
stroke(68, 57, 245);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*2)*sin(i/0.4),(i*2)*cos(i/0.4));
}
endShape();

//pink pattern
stroke(245, 89, 180);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i*1.5)*sin(i/0.4),(i*1.5)*cos(i/0.4));
}
endShape();

//blue pattern
stroke(26, 179, 183);
beginShape();
for(int i=0;i<435;i++)
{
  curveVertex((i)*sin(i/0.4),(i)*cos(i/0.4));
}
endShape();
