
int x=0;

void setup() {
  size(500, 500);
  background(255);
}

int recta =5;

void draw() {
  
  pushMatrix();
  translate(260, 260);
  stroke(255);
  rotate(radians(frameCount * 10  % 360));
   fill(random(0,100),random(0,100),random(0,100),300);
  ellipse(100, 100, 30, 30);
  popMatrix();

 pushMatrix();
  translate(270, 270);
  rotate(radians(frameCount * 2  % 360));
   fill(random(100,200),random(100,200),random(100,200),300);
  ellipse(100, 100, 30, 30);
  popMatrix();

 pushMatrix();
  translate(280, 280);
  rotate(radians(frameCount * 2  % 360));
  fill(random(100,200),random(100,200),random(100,200),500);
  ellipse(150, 150, 50, 50);
  popMatrix();


  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount * 10  % 360));
  fill(random(0,100),random(0,100),random(0,100),500);
  ellipse(150, 150, 50, 50);
  popMatrix();
 

}



