
// Random Walker (No Vectors)
// slightly modified code by Daniel Shiffman <http://www.shiffman.net>

class Walker {
  float x,y;

  Walker() {
    x = 100;
    y = 40;
  }

  void render() {
    noStroke();
    fill(125);
    //rectMode(CENTER);
    ellipse(x,y,75,50);
     fill(125);
    ellipse(x-35,y+3,50,30);
     fill(125);
    ellipse(x-60,y+3,30,20);
    
  
  }

  // float side to side
  void walk() {
    float vx =.25;
    float vy =.125;
    x += vx;
    y += vy;
    
    // Stay on the screen
    x = constrain(x,0,width-37);
    y = constrain(y,0,height-23);
    
     if(x>width){
      vx = vx * -1;
      vy = vy * -1;
    
    }
  }
}


