
final int W = 200;
final int H = 200;

final int Speed = 1;

final float A = 10;

float[][] u = new float[W][3];

void setup(){
  size(W-1, H, P3D);
  
  for(int i=0; i<W; i++){
    for(int j=0; j<3; j++){
      //u[i][j] = 100*sin(i/float(W)*PI);
      //u[i][j] = (i==W/2 && j==2)? 10 : 0;
      u[i][j] = 0;
    }
  }
}

void draw(){
  background(0);
  fill(255);
  
  translate(0, H/2);
  
  beginShape();
  
  for(int i=0; i<W; i++){
    vertex(i, u[i][0]);
  }
  
  vertex(W,H/2);
  vertex(0,H/2);
  endShape(CLOSE);
  
  for(int i=0; i<Speed; i++){
    calc();
  }
  
  fill(255);
  text("click or drag", 20, -H/2 + 20);
}

void calc(){
    float B = 1/A;
  
  for(int i=0; i<W; i++){
      if(i==W-1){
        u[i][0] = 0;
      }else if(i==0){
        u[i][0] = 0;
      }else{
        u[i][0] = B * ( -A*u[i][2] + 2*(A-1)*u[i][1] + u[i-1][1] + u[i+1][1] ) *0.99;
      }
  }
  
   for(int i=0; i<W; i++){
      u[i][2] = u[i][1];
      u[i][1] = u[i][0];
  }
}

void mousePressed(){
  u[constrain(mouseX,0,W-1)][2] = 10;
}

void mouseDragged(){
  u[constrain(mouseX,0,W-1)][2] = 2;
}

