
//Particle Rain.......
//Reference(s) + -
//http://processing.org/learning/topics/simpleparticlesystem.html
//

ArrayList particles = new ArrayList();

void setup(){
  
  size(700,400);
  smooth();
  frameRate(30);
  cursor(CROSS);
  
}


void draw(){
  
 //background(0);
 noStroke();
 // if (mouseButton == RIGHT)
 //  {
 //  fill(255,10);
 //  rect(0,0,width,height);
 //  }
  
//Fade effect on particles/lines
 
  fill(0,10);
  rect(0,0,width,height);
 
  
//Generates particles at coursor position  
   if (mousePressed == true)
   {
   particles.add(new Particle(mouseX,mouseY));
   }
  
  
    for (int L = 0; L < particles.size(); L++){
    Particle p = (Particle)particles.get(L);
    
    if(p.life >0)
    {
    p.update();
    p.draw_Part();
     
//Second particle generated - p2 = lines
 /*    for (int E = 0; E < particles.size(); E++){
       Particle p2 = (Particle)particles.get(E);
//Checks x,y postion of other particles but not its self.
//If distance between them is less then the number specified 
//a line is drawn between each particle within that distance.
       if(dist(p.x,p.y,p2.x,p2.y) < 45)
        {
         if(mouseButton == LEFT)
         { 
         stroke(255);
         line(p.x,p.y,p2.x,p2.y);      
         }
          else if (mouseButton == RIGHT)
          {
          noStroke();
          }
        }
      }*/
    }
  }
}


class Particle{

//Postion
 float x,y;
//Speed
 float xSpeed,ySpeed; 
//Other factors
 float gravity;
 float life;
 float bounce;

//Define the variables; initial x,y positions(values):
   Particle(float inX, float inY){
 //Position
   x = inX;
   y = inY;
   life = 200;
   gravity = 1;
   bounce = -0.75;
   
//Positions released   
  xSpeed = random(-5,5);
  ySpeed = random(-15,-20);
 //xSpeed = 0;
 //ySpeed = 0;
 
 }
 

//Updates the value of the varibles for the particles 
 void update(){
   
   ySpeed += gravity;
   
   x += xSpeed;
   y += ySpeed;
   
  if (life > 0){
    life--;
    
  }
  if((y >= height - 10)&&(ySpeed > 0)){
    ySpeed *= bounce;
  }
  if(mouseX < 50){
    gravity = -1;
  }
  if(mouseX > width - 50){
    gravity = 5;
  }
  
  if((y >= height + 10)&&(ySpeed > 0)){
    ySpeed *= bounce;
  }
 }
 
 
void draw_Part(){
   
  if (mouseButton == LEFT)
  {
//Point particles   
 // stroke(255); 
  //point(x,y);
    
//Ellipse Particles 
 //stroke(255,0,0,50); 
   fill(255,0,0,50);   
   ellipse(x,y,10,10);
} else if(mouseButton == RIGHT)
  {
//Point particles   
 stroke(0,36,255);
 point(x,y);
    
 // fill(0);
  //ellipse(x,y,10,10);
  }
 }
}

//lookup...
//ColourMode(HSB)

