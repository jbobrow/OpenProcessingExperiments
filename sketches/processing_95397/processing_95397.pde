
class Ball{
 PVector position;
 color col;

Ball(int x,int y,int z, color c){
  position = new PVector(x,y,z);
  col = c; 
  }
 
  void drawBall(){
    pushMatrix();
    translate(position.x, position.y, position.z);
    fill(col); 
    sphere(25);
    popMatrix();
  } 
}

