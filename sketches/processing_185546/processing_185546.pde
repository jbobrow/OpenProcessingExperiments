
float x = 80;
float y = 5;
float r = 1;

int speed = 2;
int state = 0;

void setup() {
  size(400, 400);
  
  smooth();
}

void draw() {
  background(0);

  stroke(0);
  fill(255);
  ellipseMode(CENTER);
 
 for (int x= 80; x <= 320; x= x+80) {
   ellipse(x, y, r, r);
 }

    if ( state == 0) {
    if ( r < 40) {
      y = y - speed;
      r = r + 1;
    }else if (r == 40) {
      y = y - speed;
      r = 1;
    } if ( y < 5) {
      if ( r < 40) {
        y = 5;
        r = r + 1;
        state = 1;
      } else if ( r == 40) {
        y = 5;
        r = 1;
        state = 1;
      }
    }
    }else if(state == 1) {
      if ( r < 40) {
        y = y + speed;
        r = r + 1;
      }else if (r == 40) {
        y = y + speed;
        r = 1;
      } if ( y > 400) {
        if ( r < 40) {
          y = 400;
          r = r + 1;
          state = 0;
        }else if (r == 40) {
          y = 400;
          r = 1;
          state = 0;
        }
      }
    }
}
        
    
 
  
  
  




