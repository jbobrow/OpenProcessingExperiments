
class Square { 
  float xpos, ypos, speed, opacity, velocity, ellipse_size, square_size;
  
  Square (float x, float y, float s, float o, float v) {  
    ypos = y; 
    xpos = x;
    speed = s; 
    opacity = o;
    velocity = v;
    ellipse_size = 50;
    square_size = (2*ellipse_size)/3;
  } 

  void update() { 
    velocity+=speed;
    pushMatrix();
    translate(xpos, ypos);
    rotate(velocity);
    fill(255,255,255,opacity);
    ellipse(0,0,ellipse_size,ellipse_size);
    fill(135,129,189,190);
    rect(0, 0, square_size, square_size);
    popMatrix();


  } 
}




