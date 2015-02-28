
void setup() {  //setup function called initially, only once
  size(400, 400);
}

// position of the ball
var x = 20;
// how far the ball moves every time
var speed = 5;

void draw() {  //draw function loops 
    //counter++;
    background(202, 255, 97);
    
    fill(66, 66, 66);
    ellipse(x, 200, 50, 50);
    
    if (x > 375) {
        speed = -5;
    }
    if (x < 0) {
        speed = 5;
    }

    // move the ball
    x = x + speed;
}
