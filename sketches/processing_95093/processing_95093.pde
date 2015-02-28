
int train=-500;
int sun=-200;


void setup(){
  size(600, 600);
  background(0);
  frameRate(5);
  strokeWeight(2);
}

void draw(){
  size(600, 600);
  background(255);
  frameRate(5);
  strokeWeight(2);
  
  train=train+1;
  train=max(0, train);
  body(100+train,100); 
  train=train+1;
  train=max(0, train); 
  wheels(100+train,100);
  road(200, 200);
  sun=sun+1;
  sun=min(0, sun);
  sun(10+sun, 10);
  
  
}

void body(int x, int y){
  fill(245, 7, 7);
  rect(50+x, 200, 200, 100);
  fill(255);
  rect(200+x, 200, 50, 50);
  rect(110+x, 240, 30, 60);
  rect(150+x, 210, 40, 40);
  rect(60+x, 210, 40, 40);
  fill(238, 255, 5);
  rect(230+x, 280, 20, 20);
  train=(train+1)%400;
}
void road(int x, int y){
  fill(0); 
  line(500, 300, 10, 300);
  line(500, 320, 10, 320);
  
}
void wheels(int x, int y){
  fill(0);
  ellipse(200+x, 290, 40, 40);
  ellipse(80+x, 290, 40, 40);
  train=(train+1)%410;
  }
 void sun(int x, int y){
    fill(255, 248, 10);
  translate(width/2, height/2);
  for (float i=0;i<200; i++){
    rotate(0.1);
  ellipse(i+x, 300, 10, 95);

  }}




