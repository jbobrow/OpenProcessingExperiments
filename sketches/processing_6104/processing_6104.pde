
class Heart{
 
  float hx, hy;
  float start_hy;
  float speed;
  float the_scale;
  float test_x;
  float easing;
  float easing_position;
  float x_shift;
  
  
  //constructor
  
  Heart(float xpos,float x_sh, float ypos, float sp, float sc,float ea_po, float ea){
   hx = xpos;
   start_hy = ypos;
   hy = ypos;
   speed = sp;
   the_scale = sc;
   easing_position = ea_po;
   easing = ea;
   x_shift = x_sh;
   
   }
   
  void display(){
    pushMatrix();
    translate(hx+x_shift,hy);
    scale(the_scale);
    shape(heart, 0, 0);
      hy = hy + speed;
    popMatrix();
    
    if(hy < -20)
    {
      hy = start_hy;
    }
  }
  void easing(){
    if(mouseX < easing_position)
    {
      hx = hx + (easing_position-hx)*easing;
    }
    else if(mouseX > easing_position + 180)
    {
      hx = hx + (easing_position+180-hx)*easing;
    }
    else{
      hx = hx + (mouseX-hx)*easing;
    }
  }
  
}

