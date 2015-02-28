
float c = 0, t;

void setup() {
  size(400, 400);
  background(68);
  frameRate(1000);
  noStroke();
  smooth();
}


void draw() {
  translate(width/2, height/2);
  rotate(c);
  //jugar con opciones
  t = random(1, 8);  
  fill(random(255), random(255), random(255));
  // jugar con opciones
  ellipse( 0 +c, 0 + c,0+ t,0 + t);

  c += 0.1;
}

