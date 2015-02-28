
int cubeSize=34;
float noiseOffsetSpeed=.02;
float noiseOffset=0;

void setup(){
size(900,450,P3D);
frameRate(30);
stroke(100);
}

void draw(){
  background(128,128,128);
  
  spotLight(255, 255, 255, mouseX, mouseY, 225, 0, 0, -1, PI/2, .3);
  spotLight(55, 65, 70, mouseX, mouseY, 200, 0, 0, -1, PI/2, .1);
  
  noiseOffset+=noiseOffsetSpeed;
  
  
  for(int i=0; i<height/cubeSize; i++){
    pushMatrix();
    
    translate(0,cubeSize*i,0);
    for(int j=0; j<width/cubeSize; j++){
      pushMatrix();  
      
      float zOffset= noise(((float)j/6)+noiseOffset, ((float)i/6)+noiseOffset)*(cubeSize*2);
      translate(cubeSize*j,0,zOffset);
      box(cubeSize);
      
      popMatrix();
    }
    
    popMatrix();
  }
  
}


