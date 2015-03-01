
size(400, 400);
colorMode(HSB, 100);
background(99);
smooth();

for (int i=0; i < 25; i++) {
  fill(random(0, 25), 40, 99, 20); 
  strokeWeight(1);
  stroke(0, 0, 100, random(30));
  ellipse(random(400), random(150), 200, 200);
}

for (int i=0; i < 25; i++) {
  fill(random(78, 100), 40, 99, 15); 
  strokeWeight(1);
  stroke(0, 0, 100, random(50));
  ellipse(random(400), random(400), 150, 150);
}

for (int i=0; i < 45; i++) {
  fill(random(20, 65), 40, 99, 20); 
  strokeWeight(0.5);
  stroke(0, 0, 100, random(50));
  ellipse(random(400), random(200, 400), 100, 100);
}

for(int i=0 ; i < 30 ; i++) {
 stroke(0, 100, 100, 50);
 strokeWeight(0.2);
 line(width, height, width, height); 
}

rectMode(CENTER);
smooth();

int angle = 24;
int x = 5;

translate(width/2, width/2);

for(int i=0 ; i < 340 ; i++) {
  fill(i*4, 40, 99, 80 - i*2);
  
  pushMatrix();
  rotate(radians(i*angle));
  translate(i*x, 0);
  rect(0, 0, 30, 30);
  popMatrix();
  
}



