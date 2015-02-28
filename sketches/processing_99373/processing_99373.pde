
//this sketch creates an interactive bouncing circle

float circleX = 250;   // x location of circle
float circleY = 0;     // y location of circle
float speed = 0;  // speed of circle
float gravity = 0.5;  // gravity, functions as acceleration



void circles() {
  //circle's colour is random
  fill(int(random(0, 255)),int(random(0, 255)),int(random(0, 255)));
  stroke(0);
  ellipseMode(CENTER);
  ellipse (circleX,circleY,100,100);
  circleY = circleY + speed; //change the circle's y location
  speed = speed + gravity; //speed increased by gravity
  if (circleY > (height-50)) {
    //if the circle hits the bottom of the screen, the speed is reversed and reduced
    speed = speed * -0.90; 
  }
  if (mousePressed && mouseX > (circleX - 50) && mouseX < (circleX + 50) && mouseY > (circleY -50) && mouseY < (circleY + 50)){
  //when the circle is clicked, its position can be controlled by the mouse
  circleX = mouseX;
  circleY = mouseY;
  speed = 0; //the speed resets when the circle is being 'held'
  }
}


