
class Movement extends Ball{
  Movement(float x, float y, float diameter, float speed  ){
    super (x,y, diameter, speed); 
  }
  void update(){
    y = y - speed;
    if (y < 200) {
      y = height-200;
      
    }
    
    rad += radinc;
    trans = map(sin(rad),-1,1,0,255);
    //println(rad);
  }
}


