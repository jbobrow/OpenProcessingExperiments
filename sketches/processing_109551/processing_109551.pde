
size(500, 500);
background(250);



for (float x = 5; x<width; x*=1.1) {
  for (int i=0; i<200; i++) {
    float y = random(1000);
    stroke(random(256), random(100), random(50));
    fill(random(150), random(50), random(25), random(150));
    rect(x ,y , random(50), random(50));
  }
}



