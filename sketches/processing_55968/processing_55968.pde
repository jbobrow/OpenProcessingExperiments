

float angle;
float jitter;

float r = 100;
float b = 40;
float g = 90;                                                                              

void setup() {
  size (400, 400);
  background (0);
  smooth();
  noStroke();
}

void draw() {

  background(0);
  fill (r, b, g);
  rectMode(CENTER);
  rect(200, 200, 50, 50);
 
  
    r=random(1,255);
    b=random(1,255);
    g=random(1,255);
    ellipse(random(1,400), random(1,400), 20, 20);
       ellipse(random(1,400), random(1,400), 20, 20);
        ellipse(random(1,400), random(1,400), 20, 20);
          ellipse(random(1,400), random(1,400), 20, 20);
          ellipse(random(1,400), random(1,400), 20, 20);
          ellipse(random(1,400), random(1,400), 20, 20);
           if (second() % 2 == 0) {  
    jitter = random(-0.05, 0.05);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  rect(0, 0, 50, 50);   
}
       
