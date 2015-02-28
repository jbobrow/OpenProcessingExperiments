
float k;
int[] randomOrbit;
float[] orbitSpeed; 
int[] planetSize;
int[] planetColor;
void setup(){
  size(600,600,P3D);
  background(0);
  k=0;
  randomOrbit = new int[10];
  for (int k = 0; k<10;k++){
    int num = (int)random(200, 1000);
    randomOrbit[k] = num;
  }
  orbitSpeed = new float[10];
  for(int k = 0; k<10; k++){
   float num = random(3,15); 
   orbitSpeed[k] = num;
  }
  planetSize = new int[10];
  for(int k = 0; k<10; k++){
    int num = (int)random(500,1000);
    planetSize[k] = num;
  }
  planetColor = new int[100];
  for(int j = 0; j<30; j+=3){
   int num = (int)random(160,255);
   int index = j;
   planetColor[index] = num;
   num = (int)random(40,165);
   index = j+1;
   planetColor[index] = num;
   num = (int)random(0,40);
   index = j+2;
   planetColor[index] = num;
  
  }
}

void mousePressed(){
  for (int k = 0; k<10;k++){
    int num = (int)random(200, 1000);
    randomOrbit[k] = num;
  }
  orbitSpeed = new float[10];
  for(int k = 0; k<10; k++){
   float num = random(3,15); 
   orbitSpeed[k] = num;
  }
  planetSize = new int[10];
  for(int k = 0; k<10; k++){
    int num = (int)random(500,1000);
    planetSize[k] = num;
  }
  planetColor = new int[100];
  for(int j = 0; j<30; j+=3){
   int num = (int)random(160,255);
   int index = j;
   planetColor[index] = num;
   num = (int)random(40,165);
   index = j+1;
   planetColor[index] = num;
   num = (int)random(0,40);
   index = j+2;
   planetColor[index] = num;  
  }
}

void draw(){
  background(0);
  
  k+=  .1;
  
  translate(width/2,height/2,-3000);
  rotateX(.5);
  pushMatrix();
  rotateY(k/100);
  lights();
  noStroke();
  sphere(100);
  popMatrix();
  for(int i = 0; i<10; i++){
      pushMatrix();
      rotateY(orbitSpeed[i]*k*5/randomOrbit[i]);
      translate(0,0,randomOrbit[i]*5);
      fill(planetColor[i*3],planetColor[(i*3)+1],planetColor[(i*3)+2]);
      sphere((planetSize[i])/(randomOrbit[i])*20);
      popMatrix();
    }
    
  
  
  
  
  
  }
  


