
float counter = 0;
float mouse1;

void setup() {
  size(500,500);
  background(255); 
  
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  float amplitude = map(sin(counter), -1, 1, -100, 100);
  fill(amplitude+mouseX,mouseX-200,-amplitude+mouseX);
  ellipse(amplitude, 0, 50, 50);
  
  mouse1 = map(mouseX, 0, 500, 0, 150);
  
  println(sin(counter));
  counter  += 0.2*mouse1/100;
  
  
}
