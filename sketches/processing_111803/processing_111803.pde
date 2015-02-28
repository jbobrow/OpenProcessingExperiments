
PImage carlea;
PImage fries;
boolean alreadyInverted = false;

void setup()
{
  size(500, 500);
  carlea = loadImage("carlea.jpg");
  fries = loadImage("IMG_0786.JPG");
  background(carlea);
  tint(255,50);
  image(fries,0,0);
}

void draw()
{
  if (carlea.width > 0)
  {
    if(!alreadyInverted)
    carlea.filter(INVERT);
    alreadyInverted = true;
    image(carlea,0,0,width,height);
  }
  if (fries.width > 0)
  {
    //fries.filter(BLUR, 20); 
    //I noticed it takes longer to load, so I decided not to go with it.
    image(fries,0,0,width,height);
  }
  for (int a = 10; a < 500; a = a+30)
  {
   stroke(#34CECA);
   strokeWeight(4);
   line(30,a,80,a);
  }
  for (int a = 10; a < 500; a = a+30)
  {
   stroke(#34CECA);
   strokeWeight(4);
   line(460,a,480,a);
  }
   for (int a = 280; a < 500; a = a+30)
  {
   stroke(#34CECA);
   strokeWeight(4);
   line(120,a,160,a);
  }
   for (int a = 400; a < 500; a = a+30)
  {
   stroke(#34CECA);
   strokeWeight(4);
   line(200,a,230,a);
  }
  {
float v=0.0;
float inc=0.1;
noStroke();
fill(#A9E399);
noiseSeed(0);
  for(int i=0; i<width; i=i+5)
  {
    float n=noise(v)*100.0;
    rect(i,-15+n,3,20);
    v=v + 50;
    //v = v +inc;
    //I thought changing the value to 50 instead of inc looked cooler,
    //especially with the chaos and order theme of this project.
  }
  }
   {
float v=0.0;
float inc=0.1;
noStroke();
fill(#F7CAFA);
noiseSeed(0);
  for(int i=0; i<245; i=i+5)
  {
    float n=noise(v)*100.0;
    rect(i,400+n,3,20);
    v=v + 50;
  }
  }
}


