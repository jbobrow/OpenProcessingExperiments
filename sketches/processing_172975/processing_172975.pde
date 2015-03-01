
void setup () {
  size(400, 400);
  smooth();
}

float radius = 100;
int a = 0;



void draw(){
  noStroke();
  colorMode(HSB, 360, 360, 360);
  background(360);
  
  a = second() * 6;
  if(a<0) {a += 360;}
  
  ellipseMode(CENTER);
  fill (a, 360, 360);
  ellipse(width/2, height/2, 210, 210);
  
  
  beginShape(TRIANGLE_FAN);
  vertex(width/2, height/2);
  for (float angle=0; angle<=360; angle+=6){
    float vx = width/2 - cos(radians(angle))*radius;
    float vy = height/2 - sin(radians(angle))*radius;
    vertex(vx, vy);
    fill(angle, 360, 360);
  }
  endShape();
  
  a = minute() * 6;
  if(a<0) {a += 360;}
  
  
  strokeWeight(10);
  stroke(a, 360, 360);
  noFill ();
  ellipse(width/2, height/2, 170, 170);
  strokeWeight(2);
  ellipse(width/2, height/2, 150, 150);
  
  noStroke();
    beginShape(TRIANGLE_FAN);
  vertex(width/2, height/2);
  for (float angle=0; angle<=360; angle+=30){
    float vx = width/2 - cos(radians(angle))*40;
    float vy = height/2 - sin(radians(angle))*40;
    vertex(vx, vy);
    fill(angle, 360, 360);
  }
  endShape();
  
  int h = hour();
  if(h > 12) { h -=12;}
  a = h * 30; 
  if(a<0) {a += 360;}
  
  noFill();
  stroke(a, 360, 360);
  ellipse(width/2, height/2, 100, 100);
  strokeWeight(13);
  ellipse(width/2, height/2, 70, 70);
  
  fill(360);
  noStroke();
  ellipse(width/2, height/2, 40, 40);
  

}
