
size (400,400);
background (202,225,255);
strokeWeight(10);
for(int i = 50; i <= height; i=i+150)
{
  stroke(10);
  stroke(255);
  line(i,150,i, 300);
}

for (int i = 0; i <= height; i=i+20) 
{
  if (i<=20)
  {
  stroke(171,130,255);
  fill(171,130,255);
  ellipse(50,150,i,i);
  }
  else if(i<=40)
  {
  noFill();
  stroke(0,197,205);
  ellipse(50,150,i,i);
  }
  else if(i<=60)
  {
  noFill();
  stroke(255,193,37);
  ellipse(50,150,i,i);
  }
  else if(i<=80)
  {
  noFill();
  stroke(255,69,0);
  ellipse(50,150,i,i);
  }
}

for (int i = 0; i <= height; i=i+20) 
{
  if (i<=20)
  {
  stroke(171,130,255);
  fill(171,130,255);
  ellipse(200,150,i,i);
  }
  else if(i<=40)
  {
  noFill();
  stroke(0,197,205);
  ellipse(200,150,i,i);
  }
  else if(i<=60)
  {
  noFill();
  stroke(255,193,37);
  ellipse(200,150,i,i);
  }
}

for (int i = 0; i <= height; i=i+20) 
{
  if (i<=20)
  {
  stroke(171,130,255);
  fill(171,130,255);
  ellipse(350,150,i,i);
  }
  else if(i<=40)
  {
  noFill();
  stroke(0,197,205);
  ellipse(350,150,i,i);
  }
}

