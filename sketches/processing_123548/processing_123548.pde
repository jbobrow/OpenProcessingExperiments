
void setup() {
  size(400, 400);
  frameRate(10);
}

void draw() {
  background(155, 0, 220);
  translate(200, 200);

  for (int j=0;j<1000;j++) {
    stroke(255, random(55, 255));
    strokeWeight(4);
    point(random(-200, 200), random(-200, 200));
  }
  
 flake();
 
 translate(100,100);
 scale(.5,.5);
 flake();
 
 translate(73,-403);
 scale(.9,.9);
 flake();
  
 translate(-696,-126);
 scale(.95,.95);
 flake();
 
}

void flake(){
  //rotate(PI/6);
  int sections=6;
  stroke(0);

  for (int i=0;i<sections;i++) {
    line(0, 0, 100, 0);
    ellipse(70, 10, 10, 10);
    ellipse(70, -10, 10, 10);
    rotate(2*PI/sections);
  }
  
  fill(random(255),0,0); 
  textSize(76); 
  text("Happy Winter!", 66, 807);

 strokeWeight(1);
 
 stroke(255, 255, 255);
  
{ 
  for (int i = 0; i < 10; i = i+1)
    for (int j=0; j<10; j=j+1)
{      point(random(i*40, (i+1)*40), random(height));
}
 
}
}
