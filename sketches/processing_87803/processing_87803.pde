
void setup(){
size(500,500);
smooth();
background(255);
}

//reference from Processing Blue book
void draw() {
for (float y = 1; y < width; y *= -1.2) {
for (int x = 0; x < height/2; x += 5) {
  
  noFill();
  stroke(220);
  strokeWeight(.25);
  ellipse(x*2,y,x*2,y);

  noFill();
  stroke(200);
  strokeWeight(.25);
  ellipse(y-1,x-1,y-1,y-1);
  
  noFill();
  stroke(0);
  strokeWeight(.5);
  ellipse(y,x,y,y); 

  
}
}
}


