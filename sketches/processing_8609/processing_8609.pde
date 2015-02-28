
public class Arrow{

  float x, y;
  public Arrow(float _x, float _y){
   x = _x;
   y = _y;
  }
  
  public void update(){
      pushMatrix();
      translate(x, y); 
      float angle = atan2(mouseY-y, mouseX-x);
      rotate(angle);
      
      line(-7.5, -2.5, 2.5, -2.5);
      line(2.5, -2.5, 2.5, -5.5);
      line(2.5, -5.5, 7.5, -1.5);
      line(7.5, -1.5, 2.5, 2.5);
      line(2.5, 2.5, 2.5, -0.5);
      line(2.5, -0.5, -7.5, -0.5);
      line(-7.5, -0.5, -7.5, -2.5);
      popMatrix();     
  }
  
}

