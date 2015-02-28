



// 2d Array Code
// 1. Declare

int HOR = 35;
int VER = 35;

float[][][] jimmy = new float[HOR][VER][3];

// 2. Setup

void setup(){
  
  //size of applet
  size(800,600,P3D);
  
  //initial condition
  for(int i=0; i<HOR; i++){
    for(int j=0; j<VER; j++){
    
      jimmy[i][j][0] = (i * 16) + 100;
      jimmy[i][j][1] = (j * 16) + 20;
    
      
      if(i==0){
      
      }
    
    }
  }
  
   rectMode(CENTER);
}


// 3. Draw

void draw(){
  
  background(255);
  fill(0);
  stroke(0);
  camera(800,800,500,300,300,0,1,1,0);
  
  // draw nodes
  for(int i=0; i<HOR; i++){
    for(int j=0; j<VER; j++){
      
      pushMatrix();
       
        translate(jimmy[i][j][0], jimmy[i][j][1],jimmy[i][j][2]);
        fill(jimmy[i][j][2]);
        rect(0,0,15,15);

      popMatrix();
    }
  }
  
  // draw lines
  for(int i=0; i<HOR-1; i++){
    for(int j=0; j<VER-1; j++){
      
      line(jimmy[i][j][0], jimmy[i][j][1], jimmy[i][j][2], jimmy[i+1][j][0], jimmy[i+1][j][1], jimmy[i+1][j][2]);
      line(jimmy[i][j][0], jimmy[i][j][1], jimmy[i][j][2], jimmy[i][j+1][0], jimmy[i][j+1][1], jimmy[i][j+1][2]);
    }
  }
  
  
    // modify stuff
  for(int i=1; i<HOR-1; i++){
    for(int j=1; j<VER-1; j++){
      
      jimmy[i][j][2] = (jimmy[i+1][j][2] + jimmy[i][j+1][2] + jimmy[i-1][j][2] + jimmy[i][j-1][2]) / 4;
      
    
    }
  }
  for(int i=1; i<HOR-1; i++){
    for(int j=1; j<VER-1; j++){
  
  jimmy[i][j][1] = mouseX;
  jimmy[i][j][2] = mouseY;
   
    }
}
}
  

