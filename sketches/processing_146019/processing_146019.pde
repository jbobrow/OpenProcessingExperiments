
int diff = 0;
void setup() {
  size(600,800);
}

void draw() {
  if(keyPressed)diff++;
  
  background(0);
  stroke(255);
  
  translate(width/2,height);
  rotate(-TWO_PI/4);
  
  randomSeed(diff);
  n();n();n();
  
  tree(n()*1.5,n()*1.5,0.8,0.8,50,10);
  
  fill(255);
  textAlign(LEFT,TOP);
  text(diff,0,0);
}

void tree(float turn1, float turn2, float scale1, float scale2, int lineLength, int iter) {
  if(iter == 0){
    return;
  }
  
  pushMatrix();
  line(0,0,lineLength,0);
  translate(lineLength,0);
  
  pushMatrix();
  rotate(turn1);
  scale(scale1);
  line(0,0,lineLength,0);
  translate(lineLength,0);
  tree(turn1+n(),turn2+n(),scale1+n(),scale2+n(),lineLength,iter-1);
  popMatrix();
  
  pushMatrix();
  rotate(turn2);
  scale(scale2);
  line(0,0,lineLength,0);
  translate(lineLength,0);
  tree(turn1+n(),turn2+n(),scale1+n(),scale2+n(),lineLength,iter-1);
  popMatrix();
  popMatrix();
}


float n() {
  return random(-0.2,0.2);
}
