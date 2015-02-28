
// happy coding ~
size(200,200);
 
//background
fill(#00B1FF);
noStroke();
for(int x=1; x<250; x=x+10)
for(int y=-100; y<250; y=y+10)
{
  ellipse(x+4,y,2,9);
}
 
fill(#FF00AA);
noStroke();
for(int x=1; x<250; x=x+10)
for(int y=-100; y<250; y=y+10)
{
  ellipse(x+4,y,5,2);
} 

fill(#000000);
noStroke();
for(int x=1; x<250; x=x+10)
for(int y=-25; y<250; y=y+10)
{
  ellipse(x+4,y,5,2);
} 

//face
stroke(2);
strokeWeight(2.5);
fill(#FFDA00);
ellipse(100,80,170,160);
 
//eye
 strokeWeight(1);
fill(#000000);
ellipse(67,55,35,35);
 
strokeWeight(1);
fill(#FFFFFF);
ellipse(68,47,10,10);

 //eyee
strokeWeight(1);
fill(#000000);
ellipse(133,55,35,35);
 
strokeWeight(1);
fill(#FFFFFF);
ellipse(133,47,10,10);

//eyebrow
strokeWeight(5);
line(78,25,40,40);

//eyebroww
strokeWeight(5);
line(160,40,110,25);

//mouth
strokeWeight(2.5);
fill(250,70,100);
beginShape();
vertex(80,120);
vertex(100,150);
vertex(120,120);
endShape(CLOSE);
 
//die kkae
noStroke();
fill(40);
ellipse(140,100,3,5);
ellipse(47,110,3,5);
ellipse(70,100,3,5);
ellipse(60,110,3,5);
ellipse(55,90,3,5);
ellipse(40,95,3,5);
ellipse(165,100,3,5);
ellipse(150,90,3,5);
ellipse(147,115,3,5);
ellipse(160,110,3,5);

//face2
stroke(1.5);
strokeWeight(1);
fill(#FFDA00);
ellipse(170,170,40,40);
 
//eye
 strokeWeight(0);
fill(#000000);
ellipse(162,165,5,5);
 
strokeWeight(0);
fill(#FFFFFF);
ellipse(163,165,2,2);

 //eyee
strokeWeight(0);
fill(#000000);
ellipse(180,165,5,5);
 
strokeWeight(0);
fill(#FFFFFF);
ellipse(180,165,2,2);

//eyebrow
strokeWeight(2);
line(179,160,185,160);

//eyebroww
strokeWeight(2);
line(160,160,165,160);

//mouth
strokeWeight(1);
fill(250,70,100);
beginShape();
vertex(180,170);
vertex(170,185);
vertex(160,170);
endShape(CLOSE);

