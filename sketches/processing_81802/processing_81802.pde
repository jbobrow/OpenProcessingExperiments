
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/15090*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

final int W=200;
final int H=200;
final int D=3;
final int Skip = 4;
final int N=100000;

final float dt = 0.001;
final float dx = 0.01;
final float dy = 0.01;
final float rho = 0.001;
final float nu = 0.01;

PImage cup;

int waitTime = -1;
int targetX = -1;
int targetY = -1;

float[] px = new float[N];
float[] py = new float[N];
float[][][] u = new float[W][H][2];
float[][][] v = new float[W][H][2];

void setup(){

  size(600,600,P2D);

  cup = loadImage("tea.png");

   frameRate(60);

  for(int i=0; i<W; i++){
    for(int j=0; j<H; j++){
      for(int h=0; h<2; h++){
        if(random(100)<5){
          u[i][j][h] = random(0.04)-0.02;
          v[i][j][h] =  random(0.04)-0.02;
        }else{
          u[i][j][h] = 0;
          v[i][j][h] =  0;
        }
      }
    }
  }

  for(int i=0; i<N; i++){
    px[i] = -10;
    py[i] = -10;
    //px[i] =  random(W-1)+1;
    //py[i] = random(H-1)+1;
  }
}

void draw(){
  background(0);

  if(keyPressed) mouseMoved();

  //drawFlow();
  drawParticles();
  
  image(cup,0,0);

  for(int i=0; i<Skip; i++){
    calc();
  }
  
  fill(255);
  text("drag is Spoon, space key is Sugar !", 20, 20);
  text("fps: " + int(frameRate), 20, H*D-20); 
}

void drawParticles(){
  stroke(255);

  int count = 0;

  for(int i=0; i<N; i++){
    if(px[i]>2 && px[i]<W-2 && py[i]>2 && py[i]<H-2){
      px[i] += u[int(px[i])][int(py[i])][0]*100;

      if(px[i]>2 && px[i]<W-2 && py[i]>2 && py[i]<H-2){
        py[i] += v[int(px[i])][int(py[i])][0]*100;
      }
    }else{
      /*
      if(count<N*0.05){
        px[i] = random(W);
        py[i] = random(H);
      }
      count++;
      */
      ;
    }
    
    noStroke();
    fill(220,30);
    rect(px[i]*D,py[i]*D,2,2);
  }
  
  for(int i=0; i<5; i++){
      int r = int(random(N));
      this.px[r] = random(W);
      this.py[r] = random(H);
    } 
  
  for(int i=0; i<1000; i++){
    px[int(random(N))] = -10;
  }
}

void calc(){
  for(int i=0; i<W; i++){
    for(int j=0; j<H; j++){
      if(i==0 || i==W-1){
        u[i][j][1] = u[i][j][0]/2;
        v[i][j][1] = v[i][j][0]/2;
      }
      else if(j==0 || j==H-1){
        u[i][j][1] = u[i][j][0]/2;
        v[i][j][1] = v[i][j][0]/2;
      }
      else{
        u[i][j][1] = u[i][j][0];
        u[i][j][1] += u[i][j][0]*-dt/(2*dx)*(u[i+1][j][0] - u[i-1][j][0]);
        u[i][j][1] += v[i][j][0]*-dt/(2*dy)*(u[i][j+1][0] - u[i][j-1][0]);
        u[i][j][1] += nu*dt/(dx*dx)*(u[i+1][j][0] - 2*u[i][j][0] + u[i-1][j][0]);
        u[i][j][1] += nu*dt/(dy*dy)*(u[i][j+1][0] - 2*u[i][j][0] + u[i][j-1][0]);

        v[i][j][1] = v[i][j][0];
        v[i][j][1] += u[i][j][0]*-dt/(2*dx)*(v[i+1][j][0] - v[i-1][j][0]);
        v[i][j][1] += v[i][j][0]*-dt/(2*dy)*(v[i][j+1][0] - v[i][j-1][0]);
        v[i][j][1] += nu*dt/(dx*dx)*(v[i+1][j][0] - 2*v[i][j][0] + v[i-1][j][0]);
        v[i][j][1] += nu*dt/(dy*dy)*(v[i][j+1][0] - 2*v[i][j][0] + v[i][j-1][0]);
      }
    }
  }

  for(int i=0; i<W; i++){
    for(int j=0; j<H; j++){
      if(abs(u[i][j][1])>dx/dt) u[i][j][1]=(u[i-1][j][1]+u[i+1][j][1] + u[i][j-1][1]+u[i][j+1][1])/4;

      u[i][j][0] = u[i][j][1];

      if(abs(v[i][j][1])>dy/dt) v[i][j][1]=(v[i-1][j][1]+v[i+1][j][1] + v[i][j-1][1]+v[i][j+1][1])/4;

      v[i][j][0] = v[i][j][1];
    }
  }
}

void mouseDragged(){
  mouseMoved();
}

void mouseMoved(){
  int x = constrain(mouseX/D,0,W-1);
  int y = constrain(mouseY/D,0,H-1);
  int px = constrain(pmouseX/D,0,W-1);
  int py = constrain(pmouseY/D,0,H-1);
  
  if(mousePressed){
    u[x][y][0] =+ (x - px)*0.1;
    v[x][y][0] =+ (y - py)*0.1;
  }
  
  if(keyPressed){
    for(int i=0; i<200; i++){
      int r = int(random(N));
      this.px[r] = x+random(4)-2;
      this.py[r] =  y+random(4)-2;
    }  
  }
}


