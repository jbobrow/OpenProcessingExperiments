

float mov= 0.0;
int cl=0;

void setup()
{
  size(900, 900);
  
  smooth();
  background(0);

  noFill();
 //noLoop();
  
}

void draw()
{
  
frameRate(45);

//boca pacman
background(0);
fill(255,255,0);
arc(200+cl, 200, 300, 300, QUARTER_PI-mov, TWO_PI-QUARTER_PI+mov);
stroke(0);
if(QUARTER_PI-mov <=0)
{
  mov=0.0;
}
mov+= 0.03;
cl+=1;

//ojo pacman
fill(0);
arc(130+cl, 130, 50, 50, PI/4, 7/6*PI);

}

