
class Ding{
  float x, y, rotation, radius, type;
  
  Ding(float x, float y, float rotation, float radius, float type){
    this.x = x; 
    this.y = y;
    this.rotation = rotation;
    this.radius = radius;
    this.type = type;
  }
  
  void display(){
    pushMatrix();
    translate(x,y);
    rotate(radians(rotation));
    ellipseMode(CENTER);
    ellipse(0, 0, 5, 5);
    line(0,0,radius,0);
    popMatrix();
  }
  
  void incrementRot(float by){
    rotation += by;
  }
  
  float[] pos(){
    return(calculatePoint(x, y, radius*2, rotation));
  }
  
}

