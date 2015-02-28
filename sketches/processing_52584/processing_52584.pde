
float bob = 45;

void setup(){
  size(640,480);
}

void draw(){
  background(0);
  noStroke();
  rectMode(CENTER);

  fill(0,0,255);
  rect(100,100,100,100);

  fill(255,0,0);
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(radians(bob));
  rect(0,0,100,100);
  popMatrix();

  if(keyPressed){
    if(key==' '){  //fire when spacebar is pressed
    bob += 10;
    }
  }
}







