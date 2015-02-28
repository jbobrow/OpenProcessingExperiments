
//Eye of the Beholder - Nicholas Mei
Eye[] eye = new Eye[12]; //let's make an eye class
//Tentacle[][] tentacle = new Tentacle[11][25];//let's make a tentacle class!
Mouth[] mouth = new Mouth[3]; //let's make a mouth class
Body body;//let's make a body class

void setup ()
{
  size (900,900);
  smooth();
  
  mouth[0] = new Mouth(width/2, 685, random (85,120), random(45,60), 24);
  mouth[1] = new Mouth(width/2, 685, random (150,200), random(70,90), 30);
  mouth[2] = new Mouth(width/2, 685, random (240,300), random(105, 125),36);

  for (int i = 0; i < eye.length; i++)
  {
    if (i == 0)
    {
      eye[i] = new Eye(width/2, height/2, random (200,350), random (200, 350));
    }
    else
    {
      eye[i] = new Eye(random(0,width), random(0,height), random(60,100), random(60,100));
      //tentacle[i] = new Tentacle();
    }  
  }
  
  body = new Body(30);
}

void draw()
{
    background(0, 0, 0, 10);
    body.display();
    mouth[2].display();
    mouth[1].display();
    mouth[0].display();
    mouth[0].add_teeth();
    mouth[1].add_teeth();
    mouth[2].add_teeth();
  for (int i = 0; i < eye.length; i++)
  {
    eye[i].display();
    eye[i].update(i);
    eye[i].check_boundary();
  }
}

void mouseClicked()
{

  body = new Body(30);
  for (int i = 0; i < eye.length; i++)
  {
    
    if (i == 0)
    {
      eye[i] = new Eye(width/2, height/2, random (200,350), random (200, 350));
    }
    else
    {
      eye[i] = new Eye(random(0,width), random(0,height), random(60,100), random(60,100));
    }  
  }
  
  mouth[0] = new Mouth(width/2, 685, random (85,120), random(45,60), 24);
  mouth[1] = new Mouth(width/2, 685, random (150,200), random(70,90), 30);
  mouth[2] = new Mouth(width/2, 685, random (240,300), random(105, 125),36);
  mouth[0].add_teeth();
  mouth[1].add_teeth();
  mouth[2].add_teeth();
 
  redraw();
}

class Body
{
  int color_count = 0;
  int curviness;
  float angle;
  float angle_1;
  float[] r = new float[50];
  
  boolean invert = false;
  
  Body (int curves)
  {
    curviness = curves;
    angle = (360/curviness);
    
    for (int i = 0; i < curviness; i++)
    {
        r[i] = random (290,350);
    }  
  }
  

  void display()
  {  
    color shade1 = color(93, 19, 116) ;
    color shade2 = color(255, 99, 46);
    color gradient = lerpColor(shade1, shade2, 0.001*color_count);
    
    noStroke();
    pushMatrix();
    translate(width/2, height/2 + 50);
  
    if(color_count == 1000 || invert == true)
    {
      invert = true;
      fill(gradient);
      color_count--;
    }
    if (color_count == 0)
    {
       invert = false;
    }
    if(invert == false)
    {
      fill(gradient);
      color_count++; 
    }
    //println(gradient);
    //println(shade2);
  
    beginShape(); 
  
    //curveVertex(r[0] , 0);
    //curveVertex(r[0] , 0);
  
    for (int i = 0; i < curviness; i++)
    {
      angle_1 = angle*(i);
      curveVertex(r[i]*cos(radians(angle_1)), r[i]*sin(radians(angle_1)));
    }
  
    //curveVertex(eye[0].eye_size.x, 0);
    //curveVertex(eye[0].eye_size.x, 0);
    endShape();  
    popMatrix();
  }  
  
}

class Mouth
{
  PVector mouth_location;
  PVector mouth_size;
  
  boolean invert = false;
  int color_count = 0;
  int toothiness;
  
  Mouth(float mouth_locx, float mouth_locy, float mouth_sizex, float mouth_sizey, int teeth)
  {
    mouth_location = new PVector (mouth_locx, mouth_locy);
    mouth_size = new PVector (mouth_sizex, mouth_sizey);
    toothiness = teeth;

  }

   void display ()
  {
    color shade1 = color(242, 142, 34); 
    color shade2 = color(255, 26, 26) ;
    color gradient = lerpColor(shade1, shade2, 0.01*color_count);
    
    
    if(color_count == 100 || invert == true)
    {
      invert = true;
      fill(gradient);
      color_count--;
    }
    if (color_count == 0)
    {
       invert = false;
    }
    if(invert == false)
    {
      fill(gradient);
      color_count++; 
    }
    fill(gradient);
    noStroke(); 
    ellipse(mouth_location.x, mouth_location.y, mouth_size.x, mouth_size.y);
  }
  
  void add_teeth()
  {    
    pushMatrix();
    translate(mouth_location.x, mouth_location.y);
   
    for (int i = 0; i < toothiness; i++)
    {    
      float angle_1 = 0 + (360/toothiness)*i;
      float angle_2 = 0 + (360/toothiness)*(i+1);
      float r = ((mouth_size.x/2)*(mouth_size.y/2))/(sqrt( sq((mouth_size.y/2)*cos(radians(angle_1))) + sq((mouth_size.x/2)*sin(radians(angle_1)))));         
      float r2 = ((mouth_size.x/2)*(mouth_size.y/2))/(sqrt( sq((mouth_size.y/2)*cos(radians(angle_2))) + sq((mouth_size.x/2)*sin(radians(angle_2)))));

      float x1,x2,x3,y1,y2,y3;
      
      x1 = r*cos(radians(angle_1));
      x2 = r2*cos(radians(angle_2));
      y1 = r*sin(radians(angle_1));
      y2 = r2*sin(radians(angle_2));
      
      float r3 = (r + r2)/3;
      float angle_3 = (angle_1+angle_2)/2;
      
      x3 = r3*cos(radians(angle_3));
      y3 = r3*sin(radians(angle_3));
      
      fill(#FFFFFF);
      noStroke();
      triangle (x1, y1, x2, y2, x3, y3);           
    }
    popMatrix();  
  }
}

class Eye 
{
  PVector eye_location;
  PVector eye_size;
  PVector eye_velocity;
  PVector eye_acceleration;
  PVector pupil_location;
  PVector pupil_size;
  PVector pupil_velocity;
  PVector pupil_acceleration;
  
  //float pupil_locationx;
  //float pupil_locationy;
  float pupil_topspeed = 3.5;
  float eye_topspeed = 3.3;
  
  float eye_pheno;
  
  Eye(float eye_locx, float eye_locy, float eye_sizex, float eye_sizey)
  {
      eye_location = new PVector (eye_locx, eye_locy);
      eye_size = new PVector (eye_sizex, eye_sizey);
      pupil_location = new PVector (eye_locx, eye_locy);
      pupil_size = new PVector (random(eye_sizex/3.5,eye_sizex/2), random(eye_sizey/3.5,eye_sizey/2));
      pupil_velocity = new PVector (0,0);
      eye_velocity = new PVector (0,0);
      eye_pheno = random (0,4);
  }  
  
  void display ()
  {
     fill (#FFFFFF);
     noStroke();
     //stroke (#000000);
     //strokeWeight (2);
     ellipse(eye_location.x, eye_location.y, eye_size.x, eye_size.y); 
     
     //noStroke();
     fill(0);
     //fill (random(0,255), random(0,255), random (0,255));
    // ellipse(pupil_location.x, pupil_location.y, pupil_size.x, pupil_size.y);
     
     if (eye_pheno <= 1)
     {
       for (int i = 0; i < pupil_size.x || i<pupil_size.y; i++)
       {
         if(i%8 == 0)
         {
           stroke(#FFFFFF);
           strokeWeight(3);
           fill(#FFFFFF);
         }
         else if (i%8 != 0)
         {
           noStroke();
           fill(0);
         }
         ellipse(pupil_location.x,pupil_location.y, pupil_size.x-i,pupil_size.y-i);
       }
     }
     else if (eye_pheno <= 2)
     {
         for (int i = 0; i < pupil_size.x || i<pupil_size.y; i++)
       {
         if(i%7 == 0)
         {
           stroke(#E02626);
           strokeWeight(3);
           fill(#E02626);
         }
         else if (i%7 != 0)
         {
           noStroke();
           fill(#E8BE23);
         }
         ellipse(pupil_location.x,pupil_location.y, pupil_size.x-i,pupil_size.y-i);
       }
     }
     else if (eye_pheno <= 3)
     {
       for (int i = 0; i < pupil_size.x || i<pupil_size.y; i++)
       {
         if(i%7 == 0)
         {
           stroke(#6BEC3B);
           strokeWeight(3);
           fill(#6BEC3B);
         }
         else if (i%7 != 0)
         {
           noStroke();
           fill(#4380D3);
         }
         ellipse(pupil_location.x,pupil_location.y, pupil_size.x-i,pupil_size.y-i);
       }
     }
     else if (eye_pheno <= 4)
     {
       
        for (int i = 0; i < pupil_size.x || i<pupil_size.y; i++)
       {
         if(i%8 == 0)
         {
           stroke(0);
           strokeWeight(1.75);
           fill(0);
         }
         else if (i%8 != 0)
         {
           noStroke();
           fill(#FFFFFF);
         }
         rectMode(CENTER);
         rect(pupil_location.x,pupil_location.y, (pupil_size.x-i)/1.6,(pupil_size.y-i)/1.6);
       }
       
     }
     
  }
  
  void update(int num)
  {
    
    // Our algorithm for calculating acceleration:
    PVector mouse = new PVector(mouseX,mouseY);
    PVector orient = PVector.sub(mouse,pupil_location);  // Find vector pointing towards mouse
    PVector orient2 = PVector.sub(mouse,pupil_location);
  
    orient.normalize();     // Normalize
    orient.mult(0.1);       // Scale 
    pupil_acceleration = orient;  // Set to acceleration

   if (orient2.mag() > 7)  
    { 
      pupil_velocity.add(pupil_acceleration);
      pupil_velocity.limit(pupil_topspeed);
      pupil_location.add(pupil_velocity);
    }
    
    if (orient2.mag() <= 15 )
    {
      pupil_velocity.sub(pupil_acceleration);
      pupil_velocity.limit(0);
      pupil_location.add(pupil_velocity);
    }
  
    
    if (num != 0)
    {
      //Algorithm for moving eyes
      float targetx = 0;
      float targety = 0;
      
      //quadrant 1
      if (eye_location.x > width/2 && eye_location.y < height/2 )
      {
         targetx = random(width/2, width);
         targety = random(0,height/2);
      }
      //quadrant 2
      else if (eye_location.x < width/2 && eye_location.y < height/2 )
      {
          targetx = random(0,width/2);
          targety = random(0,height/2);
      }
      //quadrant 3
      else if (eye_location.x < width/2 && eye_location.y > height/2)
      {
          targetx = random(0,width/2);
          targety = random(height/2, height);
      }
      //quadrant 4
      else if (eye_location.x > width/2 && eye_location.y > height/2)
      { 
          targetx = random(width/2, width);
          targety = random(height/2 , height);
      }
      
      targetx += random(-450,450);
      targety += random(-450,450);
    
      PVector target = new PVector (targetx,targety);
      PVector eye_orient = PVector.sub(target,eye_location);
      eye_orient.normalize();
      eye_orient.mult(0.2);
      eye_acceleration = eye_orient;
      
      eye_velocity.add(eye_acceleration);
      eye_velocity.limit(eye_topspeed);
      eye_location.add(eye_velocity);
    }
  }
  
  void check_boundary()
  {  
        //change coordinate system for an easier time calculating
        pushMatrix();
        translate (eye_location.x, eye_location.y);
        
        float xa, yb;
        float aa, bb;
        float x, y;
        float in;
        boolean inside;
         
        // Ellipse equation: (x/a)^2 + (y/b)^2 = 1
        // In this program: (eye_location.x/(eye_size.x/2))^2 + (eye_location.y/(eye_size.y/2))^2 = 1
        // To solve for x, x = sqrt((1-(y/b)^2)*a^2))
   
        yb = sq((pupil_location.y - eye_location.y)/(eye_size.y/2));
        aa = sq(eye_size.x/2);
        xa = sq((pupil_location.x - eye_location.x)/(eye_size.x/2));
        bb = sq(eye_size.y/2);
        
        //solved for x
        x = sqrt((1-yb)*aa);
        //solved for y
        y = sqrt((1-xa)*bb);
        
        /* functions for diagnostic purposes
        //in = sq(xa) + sq(yb) - 1;
        //inside = (in < 0.002);
        //println(inside);
        //delay(20);
        //println (x);
        //delay(20);
        //println (y);
        */
        popMatrix();
        pupil_location = new PVector (constrain(pupil_location.x, eye_location.x - x + pupil_size.x/1.8, eye_location.x + x - pupil_size.x/1.8), 
                                      constrain(pupil_location.y, eye_location.y - y + pupil_size.y/1.8, eye_location.y + y - pupil_size.y/1.8));      
                                              
        //check that eyes don't move off screen
        if (eye_location.x >= width - eye_size.x/2)
        {
          eye_location.x = width - eye_size.x/2;
        }
        else if (eye_location.x <= 0 + eye_size.x/2)
        {
          eye_location.x = 0 + eye_size.x/2;       
        }
        
        if (eye_location.y >= height - eye_size.y/2)
        {
          eye_location.y = height - eye_size.y/2; 
        } 
        else if (eye_location.y <= 0 + eye_size.y/2)
        {
          eye_location.y = 0 + eye_size.y/2; 
        }
  }
}

/*
class Tentacle
{
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 30;
  float stiffness = 0.2;
  float damping = 0.7;
  
  Tentacle(float xpos, float ypos, float m, float g)
  {
     x = xpos;
     y = ypos;
     mass = m;
     gravity = g;
  }
  void update (float targetX, float targetY)
  {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }
  
  void display() 
  {
    noStroke();
    ellipse(x, y, radius*2, radius*2); 
  }
  
}

*/

