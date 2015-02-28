
//z3325969
//Yeo Won Lee
//class for Bubble Blowing Game

class Bubble{
  //for motion
  PVector pos; 
  PVector vel; 
  
  Bubble(PVector _pos, float _s ){
  pos = _pos; 
  //so that the bubble will move at certain speed
  vel = new PVector(random(-3,4),random(-3,4));}
  

void move(){

   pos.add(vel); 
   vel.mult(1.0);
}
  
     
    void display(){
    //the actual bubbles themselves
    fill(random(255),random(255),random(255),100);
    ellipse(pos.x,pos.y,radius,radius);}
    
    void time(){
      //timer
      if(startGame==true){
      textSize(30);
      text((22*1000 - millis())/1000, width/2, height/2);}
    }
 
}

