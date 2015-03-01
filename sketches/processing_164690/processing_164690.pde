
//int prevsec;
//int starttime;
void setup() {
  size(900, 900);
  background (10);
  smooth();
}

void draw() {
  strokeWeight(2);
  stroke(127,214,158);
  fill(181, 214, 193,5);
  int m = millis();
  
println("It has been " + (m/1000) + " seconds.");

  int y = int(map (second(), 0, 59, 850, 50));
  //background(0);
  //text("second = " +  second(), 50, 30); 
  // What the X value actually is
  // not the Second value

    ellipseMode(CENTER);

  

  ellipse(width/2, y, 100, 100);
}



