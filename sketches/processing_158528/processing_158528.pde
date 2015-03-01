
int angle; 
int speed=1; 
int SIZE=400; 

void setup(){ 
  size(SIZE,SIZE,P3D); 
  angle=0; 
} 

void draw(){ 
  frameRate(speed+10); 
  background(0); 
  lights(); 
  angle++; 
  if(angle>360) angle =0; 
  camera(SIZE,0,0,0,SIZE,-SIZE,0,1,0); 
  translate(SIZE/2,SIZE/2,-SIZE/2); 
  rotateZ(radians(angle)); 
  rotateX(radians(angle)); 
  box(SIZE/4,SIZE/4,SIZE/4); 
  speed++; 
} 

