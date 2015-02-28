

class Drop {

  float x, y;   
  color c;
  float r;   
  float speed;
  
  Drop() {
    r = 8;               
    x = width/2;    
    y = height/2-150;             
    c = color(80, 130, 150); 
    speed=0;
  }

  // Display the raindrop
  void display() {
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++ ) {
      ellipse(x, y + i*4, i*2, i*2);
    }
  }

  void move() {
    speed = speed + .6 * frameCount/30;
    y += speed;
  }
}


