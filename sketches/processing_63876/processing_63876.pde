
float x=150;
float y=200;
float w =350;
float z = 200;
float p = 250;
float q = 150;


void setup() {
  size(500, 500);
}

void draw() {  

  background(110, 144, 227);
  fill(221, 240, 87);
  arc(250, 250, 300, 300, PI, TWO_PI);

  rect(210, 250, 90, 200);

  line(100, 250, 400, 250);

  fill(random(100, 255), 94, 206);
  ellipse(x, y, random(50), 50);


  fill(176, random(100, 255), 206);
  ellipse(w, z, random(50), 50);


  fill(176, 94, random(100, 255));
  ellipse(p, q, random(50), random(50));
}

void mousePressed() {
  y = y + 10; 
  z = z - 15;
  q = q + 20;
  x = x - 10;
  w = w - 15;
  p = p + 20;
  
  saveFrame("champignon.png");
}


