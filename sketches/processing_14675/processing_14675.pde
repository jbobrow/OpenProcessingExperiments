
final int W = 200;
final int H = 200;

final int zoom = 3;

final int Speed = 13;

final float A = 8;

float[][][] u = new float[W][H][3];

void setup(){
  size(W*zoom, H*zoom, P3D);
  
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
  //background(160,200,125);
  background(0,0,0);
  noStroke();
  
  fill(255);
  text("Click or Drag anywhere!",50,50);
  
  translate(width/2-W, height/2-H);
  rotateX(PI/4);
  scale(zoom*0.7);

  for(int i=0; i<W-1; i++){
    for(int j=0; j<H-1; j++){
      fill(160,200,map(u[i][j][0],-255,255,-55,200) + 55);
 
      beginShape();
      vertex(i,j, u[i][j][0]*0.1);
      vertex(i+1,j, u[i+1][j][0]*0.1);
      vertex(i+1,j+1, u[i+1][j+1][0]*0.1);
      vertex(i,j+1, u[i][j+1][0]*0.1);
      endShape();
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
}

void mousePressed(){
  u[constrain(mouseX/zoom,0,W-1)][constrain(mouseY/zoom,0,H-1)][2] = 255;
}

void mouseDragged(){
  u[constrain(mouseX/zoom,0,W-1)][constrain(mouseY/zoom,0,H-1)][2] = 100;
}

