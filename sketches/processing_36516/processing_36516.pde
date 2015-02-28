
void setup()
{
for (int i = 0; i < width; i++)
{
if (i % 2 == 0)
{
stroke(255,0,0);
line(i,0,i,height);
}
else
{
stroke(0,0,255);
line(i,0,i,height);
}
}
}

                
                
