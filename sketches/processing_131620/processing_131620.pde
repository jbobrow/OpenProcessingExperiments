
size(400,400);
background(137,104,205);

float r = random(200);
float s = random(200,400);
    
for (int i = 10; i <= 400; i += 50)
{
  for (int j = 10; j <=400; j +=50)
  {    
    stroke(104,34,139);
    line(i,r,s,j);
    stroke(171,130,255);
    line(r,i,j,s);
  }
}

