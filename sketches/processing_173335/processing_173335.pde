
//lines excercise  15 experiemnt
background(200,50,90);
size (500,500);
float offset = 100.0;
float scaleVal = noise(200);
float angleInc = 2;
float angle = random(100);
for (float x = random(2,100); x <=width; x += 5) {
  float y = offset + (sin(angle) * scaleVal);
  fill (random(255),random(255),200, 80);
  strokeWeight(random(1,5));
    rect(random(500), random(500), random(200), height);
  angle += angleInc;
}




