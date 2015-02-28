
size(400,400);
noStroke();
fill(240,128,128);
rect(0,0,200,200);

noStroke();
fill(190,190,190);
rect(200,0,200,200);

noStroke();
fill(0);
rect(0,200,200,200);
noStroke();
fill(255);
rect(200,200,200,200);

float r = random(250);
float s = random(100,400);
     
for (int i = 20; i <= 400; i += 30)
{
  for (int j = 20; j <=400; j +=60)
  {   
    stroke(221,160,221);
    line(i,r,s,j);
    stroke(147,112,219);
    line(r,i,j,s);
  }
}

