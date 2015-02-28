
Circle myCircle;
void setup(){
  size(400,400);
  myCircle = new Circle(10,20,20,.5,.5);
}
void draw(){
  
 myCircle.draw_circle();
 myCircle.move_circle();
}


class Circle {
    float rad_size;
    float size;
    float x_pos;
    float y_pos;
    // {//, float xpos, float ypos, float xvel, float yvel)  {
  Circle (float rad_size, float xpos, float ypos, float xvel, float yvel)  {
    size = rad_size;
    x_pos = xpos;
    y_pos = ypos;
  /*xvel;
  yvel;*/
  }
  
  void draw_circle(){
    
  ellipse(x_pos,y_pos, size, size);
  
  
  }
  void move_circle(){
  //ellipse(mouseX,mouseY, size, size);
    x_pos = mouseX;
    y_pos = mouseY ; 
  
  
  }
    }
