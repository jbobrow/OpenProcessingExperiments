
float radi=20;
void setup() {
  size (600, 600);
  fill(255, 255, 255);
  smooth();
  background(0);
  noFill();
  ellipseMode(CENTER);
}
void draw(){
  fill(0,0,0,5);
  rect(0,0,width,height);
  noFill();
  for(float x=radi;x<width;x+=radi){
    
    float rand=random(mouseX/10);
    stroke(random(0,x%5), 100,220);
    pushMatrix();
    translate(width/2+rand,height/2+rand);
    rotate(radians((frameCount)60));
    ellipse(x,x,radi+rand,radi+rand);
    popMatrix();
    pushMatrix();
    translate(width/2+rand,height/2+rand);
    rotate(radians((-frameCount)60));
    ellipse(x,x,radi+rand,radi+rand);
    popMatrix();
  }
}
