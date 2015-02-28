
 // Zach Higgins - period 4 engineering - 4.9.14
// up,down,click, up down makes it smile and frown.
// click makes him shoot a lazer
//click right for a "pleasant" surprise!
void setup()
{size(800,800);
background(#000000);}

void draw()
{ 
  fill(0,0,0);
 rect(0,0,800,800);
  noStroke();
 //body
  fill(225,0,0);
  ellipse(400,400,400,400);
  //eyes
  fill(#ffffff);
ellipse(320,300,80,80);
ellipse(480,300,80,80);
pushMatrix();
//pupils
fill(#000000);
ellipse(310,310,50,50);
ellipse(470,310,50,50);
popMatrix();
//mouth
ellipse(400,480,250,150);
 //evil dewd
fill(0,225,0);
ellipse(680,730,100,100);
fill(#FFFFFF);
ellipse(700,710,20,20);
ellipse(650,710,20,20);
fill(#000000);
ellipse(698,705,10,10);
ellipse(648,705,10,10);
ellipse(680,745,70,40);
fill(0,225,0);
ellipse(680,755,60,20);
if(key==CODED&&keyCode==DOWN)
{
 fill(225,0,0); ellipse(400,540,220,90);
}
 if(key==CODED&&keyCode==LEFT)
  {
   fill(0,0,225);
   ellipse(400,480,40,40);
   triangle(400,480,700,700,650,750);
   ellipse(680,730,75,75); 
 }
 if(key==CODED&&keyCode==UP) {fill(225,0,0);ellipse(400,420,250,120);}
if(key==CODED&&keyCode==RIGHT)
{
  noStroke();
  fill(#FFFFFF);
ellipse(310,310,50,50);
ellipse(470,310,50,50);
}
}

