
void setup(){
  size(500, 500);
  
}

void draw(){
  fill(random(255));
  background(255);
  for(int i=1; i<=width; i+=3)
  {
    
    for(int j=1; j<=height; j+=3)
      {
        ellipse(i, j, ((sin(radians(mouseX)))/(sin(radians(mouseY))))*sin(radians(i)), 10*cos(radians(j)));
      }
  }

}


