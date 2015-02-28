
//Joseph Volpe
// C and C lab fall 2010
  
 
int NumBalls = 15;
TriClass[] Tri;

 
void setup(){
 size(500,500);
 smooth(); 
  Tri = new TriClass[NumBalls];
  for(int i=0; i<NumBalls; i++) {
    Tri[i] = new TriClass();
  }
}
 
void draw(){
    fill(0,25);
    rect(0,0,width,height);
     
    for(int i=0; i<NumBalls; i++) {
    
    Tri[i].TryIt();
  }
  //
      
    }
    
void mouseDragged(){
 // TriClass.move();
}

     
class TriClass {
  float x=40;
  float xspeed;
  float y=40;
  float yspeed;
  float r=random(25,100);
  float g=random(25,75);
  float b=random(20,100);
 
 
  TriClass() {
    xspeed = 3+random(-3,3);
    yspeed = 5+random(-3,3);
  }
 
  void TryIt() {
    noStroke();
    fill(r,g,b);
    x=x+xspeed;
    y=y+yspeed;
     
    if (x > width-20){
      xspeed = xspeed*-1;
    } else if(x < 20){
      xspeed = xspeed*-1;
    }
     
    if (y > width-10){
      yspeed = yspeed*-1;
    } else if(y < 10){
      yspeed = yspeed*-1;
    }
    rect(x,y,r,r);
     
  }
  
   void move()
  {
    if(dist(mouseX,mouseY,x,y)<r)
    {
      x = mouseX;
      y = mouseY;
      if (x>width || y>height) {
        x = 0;
        y = 0;
      }
    }
  }


}


