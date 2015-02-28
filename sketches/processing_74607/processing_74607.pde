
int num_part = 30;
Particle[] cuties = new Particle[num_part];
Boolean isSetup = false;
//
void setup() {
  size(700, 400);
}
void draw() {
  if (mousePressed == true) {
    //this sets up all the particles
    for (int i = 0; i<num_part; i++) {
      cuties[i] = new Particle(mouseX, mouseY);
    }
    isSetup = true;//we have to use this to check if they are setup or not
  }
  if (isSetup == true) { //if setup, then move and display them
    for (int i = 0; i<num_part; i++) {
      cuties[i].update();
      cuties[i].display();
    }
  }
}//end of draw

class Particle {
  //variables that describe attributes of the particle. 
  float x_pos;
  float y_pos; 
  float x_speed;
  float y_speed;
  int w;

  Particle (int _x, int _y) {//constructor statement. It constructs the particle
    x_pos = _x;
    y_pos = _y;
    x_speed = random(-4, 4);
    y_speed = random(-4, 4);
    w = int( random(2, 15) );
  }//end constructor. It should only run once when you setup the particle, like the setup() function
  //
  void update() {//i use update to do math. In this case move the particle
    x_pos = x_pos + x_speed;
    y_pos = y_pos + y_speed;
    y_speed += .1;//this makes it behave like gravity.
  }//end update
  void display() {//if you wanted to draw a different shape, this is where you would do it
    ellipse(x_pos, y_pos, w, w);
  }//display
}//end of particle
