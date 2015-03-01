
void setup(){
  background(255,248,240);
  size(400,400);
  frameRate(200);
}

  int o=0;
  int speed=3;
  float n=random(255);
  float a=random(400);
  int f=0;
//clock
void draw(){
  int s=second();
  int m=millis();
  float n=random(255);
  float a=random(400);
  //background(s,n,255);
  for(int x=0;x<400;x=x+50){
    for(int y=0;y<500;y=y+5){
      noStroke();
      fill(255,(m%300),n,5);rect(a,0,(m%600),y);
      o=o+speed;
      if(s>3){
        fill(255,0,0);textSize(20);text("love me", 70,100);
      }
      if(s>6){
        text("love me",70,200);
      }
      if(f>200){
        background(255);
      }
    }
  }
}

