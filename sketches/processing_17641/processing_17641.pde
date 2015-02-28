
class Sprite{
  
  float radius;
//  float hei;
  float x;
  
  int xpos;
  int ypos;
  
  float frequency = random(-5, 12);
  
  float angle;
  
  Sprite(int x, int y, float rr){
    xpos = x;
    ypos = y;
    radius = rr;
    
  }

  void display(){
   
    float px, py;
    
   //main circle
//  stroke(255);
  noStroke();
  noFill();
  ellipse(xpos, ypos, radius, radius);
  
  //rotate dot around circle
  px = xpos + cos(radians(angle))*(radius/2);
  py = ypos + sin(radians(angle))*(radius/2);
  
  //rotating dot
  noStroke();
  fill(255, 180);
  ellipse(px, py, radius/5, radius/5);
  
  
  //center point rectangle
//  noStroke();
//  fill(100);
//  rectMode(CENTER);
//  rect(xpos, ypos, radius/25,radius/25);
  
  angle -= frequency;
  x+=1;
  
  }
  
  

}

