
int count=0;
void setup(){
  size(400,400);
  background(0);
  frameRate(5);
}
void draw(){
  while(count<100){
    fill(random(235),random(235),random(235));
    ellipse(random(400),random(400),random(40),random(40));
    count=count+1;
    print(count);
  }
}
  


