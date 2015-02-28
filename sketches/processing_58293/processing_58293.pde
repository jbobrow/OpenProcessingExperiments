
int trailNum = 20;

int prevx[];
int prevy[];
int prevz[];
int preva[];


void setup(){
  
  size(600,600);

  prevx = new int[trailNum];
  prevy = new int[trailNum];
  prevz = new int[trailNum];
  preva = new int[trailNum];
}

void draw(){
 background(255);
  for(int i = 1;i < trailNum; i++){
    prevx[i-1] = prevx[i];
    prevy[i-1] = prevy[i];
    prevz[i] = prevx[i];
    preva[i] = prevz[i-1];
  }

  prevx[trailNum-1] = mouseX;
  prevy[trailNum-1] = mouseY;
  prevz[trailNum-1] = mouseX;
  preva[trailNum-1] = mouseY;
  for(int i = 1; i< trailNum; i++){
   stroke(180);
   fill(252,219,255);
    quad(preva[i],(prevz[i]),prevx[i],(prevy[i]),(preva[i]),prevy[i],cos(preva[i]),prevz[i]);
    fill(191,255,220);
    quad(300,preva[i],101,40,preva[i],prevz[i],(prevy[i]),(prevz[i]));
    fill(201,250,255);
    quad(prevz[i],prevx[i],prevy[i],500,preva[i],prevz[i],300,300);
    fill(251,255,222);
    quad(preva[i],prevx[i],prevy[i],preva[i],prevz[i],prevx[i],600,600);

  }
}

