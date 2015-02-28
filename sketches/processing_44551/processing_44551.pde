
PImage myImage;//define image
float easing=0.1;
float easeX=0.1;
//float rsz = 0;
//float rColor = 0;
//float randC = 0;

 
void setup()
{
  myImage=loadImage("sleep.jpg");//loadimg
  size(800, 600);
  smooth();
  ellipseMode(CENTER);
  noStroke();
  colorMode(RGB);
}
 
void draw()
{
 image(myImage,0,0);
  translate(2*width/3.25, height/2.75);
  // decrease scale with mouseX
  //scale(1/map(mouseX,0,width,1,2));
  easeX += (mouseX*10 - easeX)*easing;
  float rsz = map(easeX, 0,width/2, 0, 36);
  rectField(easeX);
  println(rsz);
}
 
void rectField(float easeX)
{
  for (int i=0; i<20; i++)//control spiral point
  {
    translate(10+i, 10+i);
    for (float f=0; f<300; f++)
    {
 
      float x = easeX*cos(radians(f));
      float y = easeX*sin(radians(f));
 
      translate(f, f);
      fill(random(x-100,x), 200, 200);
      rotate(radians(easeX*f/400));
      color(255,0,0,50);//control colour
      rect(0, 0, 2,2);/// s0ze of ellipses/circles
      println(mouseX);
    }
  }
}


