
void setup() {
background(0);
size(500,445);
frameRate(15); 
}

void draw() {
for (int i=1; i<=200; i++){
strokeWeight(random(5,20));
  stroke(random(140),random(150),random(160));
  point(random(width), random(height));
 }
 noStroke();
 fill(0,0,0, 25);
 rect(0,0,500,445)
}

