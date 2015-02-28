
//Creating a character named ball to move to key commands
ball ball1;



void setup() {
  size(400,400);
  smooth();
  
  ball1 = new ball (50,50,50);
}

void draw(){
  background(0);
  
  ball1.display();
  
  ball1.keyPressed();
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
    fill (255,100,245);
    noStroke();
    ellipse(x,y,w,w);
  }
 //Need the ball to freeze or not move when key is not being pressed.
//ball flies off page in response to up and down key commands 
//haven't added x axis keys yet
  void keyPressed() {
    if (key == CODED){
      if (keyCode == UP){
        y = y-10;
      }
      else if (keyCode == DOWN) {
        y = y + 10;
      }
      
    }else {
      y = y;
    }
  }
}

