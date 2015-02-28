
PImage fakeImage;
PImage mainImage;
float clock = 0;
 
void setup()
{
  size( 600, 500);
  mainImage = requestImage("justin.jpg");
  fakeImage = requestImage("rank.jpg");
 
}
 
void draw()
{
 
  if(mainImage.width > 0)
  {
    mainImage.filter(GRAY);


  }
  image(mainImage,300,0,width/2,height);
  image(fakeImage,0,0,width/2,height);
  
  float x = 0;
  float y = 0;
  float prevX = x;
  float prevY = y;
   
  while( x < 500)
  {
    noFill();
    stroke(255);
    ellipse(300,height/2,300,300);
    ellipse(300,height/2,5,5);
    x+=300;
    y+=400;
    clock = clock + .009;
    float noises = noise(clock) * width;
    line(300, height/2, noises, 200);
    line(300, height/2, 200, noises);


  }
}


