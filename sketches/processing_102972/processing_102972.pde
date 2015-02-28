
star[][] stars;
int starCount = 12; // starCount^2 = amount of stars on screen
int mainSize = 3; //max_size of a single star
int speed = 120; //speed of the movement

  
void setup()  {
 size(800,450);
 frameRate(60);
 noSmooth();
 stars = new star[starCount][starCount];
   
 for(int i=0;i<starCount;i++)  {
   for(int o=0;o<starCount;o++)  {
    stars[i][o] = new star(random(width), random(height), random(speed/4,speed), random(mainSize/4,mainSize));
   }
 }
}
  
void draw()  {
  background(0);
    
  for(int i=0;i<starCount;i++)  {
   for(int o=0;o<starCount;o++)  {
    stars[i][o].move();
    stars[i][o].render();
   } 
  } 
}
  
class star  {
  star(int _x, int _y, int _speed, int _size)  {
    x=_x; y=_y; speed = _speed; size=_size; sizeOrig = _size; xOrig = x; yOrig = y; speedOrig = _speed;
  }
  
  int x; int y;
    
  int size;
  int speed;
  
  int sizeOrig;
  int speedOrig;
  int xOrig;
  int yOrig;

 
  
  void move() {
    int deltax = x - width / 2;
    int deltay = y - height / 2;
    
    x = x + deltax/speed;
    y = y + deltay/speed;
    
    size = size+size/(speed*4);
    
    if (x < 0 || x > width) { 
      x = random(width); //width/2-random(width/spread)+random(width/spread)
      size = sizeOrig;
    } 
    if (y < 0 || y > height) { 
      y = random(height); //height/2-random(height/spread)+random(height/spread)
      size = sizeOrig;
    } 
  }
  
  void render()  {
    noStroke();
    fill(255);
    ellipse(x,y,size,size);
  }
}
