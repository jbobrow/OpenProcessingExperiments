
class Osc  {   

  PVector angle;
  PVector velocity;
  PVector amplitude;

  Osc()  {   
    angle = new PVector(random(-0.03,0.03),random(-0.03,0.03));
    velocity = new PVector(random(-0.03,0.03),random(-0.03,0.03));
    amplitude = new PVector(random(width*1),random(height*1));    
  }   

  void osc()  {
    angle.add(velocity);
  }   

  void display()  {   
  

    PVector wind = new PVector(random(0.5,0.5),random(0.5,0.5));
    float x = cos(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;
  
 if (mousePressed) {
  fill(random(250),random(150),random(50));
  stroke(0);
  rect(x+30, y, 30, 30);
  rect(x, y+30, 30, 30);
  rect(x+60, y+30, 30, 30);
  rect(x+30, y+60, 30, 30);
  }
}   
}


