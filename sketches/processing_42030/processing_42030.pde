
int[][] flyingBalls = { {11,50,1,1}, {11,150,1,1}, {11,250,1,1}, {11,350,1,1}, {11,450,1,1}, {11,550,1,1} };
   
Bloke myBloke = new Bloke();
       
void setup()
{
  size(600, 600);
    smooth();
}
    
void draw()
{
  fill(116,32,32, 15);
  rect(0, 0, width, height);
  fiona();
    
  noStroke();
  fill(22,200,11,200);
      
  /////////////////////////////////////////////1
     
  for(int i=0; i < flyingBalls.length; i++) //Why on earth doesn't processing support foreach?
  {
    ellipse(flyingBalls[i][0],flyingBalls[i][1], 20, 20);
       
    // == Checks ball location and reverses if it's at the edge (X-axis)
    if(flyingBalls[i][0]> width-10 || flyingBalls[i][0] < 10)
    {
      flyingBalls[i][2] = flyingBalls[i][2] * (-1);
    }
    flyingBalls[i][0] += flyingBalls[i][2]*4;
        
    // == Checks ball location and reverses if it's at the edge (Y-axis)
    if(flyingBalls[i][1]> height-10 || flyingBalls[i][1] < 10)
    {
      flyingBalls[i][3] = flyingBalls[i][3] * (-1);
    }
    flyingBalls[i][1] += flyingBalls[i][3];
  }
   
   
  fill(random(255),0,100);
  noStroke();
  float x = random(width);
  float y = random(height);
  ellipse(x,y, 10, 10);
      
  star(random(width), random(height),random(255), random(50), random(255));
  star(random(width), random(height),random(255), random(50), random(255));
  star(random(width), random(height),random(255), random(50), random(255));
  star(random(width), random(height),random(50), random(50), random(255));
  star(random(width), random(height),random(50), random(50), random(255));
  star(random(width), random(height),random(50), random(50), random(255));
    
    
  myBloke.moveIt();
    
}
    
// star generator, to be called in main draw method
void star(float xloc, float yloc, float R, float G, float B)
{
  int mapValue = 1;
  noStroke();
  colorMode(RGB, 255);
  fill(R, G, B);
  triangle(xloc + 10, yloc + 8.65, xloc - 10, yloc + 8.65, xloc, yloc - 8.65);
  triangle(xloc, yloc + 8.65 + 6, xloc + 10, yloc - 8.65 + 6, xloc - 10, yloc - 8.65 + 6);
}
   
   
   
class Bloke {
  float d=180,x=400,y=400,speed,turn,desiredD=180;
  int guide = 0;
     
     
  Bloke () {
  }
     
  void build(float intX, float intY) {
    fill(9,180,245,255);
    stroke(255,255,255,255);
    ellipse(x,y,20,20);
  }
     
  void detectCollision() {
    int buffer = 100;
       
    if(x<buffer)
      desiredD = 0;
       
    if(y<buffer)
      desiredD = 90;
       
    if(x>=width-buffer)
      desiredD = 180;
       
    if(y>height-buffer)
      desiredD = 270;
         
       
    if(x<buffer&&y<buffer)                  // == TOP LEFT
      desiredD = random(0,90);
       
    if(y<buffer&&x>width-buffer)            // == TOP RIGHT
      desiredD = random(90,180);
         
    if(x>width-buffer&&y>height-buffer)     // == BOTTOM RIGHT
      desiredD = random(180,270);
       
    if(y>height-buffer&&x<buffer)           // == BOTTOM LEFT
      desiredD = random(270,360);
        
  }
  void turn() {
    // == ENSURE ANGLE WITHIN RANGE ==
      if(d<0)
        d=358;
      else if(d>359)
        d=1;
           
      if(desiredD<0)desiredD=desiredD+360;
      if(desiredD>360)desiredD=desiredD-360;
         
      if( d!=desiredD )
      {
          if((d-desiredD+360)%360>180)
            d++;
          else
            d--;
      }   
         
      y+=sin(radians(d));
      x+=cos(radians(d));
  }
  void moveIt() {
    int chance = (int)random(45);
        
    desiredD = (int)desiredD;
    if(d==desiredD)
    {
      if(chance==0)
       desiredD = random(d-60,d+60);
       detectCollision();
    }
    turn();
    build(x,y);
  }
}
 
 
void fiona()
{
   
  int s = second()-1;
  int m = minute()-1;

     
  for(int i = 0; i<=s; i++)
  {
    strokeWeight(1);
    stroke(255,255,255,15);
    float xSec = (width/60.0)*i;
    line(xSec, 0, xSec, height);
  }
     
  // Stripes for minutes
   
  for(int i = 0; i<=m; i+=15)
  {
    fill(#CDC9C9,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
    for(int i = 1; i<=m; i+=15)
  {
    fill(#856363,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
     
    for(int i = 2; i<=m; i+=15)
  {
    fill(#CD9B9B,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
     
    for(int i = 3; i<=m; i+=15)
  {
    fill(#802A2A,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
     
    for(int i = 4; i<=m; i+=15)
  {
    fill(#A52A2A,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
     
    for(int i = 5; i<=m; i+=15)
  {
    fill(#A62A2A,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
     
    for(int i = 6; i<=m; i+=15)
  {
    fill(#EEB4B4,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
         
    for(int i = 7; i<=m; i+=15)
  {
    fill(#CD2627,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
      for(int i = 8; i<=m; i+=15)
  {
    fill(#F08080, 200);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
     
  for(int i = 9; i<=m; i+=15)
    {
    fill(#EE2C2C,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
    
    for(int i = 10; i<=m; i+=15)
    {
    fill(#800000,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
    
    for(int i = 11; i<=m; i+=15)
    {
    fill(#EE0000,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
    
    for(int i = 12; i<=m; i+=15)
    {
    fill(#FF3333,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
    
    for(int i = 13; i<=m; i+=15)
    {
    fill(#FF6A6A,15);
    noStroke();
    float xMin = (width/60.0)*i;
    rect(0, xMin, width, height/60);
  }
     
   
  }
                                
