
PImage mainImage;
PImage supreme;
PImage Icon;

void setup()
{ 
  size( 600, 400);
  mainImage = requestImage("Field.jpg");
  supreme = requestImage("supreme.png");
  Icon = requestImage("Ceres.png");
  
}

void draw()
{

  if(mainImage.width > 0)
  {
    mainImage.filter(GRAY);
  }
  image(mainImage,0,0,width,height);
  image (supreme, -2,315, 100, 100);
  image(Icon,200,100,200,200);

  float x = 0;
  float y = 0;
  float prevX = x;
  float prevY = y;
  
  while( x < 500)
  {
    stroke(255);
    strokeWeight(2.125);
    x+=300;
    y+=400;
    line(prevX,prevY,x,y);
    prevX = x;
    prevY = y;
    line(prevX,prevY, x+300, 0);
    line(prevX,prevY, x,0);
    line(0,100,300,400); 
    line(600,100,300,400); 
    line(150,0,300,400);
    line(0,200,300,400);
    line(600,200,300,400);
    line(0,300,300,400);
    line(600,300,300,400);
    line(450,0,300,400);
  }
}


