
//Rayniel Estrella | HW7
//Nick Lally | Math, Programming, and Art

int trailNum = 100;
int prevx[];
int prevy[];
float x,y, angle;

void setup(){
    background(0);
  size (600,600);
  colorMode(HSB,360,100,100,100);
  noStroke();
  prevx = new int[trailNum];
  prevy = new int[trailNum];
  
}

void draw(){
for(int x = 0; x < width; x+=20){
  for(int y = 0; y < height; y+=10){
    float ellSize = sin(y*x+angle)*10;
    fill(random(255));
    rect(x,y,ellSize,ellSize);
    
    for(int i = 1;i < trailNum;i++){
    prevx[i-1] = prevx[i];
    prevy[i-1] = prevy[i];
  }
  prevx[trailNum -1] = mouseX;
  prevy[trailNum -1] = mouseY;
  for(int i = 0; i < trailNum; i++){
    fill(random(360),100,100,100);
    //triangle(angle,angle,x,y,i,i);
    //rect(mouseX,mouseY,10,10);
    ellipse(prevx[i],prevy[i],i,i);
  }
}
  }
}


