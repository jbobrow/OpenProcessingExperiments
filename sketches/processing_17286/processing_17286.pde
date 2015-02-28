
/* this program creates ducks, which bounces against the walls and each other
*/
Duck [] duckies = new Duck[20];

void setup()
{
  size(500,500);
  
  for(int i = 0; i<duckies.length; i++) 
  {
    duckies[i] = new Duck (color(255,250,0), int(random(0,500)), int(random(0,500)), int(random(-20,20)), int(random(-20,20)));
  }
}

void draw() 
{
  background(30,62,30);
  

//bounce of duckies
  for (int i = 0; i < duckies.length; i++) 
  {
    duckies[i].move();
    duckies[i].display();
    duckies[i].collide(i);
  }
 
}

class Duck 
{
  float x_position, y_position; 
  float x_speed, y_speed;
  color c;
  float r, g, b;
  int wing_x_position;
  int wing_y_position;
  int s;

//contructor
  Duck(color tempC, float tempX, float tempY, float tempXspeed, float tempYspeed) 
  {
    c = tempC;
    x_position = tempX; 
    y_position = tempY;
    wing_x_position = 0;
    wing_y_position = 10;
    x_speed=tempXspeed;
    y_speed=tempYspeed;
    s=30;
  }

  void move () 
 {
  
  //move ducks in x and y position
   x_position=x_position + x_speed;
   y_position=y_position + y_speed;
   println(x_position);
 
  //bounce ducks 
  if (x_position<0)
 { 
   x_speed = -x_speed;
 }
   if (x_position>width)
 { 
   x_speed = -x_speed;
 }
  if (y_position<0)
 { 
   y_speed = -y_speed;
 }
  if (y_position>height)
 { 
   y_speed = -y_speed;
 }
  //let ducks slow down
  if (mousePressed == true) 
    {
      x_position=x_position-x_speed;
      y_position=y_position-y_speed;
    }
  }

  void display() {
    
    // duckie
    //body
       fill(255,150,0);
    stroke(255,150,0);
    ellipse(x_position,y_position,1.5*s,1.5*s);
    
    //left eye
    stroke(255,0,0);
    fill(0,0,255);
    
    ellipse(x_position-s*0.25,y_position-s*0.25,s*0.4,s*0.4);
    ellipse(x_position-s*0.25,y_position-s*0.25,s*0.3,s*0.2);
    ellipse(x_position-s*0.25,y_position-s*0.25,s*0.2,s*0.05);
    //right eye
     ellipse(x_position+s*0.25,y_position-s*0.25,s*0.4,s*0.4);
    ellipse(x_position+s*0.25,y_position-s*0.25,s*0.3,s*0.2);
    ellipse(x_position+s*0.25,y_position-s*0.25,s*0.2,s*0.05);
    
    //wings
    stroke(255,90,0);
    fill(255,90,0);
   
    triangle(x_position+0.75*s,y_position,x_position+s,y_position+s*0.75,x_position+s*0.3,y_position);
    triangle(x_position-0.75*s,y_position,x_position-s,y_position+s*0.75,x_position-s*0.3,y_position);   
    
    //beak
    stroke(250,110,0);
    fill(250,110,0);
    
    triangle(x_position-0.3*s,y_position+0.1*s,x_position,y_position+0.3*s,x_position+0.3*s,y_position+0.1*s);
    triangle(x_position-0.3*s,y_position-0.1*s,x_position,y_position+0.3*s,x_position+0.3*s,y_position+0.1*s);
    stroke(255,10,0);
    fill(255,10,0);
    
    triangle(x_position-0.3*s,y_position+0.1*s,x_position,y_position-0.3*s,x_position+0.3*s,y_position+0.1*s);
   
  
    } //end of void display
    void collide(int index)
    {
    for (int i = 0; i < duckies.length; i++) 
    {
      float distance = 
        dist(duckies[i].x_position,duckies[i].y_position,x_position,y_position);
      if (i!=index && distance < 40)    
      {  
        float xi = duckies[i].x_speed;
        float yi = duckies[i].y_speed;
        duckies[i].x_speed = x_speed;
        duckies[i].y_speed = y_speed;
        x_speed = xi;
        y_speed = yi;
      }
    }
    }
  } // end of class


