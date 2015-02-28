
int counter;
void setup () {
  size (1000,1000);
  background (0,0,0);
  color(HSB);
  counter=0;
}

void draw () {
  counter++;
  noStroke();
  fill (random(255),200,50,25);
  if (mousePressed == true)
    ellipse (mouseX,mouseY, 30, 30);
    
}
    

