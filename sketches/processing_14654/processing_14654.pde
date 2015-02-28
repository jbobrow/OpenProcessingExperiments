
final int W = 200;
final int H = 200;

final int Speed = 1;

final float A = 10;

float[][][] u = new float[W][H][3];

void setup(){
  size(W, H, P3D);
  
  //frameRate(1);
  
  for(int i=0; i<W; i++){
    for(int j=0; j<H; j++){
      for(int k=0; k<3; k++){
        //u[i][j][k] = 100*sin(i/float(W)*PI)*sin(j/float(H)*PI);
        
        //u[i][j][k] = (i==W/2 && j==H/2 && k==2)? 255 : 0;
        
        u[i][j][k] = 0;
      }
    }
  }
  
  colorMode(HSB, 255);
}

void draw(){
  background(0);

  for(int i=0; i<W; i++){
    for(int j=0; j<H; j++){
      stroke(160,200,map(u[i][j][0],-255,255,-55,200) + 55);
      point(i,j);
    }
  }
  
  for(int i=0; i<Speed; i++){
    calc();
  }
}

void calc(){
    float B = 1/A;
  
  for(int i=0; i<W; i++){
    for(int j=0; j<H; j++){
      if(i==W-1 || j==H-1){
        u[i][j][0] = 0;
      }else if(i==0 || j==0){
        u[i][j][0] = 0;
      }else{
        u[i][j][0] = B * ( -A*u[i][j][2] + 2*(A-2)*u[i][j][1] + u[i-1][j][1] + u[i+1][j][1] + u[i][j-1][1] + u[i][j+1][1]) * 0.99;
      }
    }
  }
  
   for(int i=0; i<W; i++){
     for(int j=0; j<H; j++){
        u[i][j][2] = u[i][j][1];
        u[i][j][1] = u[i][j][0];
     }
  }
  
  fill(255);
  text("click or drag !", 20,20);
}

void mousePressed(){
  u[constrain(mouseX,0,W-1)][constrain(mouseY,0,H-1)][2] = 255;
}

void mouseDragged(){
  u[constrain(mouseX,0,W-1)][constrain(mouseY,0,H-1)][2] = 100;
}

