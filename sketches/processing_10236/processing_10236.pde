
class Ball{
  float x, y, d;  //location, diameter
  float vy, vx; // speed
  
  Ball(float speed){
    x = 100;
    y = 100;
    d = 15;
    vy = speed;
    vx = speed *2/3;
  }
  
  void move(Pad p){
    if(y <= d/2){ //if the ball hit against the wall
      vy*=-1;
    }else if(hitting){ //if the ball hit against the pad
      if(p.angle == 0){
        vy *= -1;
      }else{
        vx = sqrt(sq(vx)+sq(vy))*cos(PI/2-p.angle);
        vy = -sqrt(sq(vx)+sq(vy))*sin(PI/2-p.angle);
       }
    }
    
    y += vy;
    x += vx;
  }
  
  void display(){
    fill(255, 196, 0);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x, y, d, d);
  }
  
  //detect if the ball is out of the table
  boolean out(){
    if (x > width || x < 0 || y > height){
      ballOut = true;
      return(true);
    }else{
      return(false);
    }
  }
}
  

