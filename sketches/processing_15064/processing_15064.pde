
final int W=100;
final int H=100;

final int D=3;

final int Skip = 50;

final int N=100000;

final float dt = 0.01;
final float dx = 0.01;
final float dy = 0.01;
final float rho = 0.1;
final float nu = 0.0001;

float[] px = new float[N];
float[] py = new float[N];
float[][][] u = new float[W][H][2];
float[][][] v = new float[W][H][2];

void setup(){
  size(W*D,H*D,P2D);

  // frameRate(1);

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
    px[i] =  random(W-1)+1;
    py[i] = random(H-1)+1;
  }
}

void draw(){
  background(0,0,0);

  //drawFlow();
  drawParticles();

  for(int i=1; i<Skip; i++){
    calc();
  }
}

void drawFlow(){
  stroke(255);

  for(int i=0; i<W; i++){
    for(int j=0; j<H; j++){
      point(i, u[i][j][0]);
    }
  }
}

void drawParticles(){
  stroke(255);

  int count = 0;

  for(int i=0; i<N; i++){
    if(px[i]>1 && px[i]<W-1 && py[i]>1 && py[i]<H-1){
      px[i] += u[int(px[i])][int(py[i])][0]*100;

      if(px[i]>1 && px[i]<W-1 && py[i]>1 && py[i]<H-1){
        py[i] += v[int(px[i])][int(py[i])][0]*100;
      }
    }
    else{
      if(count<N*0.05){
        px[i] = random(W);
        py[i] = random(H);
      }
      count++;
    }
    noStroke();
    fill(200,30);
    rect(px[i]*D,py[i]*D,2,2);
  }
}

void calc(){
  for(int i=1; i<W-1; i++){
    for(int j=1; j<H-1; j++){
      if(i==0 || i==W-1){
        u[i][j][1] = 0;
      }
      else if(j==0 || j==H-1){
        v[i][j][1] = 0;
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
  int x = constrain(mouseX/D,0,W-1);
  int y = constrain(mouseY/D,0,H-1);
  int px = constrain(pmouseX/D,0,W-1);
  int py = constrain(pmouseY/D,0,H-1);

  if(keyPressed){
    u[x][y][0] -= (x - px)*0.05;
    v[x][y][0] -= (y - py)*0.05;
  } 
  else {
    u[x][y][0] += (x - px)*0.05;
    v[x][y][0] += (y - py)*0.05;
  }
}


