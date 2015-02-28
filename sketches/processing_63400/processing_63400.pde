
int xPos = 0;
int yPos = 5;
int speed = 5;  
int yspeed = 1;

int space  = 0;


void setup() {
  size(400, 400);
  smooth();
  
}

float state = 1;

void draw() {
  background(150);
  fill(0);


  if (state == 1) {
    yPos=yPos+speed;
    if (yPos > height) {
      state = 2; 
      
    }
  }

  if (state == 2) {
    xPos=xPos+speed;
    if (xPos > width) {
       
      state = 3;
    }
  }

  if (state == 3) {
    yPos=yPos-speed;
    if (yPos < 0) {
      state = 4; 
    
    }
  }

  if (state == 4) {
    xPos=xPos-speed;
    if (xPos < 0) {
    
      state = 1;
    }
  }



  ellipse(xPos, yPos, 30, 30);
}


void mousePressed() {
  saveFrame("ball.png");
}


