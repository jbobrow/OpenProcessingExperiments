
PImage[] images = new PImage[5];
PImage img = new PImage();
float x;
float y;
int r;
 
void setup()
{
  size(640,480);
  for (int i = 0; i < images.length; i ++)
   {
    images[i] = loadImage( i +".jpg");
   }
   
   images[0] = loadImage('http://images.askmen.com/fine_living/keywords/vacation_965867.jpg');
   images[1] = loadImage('http://brokernews.purchasingpower.com/wp-content/uploads/2014/01/vacation.jpg');
   images[2] = loadImage('http://dvpdvp1.com/GRANTS/images/vacation1.jpg');
   images[3] = loadImage('http://www.blogging4jobs.com/wp-content/uploads/2013/05/vacation-with-your-pet-1.jpg');
   images[4] = loadImage('http://blogs-images.forbes.com/susanadams/files/2012/09/Vacation.jpeg');
   
   for(int i=0; i  < images.length; i ++)
   {
   images[i].resize(640,480);
   }
   background(images[0]);
}
void draw()
{
  if(keyPressed)
  {
    for(int count = 0;count<20;count ++)
    {
      if (key == 'a' || key == 'A')
      r=int(random(5));
      image(images[r],0,0);
    }
  }
}
