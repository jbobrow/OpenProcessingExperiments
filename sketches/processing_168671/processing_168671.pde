
float beginX = 20.0;  // Initial x-coordinate
float beginY = 20.0;  // Initial y-coordinate
float endX = 1500.0;   // Final x-coordinate
float endY = 1500.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent =1;   // Determines the curve
float x = 200.0;        // Current x-coordinate
float y = 200.0;        // Current y-coordinate
float step = 0.005;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)

float temp_x;
//declaring a Ball oject.
Ball b, b2;
//declare an array of ball objects...
//int[] eighties;
//and determin how many slots are in the array (length of the array)
int num_objects = 400;
Ball[] ball_array = new Ball[num_objects];


void setup() {
  size(1000, 1000);
  noStroke();
  
  distX = endX - beginX;
  distY = endY - beginY;
  
  b = new Ball();
 b2= new Ball();
 //fill the array with ball objects...
 for (int i=0; i<num_objects; i++)
 {
   ball_array[i] = new Ball();
   
 }
  
  
}

void draw() {
  fill(116,219,255,10);
  rect(0, 0, width, height);
  pct += step;
  if (pct < 1.0) {
    x = beginX + random(pct * distX);
    y = beginY + random(pow(pct, exponent) * distY);
  }
  
  
//fill(252,180,98);
fill(255,170,0);
  ellipse(x, y, 30, 30);
  
  
  
  b.update();
  b.display();
  b2.update();
  b2.display();
  
  //iterate through the array and update/display each
  for  (int i=0; i<num_objects; i++)
  {
    ball_array[i].update();
    ball_array[i].display();
  }
  
   noFill();
  stroke(255,20);
  beginShape();
  for (int i=0; i< num_objects; i++)
  {
   //vertex( ball_array[i].x  ,  ball_array[i].y); 
   for (int j= i+1; j< num_objects; j++)
   {
     //coordinates of object1
     float x1 = ball_array [i].x;
     float y1 =ball_array [i].y;
     //coordinates of object 2
     float x2=ball_array[j].x;
     float y2=ball_array[j].y;
     if (dist(x1,y1,x2,y2) <100)
     {
      line(x1,y1,x2,y2); 
       
     }
     
   }
  
  }
    endShape();
 
}




void mousePressed() {
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
}
class Ball
{
  //store position and velocity of singular bouncing ball object.
  //these are local variables to the class object...
  float x,y,vx,vy,grav,diam;
  float bouncy;
  
  Ball()
  {
    //put object at a random posision
    x= random(width);
    y=random(height);
    //set a random diameter
    diam = random(1,40);
    
    bouncy = random (-.91, -.3);

    vx= random(-3,3);
    vy= random(-3,3);
    grav = 0.12;
    
    
  }
  
  void update()
  {
    
    //add gravity to the y velocity
  vy+=grav;
  //add velocity to position
  x+=vx;
  y+=vy;
    
    //test that we hit the bottom of the stage and reverse course in vy
if (y >height)
{
  
  //force the object back to the stage
  y =height;
 //reverse course in vy.
  vy*=-.8; 
}
  
  if(x< 0)
  {
    x = 0;
    vx*=-1;
  }
  if(x > width)
  {
    x=width;
    vx*=-1;
  }
  }
    void display()
  {
    //move object to position and draw it.
  pushMatrix();
  translate(x,y);
  ellipse(0,0,diam,diam);
  popMatrix();
  }
  void reset()
  {
    x=mouseX;
    y=mouseY;
    vx = random(-5,5);
    vy = random(-5,5);
    
  }
}

