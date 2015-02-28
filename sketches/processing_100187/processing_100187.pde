
size(500,500);
background(32,178,170);
noFill();
for(int i = 5; i <400; i = i + 20)
{
if(i < 300)
{
 noStroke();
 
fill(255,255,255,25);
ellipse(250,250,i,i);
fill(32,178,170,50);
ellipse(500,0, i,i);

}

if(i>300)
{
  
  fill(0,100,250,100);
  strokeWeight(2);
  line(500,500,i,i);
}


else {
  ellipse(i,i,i,i);
}
}

for (int p = 10; p <700; p = p + 10)
{
  if(p<250)
  {
    stroke(255,255,255,150);
    line(p+5,p+5,p,p);
  }
  if(p>250)
  {
    stroke(255,255,255,150);
    line(500,0,p,p);
    fill(32,178,170,200);
    noStroke();
    ellipse(500,0,p,p);
  }
}
