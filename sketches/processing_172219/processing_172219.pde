
float zaehler = 0;

void setup ()
{
  size (500,500);
    colorMode (HSB,360,100,100);
  background (254,0,31);
  
}

void draw ()
{
  background (254,0,31);
  
 float zaehler_maus = map(mouseX,0,width,0.0000001,0.2);
  float intens = map(sin(zaehler),-1,1,0,50);

  noStroke();
  fill(62,42,20+intens);
  triangle(100,300,200,300,150,200);
  fill (41,78,20+intens);
  triangle(150,200,250,200,200,300);
  fill (345,82,20+intens);
triangle (250,200,200,300,300,300);
fill (267,88,20+intens);
triangle (250,200,300,300,350,200);
fill (254,87,20+intens);
triangle (350,200,300,300,400,300);
//zaehler += 0.02;
zaehler += zaehler_maus;

}

