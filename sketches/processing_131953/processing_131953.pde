
size (400,400);
background (255);
for (int i = 10; i <= 400; i=i+20) 
{
  for (int j = 10; j <= 400; j=j+20) 
    {
      float n = random (100);
      float q = random (100);
      stroke (255,182,193);
      line (j,n,i,q);
    }
}

for (int i = 10; i <= 400; i=i+20) 
{
  for (int j = 10; j <= 400; j=j+20) 
    {
      float n = random (70,200);
      float q = random (70,200);
      stroke (255,174,185);
      line (j,n,i,q);
    }
}

for (int i = 10; i <= 400; i=i+20) 
{
  for (int j = 10; j <= 400; j=j+20) 
    {
      float n = random (170,300);
      float q = random (170,300);
      stroke (238,162,173);
      line (j,n,i,q);
    }
}

for (int i = 10; i <= 400; i=i+20) 
{
  for (int j = 10; j <= 400; j=j+20) 
    {
      float n = random (270,400);
      float q = random (270,400);
      stroke (205,140,149);
      line (j,n,i,q);
    }
}
