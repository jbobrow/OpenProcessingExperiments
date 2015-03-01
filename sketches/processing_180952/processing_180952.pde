
float an=0;

void setup(){
  size(500,500);
  smooth();background(0);
}

void draw(){
  fill(0,5); noStroke();rect(0,0,width,height);stroke(0,255,0);an+=0.01;
  line(width/2,height/2, 250+cos(an)*200, 250+sin(an)*200);
  if(random(10)<1){
    fill(100,255,100);
    float r=random(10,200);
    ellipse(250+cos(an)*r,250+sin(an)*r,4,4);
  }
  noFill();
  stroke(0,255,0);
  ellipse(250,250,100,100);
  ellipse(250,250,200,200);
  ellipse(250,250,300,300);
  line(250,0,250,500);
  line(0,255,500,255);
}
