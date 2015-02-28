
int n = 30;
float[][] magnets = new float[n][n];
float[][] forces = new float[n][n];
int time = 0;
int scale = 2;

void setup(){
  //size(10*n-10,20*n-10);
  size(560,560);
  int sx = 280*scale;
  int sy = 280*scale;
  //size(sx,sy);
  background(255);
  strokeWeight(2*scale);
  for (int i=0;i<n;i++){
    for (int j=0;j<n;j++){
      magnets[i][j] = random(2*PI);
      forces[i][j] = 0.0;
    }
  }
}

void draw(){
    for (int i=0;i<n;i++){
    for (int j=0;j<n;j++){
      //forces[i][j] = 0.0;
      forces[i][j] = 2*(noise(0.1*i,0.1*j,0.01*time)-0.5);
    }
  }
  //background(255);
  fill(255,10);
  rect(0,0,width,height);
  for (int i=0;i<n;i++){
    for (int j=0;j<n;j++){
      pushMatrix();
      translate(10*scale*i,10*scale*j);
      rotate(magnets[i][j]);
      strokeWeight(2*scale);
      stroke(50*(abs(magnets[i][j]) % 3.12),20,200,255);
      line(10*scale,0,0,0);
      if (abs(magnets[i][j]) % 3.12 < 0.2) {
        stroke(100,50,255);
        line(10*scale,0,0,0);
      }
      
      
      //if (i>0 && i<9 && j>0 && j<9){
        if (i<9) {forces[i][j] -= magnets[i][j] - magnets[i+1][j];}
        if (i>0) {forces[i][j] -= magnets[i][j] - magnets[i-1][j];}
        if (j<9) {forces[i][j] -= magnets[i][j] - magnets[i][j+1];}
        if (j>0) {forces[i][j] -= magnets[i][j] - magnets[i][j-1];}
//        if (j==0) {forces[i][j] += 0.3*i*noise(time*0.01);}
        //if (j==0) {forces[i][j] += 4*noise(3*i+time*0.1)-1;}
      //}else{
        //magnets[i][j] += 0.1*random(-0.1,0.1);
        //magnets[i][j] += random(-1,1)/(1.1 + pow(mouseX - 10*i,2) + pow(mouseY - 10*j,2));
      //}
      magnets[i][j] += 0.3*forces[i][j];
      popMatrix();
    }
  }
  time++;
}

void mousePressed(){
    for (int i=0;i<n;i++){
    for (int j=0;j<n;j++){
      magnets[i][j] = random(-10,10);
    }
  }
}


