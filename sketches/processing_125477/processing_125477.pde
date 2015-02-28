
size(400,400);
background(190);

/*
noFill();
stroke(0,20);
strokeWeight(4);
*/

pushMatrix();
fill(0,20);
  noStroke();
for (int i=0; i<30; i++) {
  ellipse(i*10,300,pow(i-10,2),pow(i-10,2));
  
}
popMatrix();

noFill();
stroke(100);
strokeWeight(4);

pushMatrix();
for (int i=0; i<30; i++) {
  ellipse(200,i*20,pow(i,2),pow(i,2));
  rotate(radians(1));
  
}


for (int i=0; i<30; i++) {
  ellipse(300,i*5,pow(i,2),pow(i,2));
  rotate(radians(1));
  strokeWeight(1);
  stroke(100);
}
popMatrix();
translate(200, 200);

pushMatrix();
for (int i=0; i<10; i++) {
  float w = pow(sin(i/10.0)*15, 2);
  ellipse(0,i*5,w,w);
  stroke(190);
  rotate(radians(-5));
  strokeWeight(6);
}
popMatrix();

for (int i=0; i<30; i++) {
  float w = pow(sin(i/10.0)*10, 2);
  ellipse(100,-i*5,w,w);
  stroke(0);
  rotate(radians(-6));
  strokeWeight(2);
}



for (int i=0; i<10; i++) {
  float w = pow(sin(i/10.0)*30, 2);
  ellipse(150,-i*5,w,w);
  stroke(255,20);
  rotate(radians(-10));
  strokeWeight(3);
}

