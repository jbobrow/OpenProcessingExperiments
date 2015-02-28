
class rectan{
  
  color c;
  float xpos;
  float ypos;
  float yspeed;
  
  //Constructor
  rectan(color tempc, float tempxpos, float tempypos, float tempyspeed){
    c = tempc;
    xpos = tempxpos;
    ypos = tempypos;
    yspeed = tempyspeed;
  }
  
  void display(){
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos,50,20);
  }
  
  void mover(){
    ypos += yspeed;
    if ( ypos > height){
      ypos = 0;
    }
  }
    
    
}
  
  
    

