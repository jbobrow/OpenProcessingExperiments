
//code modified from 
// http://www.openprocessing.org/visuals/?visualID=22459
Mover[] movers;
int balls=4;
 
 
void setup() 
{
  size(1200,500);
  smooth();
  background(255);
  movers = new Mover[balls];
  for(int l=0; l<balls; l++)
  {
    movers[l] = new Mover();
  }
  
  for(int g=0; g<balls; g++)
  {
    movers[g].size_ = (g+1)*27;
    movers[g].setLocation(
                            (int)((g+1)*(movers[g].size_*2)/1.3), 
                            (int)((g+1)*(movers[g].size_)/5.0)
                         );
  }
   
}
/////////////////////////////////////////////////////////////////////////////
void draw() {
  noStroke();
  fill(65);
  rect(0,0,width,height);
  
  
  for(int i = 0; i<balls; i++)
  {
    movers[i].checkEdges();
    movers[i].ballCollisions(i);
        movers[i].update();

    movers[i].display();
  }
   
}

//////////////////////////////////////////////////////////////////////////////////////////
double windowArea()
{
  return width*height;  
}
/////////////////////////////////////////////////////////////////////////////////////////







/////////////////////////////////////////////////////////////////////////////////////////
/*///Mover methods
 Mover(int xlocation, int ylocation)
 Mover()
 setLocation(int xLoc, int yLoc)
 update()
 display()
 grow()
 grow(int growRate)
 checkEdges()
 ballCollissions()

/////////////////////////////////////////////////////////////////////////////
in draw we want to: 
calculate the movement of the balls
check to see if the balls are colliding with the walls or other balls--> if so, change the


 ////////method to detect collisions with other balls
 ////deflect against other ball, modifying the trajectory----angle already headed on by the angle between the two balls
 /////impart force
//////////////////////////////////////////////////////////////////////////////
*/ 

 
class Mover {
  PVector momentum;
  PVector location;
  PVector velocity;
  PVector acceleration;
  int size_;
  int growthRate = 0;
  
  Mover(int xlocation, int ylocation){
   size_ = 16;
    location = new PVector(xlocation, ylocation);
    velocity = new PVector(0,0);
    momentum = new PVector(0,0);
    acceleration = new PVector(0, .15); 
       
  }
  
  Mover() {
     size_ = 16;
    location = new PVector(this.size_+15, this.size_+15);
    velocity = new PVector(4,0);
    momentum = new PVector(0,0);
    acceleration = new PVector(0, .15); 
    
     
  }
  
  void setLocation(int xLoc, int yLoc){
   location.x=(xLoc);
   location.y=(yLoc);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    momentum.x = (size_ * velocity.x);
    momentum.y = (size_* velocity.y); 
 //print(movers[0].velocity.x+"     ");   
  }
  
  
  void display() {
    //print(this.acceleration.x+"           ");
   // print(this.momentum.x+ "    " );
    noStroke();
    colorMode(HSB);
    fill(abs(this.velocity.x*100), 60+abs(this.velocity.y*60), 360);
    ellipse(location.x,location.y,2*size_,2*size_); //modified by me to get
    //32x32 circle.
  }
  
  void grow()
  {
   size_=size_+growthRate;
  }////does nothing untill you call the grow(int) method and change growthRate
  
  void grow(int growRate){
   if(size_+16<width/2)
   {
     growthRate = growRate;
     size_=size_+growthRate;
   } 
  }
  
  void checkEdges() 
  {  //modified by me to simulate basic
    //projectile motion
  
  
    if (location.x > width - size_) {
      velocity.x = velocity.x * -.8; //simulates bounce energy loss
      this.grow();
      location.x = width-size_;
     
        
    }
    else if (location.x < size_) {
      velocity.x = velocity.x * -.8;
      this.grow();
      location.x = size_;
      
    }
  
    if (location.y > height - size_){
      velocity.y = velocity.y * -0.8;
      velocity.x = velocity.x * .99; //this simulates ground friction
      //this.grow();
      location.y = height - size_;
       
       
    }
    else if (location.y < size_) {
      velocity.y = velocity.y * -0.8;
      //this.grow();
      location.y = size_;
       
    }
      
    //This lets you "catch" and "throw" the ball.
    // Original code taken from previous excercises and programs in class.
    if(dist(location.x, location.y, mouseX, mouseY) < size_)
    {
      if (mousePressed == true) 
      {
        location.x = map(mouseX, 0, width, size_, width-size_);
        location.y = map(mouseY, 0, height, size_, height-size_);
        velocity.x = mouseX - pmouseX;
        velocity.y = mouseY - pmouseY;
      }
    }
    
    
  }//end checkEdges
  
  void ballCollisions(int thisIndex)
  {
     for(int j = 0; j < balls; j++)
     {
       if(j != thisIndex)//if j == thisIndex we don't need to check (it'll be a collision anyway!)
       {
         if(this.location.dist(movers[j].location) <= this.size_+movers[j].size_)
         {
           PVector tempV = new PVector(this.velocity.x, this.velocity.y);
           
           this.velocity.x =  (this.location.x - movers[j].location.x)/(this.size_);
           this.velocity.y =(this.location.y - movers[j].location.y)/(this.size_); 
           movers[j].velocity.x = (movers[j].location.x-this.location.x)/(movers[j].size_);
           movers[j].velocity.y =( movers[j].location.y -this.location.y )/(movers[j].size_);
          
          
          
         }
       }
     } 
  }
}//end Mover


