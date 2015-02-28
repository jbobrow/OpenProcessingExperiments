
void setup() { 
  size(250, 250); //canvas size
  background(0);  //set background black
  noStroke();  //anti-alias
}

void draw() {   
  //re-draw background 
  fill(0, 10); //colour of rectangle. second value (alpha) is opacity
  rect(0,0, width, height); //rectangle that covers the whole canvas

  fill(255);
  ellipse(random(width), random(height), 5, 80); //ellipse will appear randomly anywhere on the screen between 0 - width / 0 - height (the canvas of the animation) 
  // last two numbers represent the size of the elipse
  
  }

