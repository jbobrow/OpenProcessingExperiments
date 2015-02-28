
int num_part = 30;
Particle[] cuties = new Particle[num_part];
Boolean isSetup = false;
//
void setup() {
  size(900, 400);
  background(51,0,51);
}
void draw() {
  if (mousePressed) {
    //this sets up all the particles
    for (int i = 0; i<num_part; i++) {
      cuties[i] = new Particle(mouseX, mouseY);
    }
    isSetup = true;//we have to use this to check if they are setup or not
  }
  if (isSetup == true) { //if setup, then move and display them
    for (int i = 0; i<num_part; i++) {
      cuties[i].update();
      
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
  int c;
 
  Particle (int x, int y) {//constructor statement. It constructs the particle
    x_pos = x;
    y_pos = y;
    x_speed = random(-4, 4);
    y_speed = random(-4, 4);
    w = int( random(2, 15) );
  }//end constructor. It should only run once when you setup the particle, like the setup() function
  //
  void update() {//i use update to do math. In this case move the particle
    x_pos = x_pos + x_speed;
    y_pos = y_pos + y_speed;
    y_speed += -.1;//this makes it behave like gravity.
    
    c = (int)random(255);
    fill(255, c , 0, 70);
    stroke(255, 50);
    ellipse(x_pos, y_pos, w, w);
  }//end update
 
}//end of particle


