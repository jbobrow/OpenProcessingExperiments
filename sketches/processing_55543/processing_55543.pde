
float radius=3; //Set the initial radius for the circles


void setup() {
  size(500,500);
  smooth();
  noStroke();
  strokeWeight(0.1);
  background(0);
  ellipseMode(RADIUS);
}

void draw() {
  frameRate(100); //adjusts the speed of the animation
  fill(0,5); //to create fading effect, adjust alpha (0,x)
  rect(0,0,width,height); 
  fill(random(50,200),0,0,200); //creates range of red values
  ellipse(random(100,400),random(100,400),radius+=0.1,radius); //generates random ellipses between 100-400px, while increasing radius size by 0.1 each frame
}
  

