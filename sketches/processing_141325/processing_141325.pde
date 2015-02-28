
final int MAX = 64;
final float Gravity = 2.45;

float[] x  = new float[MAX];
float[] y  = new float[MAX];
float[] vx = new float[MAX];
float[] vy = new float[MAX];
color[] c  = new color[MAX];

int cnt = 0;

void setup(){
 size(800, 600);
 frameRate(60);
 for(int i=0;i<MAX;i++) y[i] = 600;
 background(0);
}

void draw(){
  noStroke();
  fill(#000000, 32);
  rect(0, 0, 800, 600);
  fill(#FFFFFF);
  for(int i=0;i<MAX;i++){
    x[i] += vx[i];
    y[i] += vy[i];
    vy[i] += Gravity;
    stroke(#0000FF);
    fill(c[i]);
    ellipse(x[i], y[i], 8, 8);
  }
  if(frameCount%10 == 0) fall(random(800), random(600));
}

void mousePressed(){
  fall(mouseX, mouseY);
}

void fall(float px, float py){
  
  for(int i=0;i<8;i++){
    x[cnt] = px;
    y[cnt] = py;
    c[cnt] = color(0, random(256), 128+random(127));
    if(int(random(2)) == 0){
      vx[cnt]= -random(16);
    }else{
      vx[cnt]= random(16);
    }
    vy[cnt] = - random(16);
    cnt ++;
    if(cnt+1 == MAX) cnt = 0;
  }
}


