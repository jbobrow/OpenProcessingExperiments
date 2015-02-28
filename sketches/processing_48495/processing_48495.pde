
//Rayniel Estrella | HW #9
//Nick Lally | Math, Programming, and Art

float x,y, angle;
int trailNum = 100;
int prevx[];
int prevy[];

void setup(){
  background(255);
  size (600,600);
  colorMode(HSB,360,100,100,100);
  noStroke();
  prevx = new int[trailNum];
  prevy = new int[trailNum];
}

void draw(){
  for(int i = 1;i < trailNum;i++){
    prevx[i-1] = prevx[i];
    prevy[i-1] = prevy[i];
  }
  prevx[trailNum -1] = mouseX;
  prevy[trailNum -1] = mouseY;
  for(int i = 0; i < trailNum; i++){
    fill(random(360),100,100);
    rect(prevx[i],prevy[i],i,i);
  }
  
    for(int i = 1;i < trailNum;i++){
    prevx[i-1] = prevx[i];
    prevy[i-1] = prevy[i];
  }
  prevx[trailNum -1] = mouseX;
  prevy[trailNum -1] = mouseY;
  for(int i = 0; i < trailNum; i++){
    fill(random(360));
    ellipse(prevx[i],prevy[i],100,100);
    vertex(x,y);
  }

for(int x = 0; x < width; x+=10){
  for(int y = 0; y < height; y+=6){
    float ellSize = sin(y*x+angle)*20;
    fill(71,49,99);
    ellipse(x,y,ellSize,ellSize);
  }
}
angle+=.1;
}

