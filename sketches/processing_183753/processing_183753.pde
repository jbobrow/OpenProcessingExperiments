
void setup () { 
  background(255);
  size (400, 400);
}

void draw () {

  stroke(random(255), random(255), random(255));

  float distance_top = random(400);

  line(0, distance_top, 399, distance_top);


  line(distance_top, 0, distance_top, 399);
}

