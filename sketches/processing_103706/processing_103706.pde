
PImage misha;
void setup()
{
  size(1000, 1000);
  misha = loadImage("tumblr_mkkjyo1gVl1rqc3xqo1_250.png");
  
}

void draw() {  
  //for (int i = 0; i < 100; i++)
  {
   int randR = (int) random(100,255);
   int randG = (int) random(100,255);
   int randB = (int) random(100,255);
   
   int x = (int) random(-200,1000);
   int y = (int) random(-200,1000);
   
   float s = random(0,200);
    // TODO - draw a circle at a random position on the screen with a random size and color
    drawmisha(x, y, s, color(randR, randG, randB));
  } 
}


void drawmisha(float x, float y, float size, color circleColor)
{
  int randR = (int) random(100,255);
   int randG = (int) random(100,255);
   int randB = (int) random(100,255);
  tint(randR, randG, randB);  // Tint blue and set transparency
  image(misha, x, y);
}


