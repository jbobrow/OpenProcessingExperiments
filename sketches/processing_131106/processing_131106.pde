
void setup(){
  size(600,600);
  background(32,42,67);
}

void draw(){
 translate(width/2,height/2);
 rotate(random(TWO_PI));
 noStroke();
 smooth();
 fill(255,random(200),random(200),random(60));
 float x = random(80);
 float y = random(280);
 float z = random(280);
 ellipse(y,z,x,x);
 stroke(200,x);
 noFill();
 ellipse(y,z+2,random(60,100),random(20,50));
 frameRate(20);
}
