
int i;

size(400, 400);
background(0);
colorMode(RGB, 400);
noStroke();


for (i=0; i < 200; i++) {

  if (i > 100 && i < 200 ) {
    fill(0, random(400), random(400), random(400) );
  } else {
    fill(random(400), 0, 0, random(400) );
  }
   
  float diameter;

  diameter = random(20, 80);
  ellipse(random(400), random(400), diameter, diameter);
}


