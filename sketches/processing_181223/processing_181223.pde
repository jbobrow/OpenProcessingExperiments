
Mover m;
Mover m2;
 
float[]bgColors = new float[3]; 
color bg;
 
void setup ()
{
  size (600, 200);
  smooth();
  colorMode(RGB);
 
  for (int k = 0; k <=2;)
  {
   bgColors[k] = random(0,255);
   k+=1;  
  }
  bg = color(bgColors[0], bgColors[1], bgColors[2]);
 
  m = new Mover ();
  m2 = new Mover ();
 
  background (bg);
  frameRate (30);
}
 
void draw ()
{
 
  background (bg);
 
  m.move();
  m.checkEdgesAndBounce();
  m.display();
  m.change();
  
  m2.move();
  m2.checkEdgesAndBounce();
  m2.display();
  m2.change();
  
  bgChange();
}
 
 
class Mover
{
  PVector direction;
  PVector location;
 
  float speed;
  float ellipseSize;
  
  color c; 
  color b;
  float[][]colors = new float[3][2];
  
 
  Mover () // Konstruktor = setup der Mover Klasse
  {
   
   for (int j = 0; j <= 1;){
   for (int i = 0; i <= 2;){
     colors[i][j] = random(0,255);
     i += 1;
   }
   j+=1; 
  }
    c = color(colors[0][0], colors[1][0], colors[2][0]); 
    //b = color(colors[0][1], colors[1][1], colors[2][1]);
    location = new PVector (random (width), random (height));
    //ellipseSize = random (4, 15);
    ellipseSize = 15;
    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));
 
    speed = random (1, 5);
  }
 
  // MOVE -----------------------------------------
 
  void move ()
  {
 
    PVector velocity = direction.get();
    velocity.mult (speed);
    location.add (velocity);
  }
 
  // CHECK --------------------------------------------------------
 
  void checkEdgesAndBounce ()
  {
    float radius = ellipseSize / 2;
 
    if (location.x < radius )
    {
      location.x = radius ;
      direction.x = direction.x * -1;
    }
    else if (location.x > width-radius )
    {
      location.x = width-radius ;
      direction.x *= -1;
    }
 
    if (location.y < radius )
    {
      location.y = radius ;
      direction.y *= -1;
    }
    else if (location.y > height-radius )
    {
      location.y = height-radius ;
      direction.y *= -1;
    }
  }
  
  
  // CHANGE COLORS??
  
  void change ()
  {
    for (int j = 0; j <=1;)
    {
      for (int i = 0; i <= 2;){
      colors[i][j] = random(0,255);
       i += 1;
      }
      j += 1;
    }
   
   if (mousePressed) 
   {
    c = color( colors[0][0], colors[1][0], colors[2][0]);
    //b = color( colors[0][1], colors[1][1], colors[2][1]);
   }
  }
  // DISPLAY ---------------------------------------------------------------
 
  void display ()
  {
    //fill (#ffedbc);
    
    //background(b); 
    fill (c);   
    noStroke();
    ellipse (location.x, location.y, ellipseSize, ellipseSize);
  }
  
 
}

void bgChange ()
{
  for (int k = 0; k <=2;)
  {
   bgColors[k] = random(0,255);
   k+=1;  
  }
  
  if (mousePressed)
  {
    bg = color(bgColors[0], bgColors[1], bgColors[2]);
    
  }
}
 

