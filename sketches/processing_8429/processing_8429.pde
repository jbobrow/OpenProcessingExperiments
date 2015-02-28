

float y = 90.0;
float speed = 0.1;
float radius = 10.0;
int direction = 1;


void setup(){
  size(500, 500);
  smooth();
}

void draw(){
  //background(0);
  float s = map(second(), 0, 60, 0, 250);
  //stroke(random(255), random(255), random(255), 255);
  stroke(255,100);
  strokeWeight(10);
  noFill();
  ellipse(250, 250, 2*s, 2*s);
  
  float mi = minute();
  float m = map(minute(), 0, 60, 0, 500);
  stroke(128);
  strokeWeight(2);
  for(int i = 8; i <= m; i += m/mi){
    line( i, 0, i, height);
  }
  float ho = hour();
  float h = map(hour(), 0, 24, width, 0);
  noStroke();
  fill(0, 12);
  rect(0, 0, width, height);  
  fill(random(255), random(255), random(255), 180);
    //randomSeed(0);
    for(float r = h; r < 500 ; r += (width-h)/ho){
    ellipse(r, y, radius, radius);
    
    y += speed * direction;
    if ((y > height-radius) || (y < radius)) {
      direction = -direction;
    }
   }
   //println(h);
}













