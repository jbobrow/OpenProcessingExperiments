
int x;

void setup() {
  size(500, 100);
}

void draw() {
  noStroke();
    fill(random(255),random(255),random(255));
  textAlign(CENTER);
   fill(random(255),random(255),random(255));
    textSize(random(50));
    text("LHS", width/2, height/2);
    
  if(mousePressed){
  save("myImage"+ x +".jpg");
  x = x+1;
  }
}
