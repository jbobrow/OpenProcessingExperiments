
//sunset
int sunSize = 150;
float x = 0;
float y = 0;
float angle = 0;
Star[] stars = new Star[50];
int starAmount = 0;


void setup()
{
 size(1000, 500);
 smooth();

 for(int i = 0; i < 50; i++)
 {
   stars[i] = new Star();
 }

}


void draw()
{

 y = sin(angle) * height - sunSize;


 float bgColor = map(y, 0, height, 0, 255);

 background(bgColor);
 noStroke();
 fill(241,150,32);
 ellipse(x,height - y,sunSize,sunSize);

 x += 1;
 angle += 0.0028;

 if(bgColor < 100)
 {
  int a = int(map(bgColor, 0, 100, 255, 0));

  for(int i = 0; i < stars.length; i++)
  {
    stars[i].draw(a);
  }
 }

}

