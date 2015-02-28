
Penguin steve;
Penguin bob;
Penguin sam;

float peng_x;
float peng_y;

float yspeed = 1;
float xspeed = 2;



void setup(){
  size(800, 800);
  
  steve = new Penguin(400,400);
  
}

void draw(){
  println("Mouse X:" + mouseX + "Mouse Y:" + mouseY);
  


  background(120);
  smooth();
  
  steve.display();
  
  if (peng_y > height) {
    // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
    // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
    yspeed = yspeed * -0.95;
  }  
     // Add the current speed to the x location.
  peng_x = peng_x + xspeed;

  // Remember, || means "or."
  if ((peng_x > width) || (peng_x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    xspeed = xspeed * -1;
  }
}

