
float theta=0;

void setup() {
  size (400,400);
  background (255);
}

void draw() {
  background(255); //erases the last one
  
  //for loops to make the grid: makes a spot every 50 pixels,
  //including ones just off each edge, so things looked right
  for (int x = -50; x < 450; x = x+45) {
    for (int y = -50; y < 450; y = y+45) {
      fill(0);
      theta = theta+radians(0.01); //increments the rotation
     
      //pushMatrix pauses any active transformations going on.
      //Anything between push and pop will apply only to the things
      //between them. After pop, anythign active before push will
      //be applied again. This keeps transformations contained.
      pushMatrix();
      translate(x,y); //moves the "origin" to x,y. see tumblr post
      rotate(theta); //rotates the object by theta.
      beginShape(); //lets me define a complex shape with vertices
        vertex(-25, -25);
        vertex(0,0);
        vertex(25,-25);
        vertex(25,25);
        vertex(0,0);
        vertex(-25,25);
      endShape(CLOSE); //CLOSE connects the shape's last two points
      popMatrix();
    }
  }
}

