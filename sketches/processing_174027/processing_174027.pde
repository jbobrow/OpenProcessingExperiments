
void setup()
{
  frameRate(30);
  size(500, 500);
  smooth();
  rectMode(CENTER);
  noStroke();
}
float v1 = 0.0;
  float v2 = 0.0;
  float v3 = 0.0;
  float speed1 = 0.0;
  float speed2 = 0.0;
  float speed3 = 0.0;
  float wind = 0.0;
void draw()
{
  float center_x = width/2;
  float center_y = height/2;
  
  fill(255,20);
  rect(width/2,height/2,200,400);

  speed1=speed1+0.01;
  speed2=speed2+0.02;
  speed3=speed3+0.03;
  v1 = map(noise(speed1),0,1,0,100);
  v2 = map(noise(speed2),0,1,0,100);
  v3 = map(noise(speed3),0,1,0,100);


if(mousePressed == true){
  wind = 0.0;
} else {
  wind = 50.0;
}
  fill(250,250,0,50);
  beginShape();
  vertex(center_x-100,center_y+200);
  vertex(center_x+wind-v2,center_y-100-v3);
  vertex(center_x+100,center_y+200);
  endShape(CLOSE);

  fill(250,60,0,50);
  beginShape();
  vertex(center_x-100,center_y+200);
  vertex(center_x+wind-v1,center_y+50-v1);
  vertex(center_x+100,center_y+200);
  endShape(CLOSE);

  fill(255,0,0,50);
  beginShape();
  vertex(center_x-100,center_y+200);
  vertex(center_x+wind-v3,center_y+100-v2);
  vertex(center_x+100,center_y+200);
  endShape(CLOSE);
}
