
float cont2;

void setup()
{
  size(600,600);
  background(0);
}

void draw()
{
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  translate(width/2,height/2);
  for (int i =0; i<8; i++)
  {
    for (float cont=0; cont<PI; cont = cont + PI/60)
    {
      fill(255-30*PI*cont,0,0,40);
     ellipse(
         mouseX/8.0*sin(cont2-6*cont),
         cont*height/PI,
         20+cont*30,20+cont*30);
         
      fill(255);
      ellipse(
         mouseX/8.0*sin(cont2-6*cont),
         cont*height/PI,
         4+cont*6,4+cont*6);
    }
     cont2 = cont2 + PI/240;
     rotate(TWO_PI/8);
  }  
}

