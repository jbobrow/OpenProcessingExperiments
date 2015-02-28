


void setup() {
  size(700,575);  
  
}

void draw() {
  colorMode(HSB); 
  smooth();
  background(0);
 
  

  frameRate(2);
  strokeWeight(1);
  noFill();
  stroke(random(255), random(255), random(255), random(150));
fill(255,10);

  
  float b = 0.0;
float inc = TWO_PI/50.0;
{
for(int i=25; i<700; i=i+1) {
  triangle(i+sin(b)*10.0, 125+sin(b)*450.0, random(inc), 125+sin(b)*125.0, random(inc), random(inc));
  b = b + mouseX * mouseY ;
}
 
}
//save("triangles.jpg");
}


