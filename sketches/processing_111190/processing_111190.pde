
//exploration for noise() function

size(400, 400);
background(5);
float p = .1;
float inc = 0.1;

for (int i=0; i<height; i+=4) {
  
  
  float n = noise(p)*100;
  stroke(random(256), 50);
  noFill();
  rect(n, i, 20, n*.5);
  
  for (int j = 0; j<width; j+=20) {
    rect(n+j*random(1), i, 20, n*.5);
  }

  p = p+inc;
}



