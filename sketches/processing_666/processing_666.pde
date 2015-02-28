
float angle = 0.0;

void setup() {
  size(200, 200);
  smooth();
  noStroke();
  background(255);
}

void draw() {
  fill(255,10);//fade
  rect(0, 0, width, height);
  
  fill(255,0,0);
  angle = angle+0.02 ; //speed
  translate(100, 100);
  rotate(angle);
  rect(-30, -30, 1, 20);
  

  
  //stroke(255,0,0);
  //line(-50, -50, cos(180)*20, sin(180)*20 );

}

