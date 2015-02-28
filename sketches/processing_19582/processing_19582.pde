
void setup(){
  size(250,250);
  background(0);
  frameRate(5);
}

void draw(){
  noStroke();
  fill(0,0,0);
  rect(0,0,width,height);
  for (int i=0;i<40;i++){
    fill (random(25),random(255),random(255),random(255));
    rect(random(1,i),random(1,i),4,4);
    for (int h=0;h<10;h++){
    fill (random(255),random(255),random(255),random(255));
    rect(random(1,h),random(1,h),4,4);
  }
  for (int x=0;x<10;x++){
    fill (random(255),random(255),random(255),random(255));
    rect(random(1,250),random(1,250),x,x);
}
}
}

