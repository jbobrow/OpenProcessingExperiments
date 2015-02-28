
float depth = 4000;
int p = 1;
void setup(){
   background(0); 
  size(800,600, P3D);
  noStroke();
}

void draw(){
  fill(15,109,59,p);
p++;
if(p >255){
  p  = 1;
}
float cameraY = height/2;
float cameraX = width/2;

translate(width/2, height/2, -depth/2);

rotateY(frameCount*PI/1000);

float fov = cameraX/float(width) * PI/2;
float cameraZ = cameraY/tan(fov/2.0);
float aspect = float(width)/float(height);

perspective(fov, aspect, cameraZ/2000.0, cameraZ*4000.0);

translate(width/10, height/10, depth/100);

for(int i = 0; i<2; i++){
  float r = random(100);
  directionalLight(200,300,240,100,100,500);
  directionalLight(100,210,240,100,100,100);
}
/*
for(int i=0; i<4; i++){
  
  float r = random(20);
  rotateX(frameCount*PI/1000);
*/  
  for(int x = -1; x<1;x++){
    for(int y = -2;y<2;y++){
      for(int z = -1;z<1;z++){

pushMatrix();
rotateY(PI*900/5);
box(20);
popMatrix();
      
translate(100, 100,100); 
rotate(radians(frameCount * 2)  % 36); 
translate(45,45,45);
box(10, 80, 20); 


pushMatrix();
rotateX(80);
translate(200*x,100*y,300*z);
translate(x++,z++,y++);
box(30,100,20);
popMatrix();

depth--;

if(depth == 0)

{
  depth++;
}
  }
}
  }
  }


