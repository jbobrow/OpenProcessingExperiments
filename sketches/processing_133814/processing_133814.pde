


void setup() {
size(400, 400);
} 
void draw() {
 
background(0);
 int d = mouseY - mouseX;
for (int x = d; x<=width -d; x+=20){
  for(int y = d; y<= height-d; y+=20){
  
  noFill();
  stroke(random(255), random(255), random(255));
  ellipse(x, y, d, d);
  }
  
}

}


