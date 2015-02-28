
float p1y= 150;
float p2y= 150;
boolean _p1up= false;
boolean _p2up= false;
boolean _p1down= false;
boolean _p2down= false;

PVector loc;
PVector vel;

void setup(){
size(900,400);

smooth();
  vel = new PVector(1,3);
  noStroke();
  reset();
}


void reset()
{
  loc = new PVector(random(5,width - 5),5);
  vel = new PVector(-5,-6);

}


void keyPressed() {
  
  
  if(key == ','){_p2up=true;}
  if(key == 'o') {_p2down=true;}
  
  if (key == CODED) {
    if (keyCode == UP) {
      _p1up = true;
    }
    if (keyCode == DOWN) {
      _p1down = true;
    }
  }
} 
void keyReleased() {
  
 if(key == ','){_p2up=false;}
  if(key == 'o') {_p2down=false;}
  if (key == CODED) {
    if (keyCode == UP) {
      _p1up = false;
    }
    if (keyCode == DOWN) {
      _p1down = false;
    }
  }
}
  
void draw(){
 background(40,99,0);
 strokeWeight(20);
 stroke(0);
 line(450,0,450,400);
  
 strokeWeight (2);
 line(150,0, 150,400);
 line (750,0,750,400);
 
  fill(144,30,0);
 rect(80,p1y,20,80);
 
 fill (0,0,144);
 rect(800,p2y,20,80);
 
 
 
 if(_p1up){
 p1y-= 5; }
 
 if(_p1down) {
   p1y+=5;}
   
   
    
 if(_p2up){
 p2y-= 5; }
 
 if(_p2down) {
   p2y+=5;}
   
   
   
   
   
    
loc.add(vel);
  
 
 if(loc.y <= 0 || loc.y  >= 400)//if the ball hits the top wall
    vel.y = -vel.y;//then bounce the ball off the wall at the same angle
    
    
   if(loc.x  >= 900 || loc.x <= 0)
    vel.x = -vel.x;
    
    if(loc.x ==80){
  
  vel.y = -vel.y;}
 
  fill(450-loc.x,0, 450-loc.x);
  ellipse(loc.x,loc.y,15,15);//
 

  }


