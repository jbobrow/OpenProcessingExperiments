
float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  x = r * cos(angle); 
  y = r * sin(angle);

  translate(width/2, height/2); 
  rotate(r); 

  noStroke();
  fill(random(10, 255), random(200, 255), 20, 40);
  ellipse(y/10, 0, y/10, y);

  fill(255, 100);
  ellipse(x/10, 0, x/20, 900);

  fill(100, random(200, 255), random(150, 180), 30);
  ellipse(0, 0, x/2, y/2);


  noFill();
  strokeWeight(1);
  ellipse(x/10, 0, x/10, 800);

  strokeWeight(1);
  stroke(255, 80);
  line(0, 0, x*2, y/2); 

  strokeWeight(3);
  stroke(255, 50);
  line(0, 0, x, y); 


  angle = angle + 0.5;
  r = r - diff;

  if ( r == 300 || r == 550) { 
    diff =  diff * -1;
  }
}
