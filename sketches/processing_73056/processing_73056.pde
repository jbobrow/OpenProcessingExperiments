
int wWidth = 1280;
int wHeight = 720;
int wEdge = -100;

class Sperm
{
  //Attributes
  float speed = 0;
  float direction = 0;
  float x = 0;
  float y = 0;
  int colour = 0;
  
  //Constructor
  public Sperm(float speed, float direction, float x, float y, int colour)
  {
    //Initialise variables
    this.speed = speed;
    this.direction = direction;
    this.x = x;
    this.y = y;
    this.colour = colour;
  }
  
  //Method to tell the sperm to move
  public void move()
 {
   //Calculate movement
   this.x = this.x + this.speed * cos(radians(direction));
   this.y = this.y + this.speed * sin(radians(direction));
   
   //Change direction
   direction += 1;
   
   //Draw
   noStroke();
   colorMode(HSB, List.length);
   fill(this.colour, List.length, List.length, List.length * 0.85);
   ellipse(round(this.x), round(this.y), 3, 3);
 } 
}

Sperm[] List = new Sperm[750];
void setup()
{
  size(1280, 720);
  //size(wWidth, wHeight);
  background(0);
  
  for(int i = 0; i < List.length; i++)
  {
    colorMode(HSB, List.length);
    List[i] = new Sperm(random(1, 1), random(0, 360), random(wEdge, (wWidth - wEdge)), random(wEdge, (wHeight - wEdge)), i);
  }
}

void draw()
{
  colorMode(RGB, 255);
  fill(0, 0, 0, 15);
  rect(0, 0, wWidth, wHeight);
  
  for(int i = 0; i < List.length; i++)
  {
    List[i].move();
  }
}

