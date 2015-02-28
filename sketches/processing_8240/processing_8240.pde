
float n;
int nums = 960;
float sWave[] = new float[nums];
float f;

void setup(){
  size(960,600,P2D);

  n = 0;

  for(int i = 0; i < nums; i ++){
    n += 0.01;
    sWave[i] = n;
  }

  f = 0;
  background(255);
  
  mouseX = width/2;
  mouseY = height/2;
}

void draw(){
  background(255);
  smooth();
  stroke(0,50);
  strokeWeight(10);

  f += 0.01;

  for(int i = 0; i < nums; i +=2+mouseX/10){
    line(i, height/2 + sin(sWave[i]+f*2)*120, i+200-mouseY, height/2 + sin(sWave[i]+f)*170);
  }
}

