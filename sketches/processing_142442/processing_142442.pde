
class Bubblet{
  float x;
  float y;
  float diameter;
  float yspeed;

  
  Bubblet(){
    x = random(width);
    y = height;
    diameter = random(15, 75); 
    yspeed = 37.5/(diameter+random(-5, 5));
  }
  
  void ascend(){
    y = y - yspeed;
    x = x + random(-2, 2);
  }
  
  void display(){
    stroke(255);
    fill(225);
    ellipse(x, y, diameter, diameter);
  }
  
  void top(){
    if (y - diameter/2 < 0) {
      y = height + diameter;
    }
  }
  
  void pop(){
    
   float tempDiam = 0;
  
    if ((mouseX >= x - diameter/2 && mouseX <= x + diameter/2) && (mouseY >= y - diameter/2 && mouseY <= y + diameter/2) && mousePressed){
    x = random(width);
    y = height + diameter;
    }  
  }
  
}  


