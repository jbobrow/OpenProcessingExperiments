
int x;

void setup() {
  size(500, 100);
}

void draw() {
  noStroke();
  for ( int i = 0; i < width; i = i +100) {
    fill(random(255),random(255),random(255));
    rect(i, 0, 100, 100);
  }
  textAlign(CENTER);
   fill(random(255),random(255),random(255));
    textSize(random(50));
    text("LHS", width/2, height/2);
    
  if(mousePressed){
  save("myImage"+ x +".jpg");
  x = x+1;
  }
}
