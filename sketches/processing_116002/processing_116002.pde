
void setup(){
  size(600,500);
  background(255);
  smooth();
}

void draw(){
  fill(255,0,0);
  strokeWeight(5);
  rect(100,100,100,100);

  line(100,0,100,500);
  line(200,0,200,500);
  line(0,100,600,100);
  line(0,200,600,200);

  line(0,400,600,400);
  line(0,350,600,350);
  fill(#F5DD02);
  rect(100,350,100,50);

  line(450,0,450,500);
  fill(0);
  rect(450,200,150,150);
  
  fill(#0325FC);
  rect(0,400,400,400);
 }
  






