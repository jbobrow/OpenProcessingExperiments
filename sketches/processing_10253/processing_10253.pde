
int Num = 10;

float[][] jimmy = new float [ Num] [4];

void setup(){
  
  size (800,800,P3D);
  
  for(int i= 0; i<Num; i++){
    jimmy [i][0] = random (0,500); //x pos
    jimmy [i] [1] = random (0, 500); // y pos
    jimmy [i] [2] = -2;    //xVel
    jimmy [i] [3] = -1.32; // yVel
  }
  fill(255);
}

void draw(){
 fill (255,40);
rect (0,0,width,height); 
  //draw things
  
  for (int i=0; i<Num; i++){
    ellipse (jimmy[i][0], jimmy [i][1],10,10);
  }
  
  //gravity
     for (int i=0; i<Num; i++){
    jimmy[i][3] += 0.5;
  }
  
  //update
  
   for (int i=0; i<Num; i++){
    jimmy[i][0] += jimmy [i][2];
    jimmy[i][1] += jimmy [i][3];
  }
  
  //boundary
  
  //x direction
  for (int i=0; i<Num; i++) { 
    if (jimmy[i][0]>width || jimmy [i][0]<0) { 
    jimmy[i][2] = jimmy[i][2]*-1; 
    }
  
   // y direction
   if (jimmy[i][1]>height || jimmy [i][1]<0) { 
    jimmy[i][3] = jimmy[i][3]*-1;
   
    }
  
  }
  
}

