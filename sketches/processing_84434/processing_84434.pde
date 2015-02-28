
//header


//global variables

// setup
void setup(){
    //first set up
    //happen once
    size(700,500);
    smooth(); // anti-aliasing
}

// draw
void draw() {
  // 1 background color
  background(#f5102b);

  // 2 head with ellipse
  stroke(2);
  fill(#f6ff00); //yellow 
  ellipse(350, 250, 300, 400);  //location
  
  // 3 left eye
  fill(#0f5ded); //blue
  stroke(0); //black
  strokeWeight(10); //thickness of stroke
  rect(300, 150, 30, 30);
  
  // 4 right eye
  rect(400, 150, 30, 30);
  
  // 5 nose
  fill(0);
  stroke(255);
  strokeWeight(2);
  triangle(320, 200, 360, 370, 400, 200);
  
  // 6 mouth
  fill(#f5102b);
  stroke(0);
  strokeWeight(5);
  rect(300, 380, 100, 20);
  
}
