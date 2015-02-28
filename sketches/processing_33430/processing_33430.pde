
//move a circle around with the arrow keys

float circ_x = 100;
float circ_y = 231;
int acceleration = 2;
float deceleration = .9;
float x_speed = 0;
float y_speed = 0;

void setup() {
 size(300, 300);
}

void draw() {
  background(180);
  ellipse(circ_x, circ_y, 20, 20);
  circ_x += x_speed;
  circ_y += y_speed;
  
  x_speed = x_speed * deceleration;
  y_speed *= deceleration;
  if (abs(x_speed) < .01) {
     x_speed = 0;
    }
  if (abs(y_speed) < .01) {
      y_speed = 0;
  }      
  
  
}
//void mousePressed() {
//  rect( mouseX, mouseY, 30, 4 );
//}
//void mouseDragged() {
//  ellipse( mouseX, mouseY, 30, 10 );
//}x
void keyPressed() {
  if (keyCode == LEFT) {
    x_speed -= acceleration;
  } else if (keyCode == RIGHT) {
    x_speed += acceleration;
  }
  
  if (keyCode == UP) {
    y_speed -= acceleration;
  } else if (keyCode == DOWN) {
    y_speed += acceleration;
  }
  
}
void keyReleased() {
  if (key == 'T') {
    println("T pressed " + key);
  }
}


                
                                
