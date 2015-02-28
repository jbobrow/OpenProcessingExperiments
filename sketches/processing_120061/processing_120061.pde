
PImage what;
PImage how;
float theta; 
float i;
float j;
int counter = 0;
void setup() {
  what=loadImage("1.png");
  how=loadImage("2.png");
  size(1000,600);
  colorMode(HSB,100);
}

void draw() {
  counter++;
  i = random(0,100);
  j = random(0,100);
  background(0);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 90f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Move to the end of that line
  translate(0,-240);
  // Start the recursive branching!
  branch(120);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    tint(i,100);
    image(what,0,0,-h*30,-h*30);
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    tint(j,100);
    image(how,0,0,-h*30,-h*30);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
void keyPressed() {
  save("image"+ counter + ".png" );
}


