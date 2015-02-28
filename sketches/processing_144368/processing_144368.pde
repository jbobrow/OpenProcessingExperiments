
void setup()
{
  size(500, 500);

  background(0, 0, 100);
}
void draw()
{
 float sand = mouseX/2; //verlauf
 float  w = width /sand;
 float h = height /sand;
 float y = 20;
 if (mousePressed == true)
    {
pushMatrix();
colorMode(HSB, 500, 500, 100);
for (int i = 0; i<sand; i++) 
  {
    for (int a = 0; a <sand; a++)
    {
     float x = a * w;
     y = h*i;
     fill(x,width -y, 100);//width minus da weiÃ�ï¿½ bereich raus
     stroke(x,width-y, 100);//gleiche Farben
     rect(x, y, w, h);
    }
  }
 popMatrix(); 
}
else if (mousePressed == false)
    {
pushMatrix();
colorMode(RGB, 500, 500, 255);
for (int i = 0; i<sand; i++) 
  {
    for (int a = 0; a <sand; a++)
    {
     float x = a * w;
     y = h*i;
     fill(x,width -y, 100);//width minus da weiÃ�ï¿½ bereich raus
     stroke(x,width-y, 100);//gleiche Farben
     ellipse(x, y, w, h);
    }
  }
 popMatrix(); 
    }}

