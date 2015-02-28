
color[] pallette = {#514264,#527E8E,#8DB0A7,#989A55,#255C3F,#3C535E,#252D2A,#F9D882,#3F422E,#261901};

void setup(){
  size(800,500);
  colorMode(RGB,100);
  background(0);
  for(int i = 0;i<1000;i++){
    bubble();
  }
}

void bubble(){
  float x = random(width);
  float y = random(height);
  float r = random(50,100);
  float off = random(2,10);
  for(float i = r;i>r/2;i-=off){
    float ran = random(1);
    if(ran < .5){
     int k = int(random(pallette.length));
     fill(pallette[k]);
    }else if((ran > .5) && (ran < .85)){
      fill(0,0,0);
    }else{
      fill(100,100,100);
    }
    noStroke();
    ellipse(x,y,i,i);
  }
}
