
int wWidth = 600;
int wHeight = 600;
int wEdge = 100;

class Batman
{
  //Attributes
  float counter;
  PImage logo;
  
  //Constructor
  public Batman()
  {
    logo = loadImage("http://www.officialpsds.com/images/thumbs/BATMAN-LOGO-psd6898.png");
  }
  
  //Should the batman be called
  void call()
  {
    if(this.counter < 360)
    {
      counter++;
    } else
    {
      //Call the batman
      image(this.logo, wEdge, wEdge, (wWidth - (wEdge*2)), (wHeight - (wEdge*2)));
      
      //Reset the call
      this.counter = 0;
    }
  }
}

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
   ellipse(round(this.x), round(this.y), 5, 5);
 } 
}

Sperm[] List = new Sperm[5000];
Batman bat = new Batman();
void setup()
{
  smooth();
  
  //size(wWidth, wHeight);
  size(600, 600);
  background(0);
  
  for(int i = 0; i < List.length; i++)
  {
    colorMode(HSB, List.length);
    List[i] = new Sperm(random(1, 6), random(0, 360), random(wEdge, (wWidth - wEdge)), random(wEdge, (wHeight - wEdge)), i);
  }
}

void draw()
{
  colorMode(RGB, 256);
  fill(0, 0, 0, 30);
    noStroke();
  rect(0, 0, wWidth, wHeight);
  
  for(int i = 0; i < List.length; i++)
  {
    List[i].move();
  }
  
  bat.call();
}

