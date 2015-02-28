
//Creating a character named ball to move to key commands
ball ball1;



void setup() {
  size(700,700);
    background(0);
  
  ball1 = new ball (25,25,20);
}

void draw(){
  
  ball1.display();
  
  ball1.keyPressed();
  
  if (mousePressed) {
    background (0);
  }
}

class ball {
  float x;
  float y;
  float speed;
  float w;
  
  ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
  }
  
  void display(){
    fill (255,20,245,70);
    noStroke();
    ellipse(x,y,w,w);
    
  }
 //key commands
//ball flies off page in response to key commands? 
// looking to create a perimeter
  void keyPressed() {
    if (key == CODED){
      if (keyCode == UP){
        y = y-5;
      }
      else if (keyCode == DOWN) {
        y = y + 5;
      }
    }if (keyCode == RIGHT) {
      x = x+5;
    } else if (keyCode == LEFT) {
      x = x-5;
    }
  }
}

