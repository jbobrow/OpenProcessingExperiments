
//These are global variables. In this case
//it's not because I need to use them in more
//than one function. It's because I can't declare
//them in the draw() function or they will forget
//their values every time.

//They represent a sort of invisible pen, tracking
//the point where the ellipse will be drawn on
//each frame.
float penX, penY = 0;

void setup() {
  size (200, 200);
  fill(255,255,255);
}


void draw() {
  //Redraw the background. This covers up previous
  //frames and allows me to create the illusion of motion.
  background(64,64,64);
  //Draw an ellipse based on the last round of values.
  ellipse(penX, penY, 20, 20);
  
  //Here's the lerp function. It calculates a number
  //that is about 2% of the way from where the ellipse
  //was drawn (on the horizontal axis) to where the mouse
  //is (also on the horizontal axis). The arguments can be
  //summarized as source, target, and step.
  
  //Here the source is the position of the "pen", the
  //target is the mouse position, and the step is 0.02,
  //which is rather small and produces a slow, lazy-looking
  //follow. Higher values will make the ball appear more
  //responsive.
  
  penX = lerp(penX, mouseX, 0.02);
  println("mouseX is "+mouseX+"; penX is "+penX);
  penY = lerp(penY, mouseY, 0.02);
  
  //This line, if you un-comment it, will create a 
  //sort of invisible wall for the ball. Its effect
  //is that penY (where we draw the ellipse) is never
  //in the bottom half of the screen.
  //penY = constrain(penY, 0, height/2);
  
}




