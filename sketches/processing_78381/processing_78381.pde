
float theta = 0;
float x = 21;

void setup() {
  size(500, 500);

}

void draw() {
  background(255);
  
  translate(width/2, height/2);
  rotate(theta);
  noStroke();
  fill(190, 190, 20);
  ellipse(0, 0, 30, 30);

  for (int i = 0; i < x; i++) {
    pushMatrix();
    
    fill(255,0,0);
    rotate(i*TWO_PI/x);
    translate(150, 0); 
    ellipse(0, 0, 20, 20);
    
    randomSeed(2); //Make sure random generates same results each time loop is run
    fill(0,0,255);
    rotate(theta*random(1,i)+random(i));
    translate(15,0);
    ellipse(0,0,5,5);
    
    popMatrix(); // Origin back at (width/2,height/2)
  }

  theta += 0.01;
}
