
float x, y, vx, vy, g, bounce, rad;

void setup(){
  size(800,800);
  smooth();
  ellipseMode(CENTER);
  rad = random (10,50);
  x = random(rad, width-rad);
  y = random(rad, rad+100);
  vx = random(-1, 1);
  vy = 0;
  g = .08   ; //abitrary num, trial/error 
}


void draw(){
 background(255);
 fill(0,100);
 noStroke();
 
 //add the velocity to the position v
 x+=vx;//velocity down
 y+=vy;
 vy+=g; //gravity
 
 
     if(y > height-(rad/2) )
     {
      vy*=-.9; //reverses velocity
      y = height-(rad/2);
      }
     
     if(x < rad/2)//left edge
     {
      vx*=-.9; 
      x=rad/2;
     }
      
      if(x > width-(rad/2))//right edge
     {
      vx*=-.9; 
      x = width - (rad/2);
     }
     
     if(y > height - (rad/2))//top edge?
     {
       vy*=-.9;
       y= height - (rad/2);
     }
 
 
 
 
 pushMatrix();
 translate(x,y);
 ellipse(0,0,rad,rad);
 popMatrix();
  
}
