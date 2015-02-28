

PVector position, acc, vel;  
int radius = 5;  
int score = 0;


  

void setup() {  
  frameRate(60); //call draw this many times per sec  
  size(600,500);  
  smooth(); 
 

  
  //circle's position at all times  
  position = new PVector((int)(.3*width),30);  
  //position.x is the x coordinate, position.y is y coordinate  
  //starting velocity is 4px/frame in the +x direction  
  //and zero in the y direction  
  vel = new PVector(5,5);  
  //accleration is 0 in x direction and .2px/frame^2 in +y dir (down)  
  acc = new PVector(0,0);  
}  

void draw() {  

  background(0);  
  smooth();
  noStroke(); 
  fill(255,255,255); //black
  //draw circle @ current location  
  ellipseMode(CENTER); //placement of ellipse based on center pt  
  ellipse(position.x, position.y, 2*radius, 2*radius);  
  //update the velocity by increasing v_x and v_y by   
  //a_x and a_y, respectively  
  vel.add(acc);  
  //use this increased velocity to update the position for the  
  //next time we draw the circle  
  position.add(vel);  
  
  //if position hits paddle  
  if ( position.y+ radius+5 >= height-15 && position.x >= mouseX 
  && position.x <= mouseX +50 && position.y + radius+5 <= height-15  ) {  
    vel.y = -vel.y;  
  }  
  //if position hits top
   if ( position.y + radius <= 1 ) {  
    vel.y = -vel.y;  
  }  
  //if hit right wall
  if ( position.x + radius >= width ) {  
    vel.x = -vel.x;  
  }  
    //if hit left wall
  if ( position.x - radius <= 0 ) {  
    vel.x = -vel.x;  

  }  
 // the paddle
  fill(255);
  rect(mouseX, height -20, 50, 8);
  
  //print score
  text("Score:" + score, 10,10);
} 



 


  


