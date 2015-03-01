
size(200,400);
background(255,236,139);
fill(255,239,213);stroke(255,239,213);ellipse(100,0,350,780);
noFill();
for(int i=0; i<430; i=i+10)
{
  if(i<210)
  {
    stroke(225,69,0);strokeWeight(2);ellipse(0,90,i,i);
  }

   else
   {
     stroke(205,133,63);ellipse(200,110,i-220,i-220);
   }
    
   if(i<40)
   ellipse(100,300,i,i);
}
   for(int i=0;i<255;i=i+5)
   {
     stroke(139,115,85);line(10+0.7*i,240,20+0.7*i,270);
   }

noStroke();fill(255,165,79);triangle(100,160,90,230,110,220);

