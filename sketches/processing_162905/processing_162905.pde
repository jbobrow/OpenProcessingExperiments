
float theta=0;

void setup() {
  size (400,400);
  background (255);
}

void draw() {
  background(20); //makes no trail behind the dots

  for (int x = -50; x < 450; x = x+50) {
    for (int y = -50; y < 450; y = y+50) {
      
      fill(0);
      ellipse(x,y,50,50); //the faint black circles
      
      //pushMatrix pauses any active transformations going on.
      //Anything between push and pop will apply only to the things
      //between them. After pop, anythign active before push will
      //be applied again. This keeps transformations contained.
      pushMatrix();
        theta = theta+radians(.05); //increments the rotation
        translate(x,y); 
        
        rotate(-theta+radians(sq(abs(x-200))+sq(abs(y-200))));
        //rotate by -theta, plus a fixed amount relative to x and y
        //this offsets the various circles
        
        noStroke();
        fill((51*x)/20-(51*x*x)/8000,(51*x*x)/8000-(51*x)/20+255,(51*y)/20-(51*y*y)/8000);
        //this colors the circles relative to their position
        //made parabolic equations to get them to look cool
        ellipse(0,20,10,10);
      popMatrix();
    }
  }
}
