
float counter=0;
float amplitude=0;

void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
  colorMode(HSB, 360, 100, 100);
  float farbe = map(sin (counter), -1, 1, 243, 171);
  
 amplitude=mouseX/5;
  fill  ( farbe,243, 171);
  ellipse((millis()/10), -cos(counter)*amplitude,100,100);
   translate (0, height/4);
  ellipse((millis()/10), -cos(counter)*amplitude,100,100);//x, y
  translate(0,((height/4)));
  ellipse((millis()/10), -cos(counter)*amplitude,100,100);
  translate(0,(height/4 ));
  ellipse((millis()/10), -cos(counter)*amplitude,100,100);
   translate(0,(height/4 ));
  ellipse((millis()/10), -cos(counter)*amplitude,100,100);
  println(sin(counter));
 
  counter+=0.10;
}


