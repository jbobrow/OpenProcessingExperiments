
void setup(){
  size(700,700);
}

void draw(){
  background(0,100,200);
  stroke(0,100,200);
  strokeWeight(3);
  fill(0,100,100);
 arc(300, 200, 600, 600, 0, PI/2);
 arc(300, 200, 400, 400, 0, PI/2);
 arc(300, 200, 200, 200, 0, PI/2);
 
 arc(300, 100, 600, 600, PI/2, PI);
 arc(300, 100, 400, 400, PI/2, PI);
 arc(300, 100, 200, 200, PI/2, PI);
arc(300, 100, 100, 100, PI, TWO_PI-PI/2);
arc(300, 100, 200, 200, PI, TWO_PI-PI/2);

arc(150, 500, 300, 300, 0, PI/2);
 arc(150, 500, 200, 200, 0, PI/2);
 arc(150, 500, 100, 100, 0, PI/2);
 
 arc(150, 500, 400, 400, PI/2, PI);
 arc(150, 500, 200, 200, PI/2, PI);
 arc(150, 500, 100, 100, PI/2, PI);
arc(150, 500, 50, 50, PI, TWO_PI-PI/2);
arc(150, 500, 100, 100, PI, TWO_PI-PI/2);
println("x: " + mouseX + "y " + mouseY ); 
}

