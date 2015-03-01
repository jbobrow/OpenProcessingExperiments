
int screen = 400; //screen size
int circ = 50; //ellipse size
int halfcirc = circ/2;
float y = 0; 
float x = screen/2; //start position of ball on x axis
float bounce = -.9; //for best results, should be between -.5 and -.9
float speed =0; //to see ball bounce within a 400,400 screen keep between 0-2
float gravity = .75; // for best results, should be between .01-.99
color c1;
color c2 = color(150, 150, 255); //background color


void setup() {
  size(screen, screen);
}

void draw() {

  background(c2);
  fill(c1);
  noStroke();
  ellipse(x, y, circ, circ);
  
  
   //catch the ball
  if(mouseX > x-halfcirc && mouseX < x+halfcirc && mouseY > y-halfcirc && mouseY < y+halfcirc) {
  c1 = (0);
  y=mouseY;
  x=mouseX;
  }else{
  c1 = (255);
  //move the ball
  y = y + speed;
  //rate of movement
  speed = speed + gravity;
  }
      //bounce and reverse direction
  if (y > height-halfcirc) {
    speed = speed * bounce;
    bounce = bounce + (.01 * gravity);
    y = height-halfcirc;
  }

 
 //reset ball
  if (mousePressed == true) {
    x=screen/2;
    y=screen/4;
  }
  
}



