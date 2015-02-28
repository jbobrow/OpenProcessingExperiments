
class Robot  {
  boolean shut_down = false;
  boolean rotating = false;
  boolean hold = false;
  float prev_angle;
  int x;
  int y;
  float s;
  int r;
  int b;
  int g;
  int center_r;
  int center_b;
  int center_g;
  int eye_r;
  int eye_g;
  int eye_b;
  int w;
  float angle = 0;
  float eye_radiusX = 20;
  float eye_radiusY = 10;
  
  Robot(int red_val, int blue_val, int green_val, float scalar, int line_width, int x_pos, int y_pos)
  {
    x = x_pos;
    y = y_pos;
    s = scalar;
    w = line_width;
    r = red_val;
    b = blue_val;
    g = green_val;
    center_r = g;
    center_g = b;
    center_b = r;
    eye_r = 255-r;
    eye_g = 255-g;
    eye_b = 255-b;
  }
  
  void display()
  {
    pushMatrix();
     scale(s);  
       pushMatrix();
         translate(x, y);
         noStroke();
         
         fill(g, r, b);
         rect(25, 74, 20, 20);
    
         fill(r, g, b);
         rect(0, 0, 70, 74);
    
         fill(b, g, r);
         rect(-18, 94, 110, 140);
                   
         fill(center_r, center_g, center_b);
         ellipse(37, 164, 80, 80);
         
         fill(eye_r, eye_g, eye_b);
         ellipse(18, 30, eye_radiusX, eye_radiusY);
         ellipse(54, 30, eye_radiusX, eye_radiusY);
         
         fill(r, b, g);
         rect(0, 234, 25, 70);
         rect(50, 234, 25, 70);
         
       popMatrix();
       pushMatrix();
         translate(x+93, y+130);
         rotate(angle);
         stroke(0);
         strokeWeight(w);
         line(0, 0, 75, 0);
       popMatrix();
       pushMatrix();
         translate(x-19, y+130);
         rotate(-angle);
         stroke(0);
         strokeWeight(w);
         line(0, 0, -75, 0);
       popMatrix();
    popMatrix();
  }
  
  void rotate_arm(float new_angle)
  {
    if (shut_down == false && hold == false){
      if(rotating == false){
        if (angle < new_angle){
          prev_angle = new_angle;
          angle = constrain(angle+0.03, angle, new_angle);
          rotating = true;
        }
        else if (angle > new_angle){
          prev_angle = new_angle;
          angle = constrain(angle-0.03, new_angle, angle);
          rotating = true;
        }
      }
      else{
        if (angle < prev_angle)
          angle = constrain(angle+0.03, angle, prev_angle);
        else if (angle > prev_angle)
          angle = constrain(angle-0.03, prev_angle, angle);
        else
          rotating = false;
      }
    }
  }
  
  void change_color(int rf, int gf, int bf)
  {
    center_r = rf;
    center_g = gf;
    center_b = bf;
  }
  
  void shut_down()
  {
    shut_down = true;
    r = 137;
    g = 137;
    b = 137;
    center_r = 137;
    center_g = 137;
    center_b = 137;
    eye_r = 250;
    eye_g = 250;
    eye_b = 250;
    if (angle < PI/2)
      angle = constrain(angle+0.03, angle, PI/2);
    else if (angle > PI/2)
      angle = constrain(angle-0.03, PI/2, angle);
    if (eye_radiusX > 15)
      eye_radiusX -= 0.1;
    if  (eye_radiusY > 1)
      eye_radiusY -= 0.2;
  }
  
}


