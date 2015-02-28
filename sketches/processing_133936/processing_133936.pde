
float spin = 0.0;
void setup(){
  size(600,600);
  background(43,43,43);
}
   
void draw()
{
  translate(mouseX,mouseY);
  rotate(spin);
  noStroke();
  fill(random(250), random(250), random(201,210), random(40));
  triangle(75, -75, 50, 50, 40, 40);
  spin+=.2;  
}

