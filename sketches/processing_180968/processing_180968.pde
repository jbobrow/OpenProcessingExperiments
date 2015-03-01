
Mover m;
Mover m2;
float checker = 0; 
float[][] colors = new float[3][4];
float[][] newColors = new float[3][4];  
 
void setup ()
{
  size (600, 200);
  smooth();
  colorMode(RGB);
  
  m = new Mover ();
  m2 = new Mover ();
 
  //background (255,255,255);
  frameRate (30);
  
  
  
}
 
void draw ()
{
 
  background (255,255,255);
 
  m.move();
  m.checkEdgesAndBounce();
  m.display();
  
  m2.move();
  m2.checkEdgesAndBounce();
  m2.display();
}
 
 
class Mover
{
  PVector direction;
  PVector location;
 
  float speed;
  float ellipseSize;
  
  color c; 
  
  
 
  Mover () // Konstruktor = setup der Mover Klasse
  {
    
    for (int j = 0; j <= 3;){
      for (int i = 0; i <= 2;){
       colors[i][j] = random(0,255);
       i += 1;
      }
    j+=1; 
    }
    
    //if (mousePressed)
     //{
       //for (int j = 0; j <= 3;){
         //for (int i = 0; i <= 2;){
          //newColors[i][j] = random(0,255);
          //i += 1;
         //}
        //j+=1;
        //checker += 1; 
      //}
     //}
    if (checker > 1)
    {
      c = color( newColors[0][0], newColors[1][0], newColors[2][0] );
    }else{
    c = color( colors[0][0], colors[1][0], colors[2][0] ); 
    }
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
 
  // DISPLAY ---------------------------------------------------------------
 
  void display ()
  {
    //fill (#ffedbc);
    
    fill (c);   
    noStroke();
    ellipse (location.x, location.y, ellipseSize, ellipseSize);
    
  }
  
 
}
