
size(400,600);

for (float a=800; a>200; a=a-5)
{
  strokeWeight (a*23);
  ellipse(200,200,1000000%a,a);
}
for(float a=800; a<5; a=a-80)
{
  strokeWeight (a*6000);
  ellipse(400,200,a,80%a);
}
                
                
