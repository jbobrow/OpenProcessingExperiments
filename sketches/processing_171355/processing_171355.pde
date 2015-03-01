
PImage img, naruto1, naruto2;
float z = 0;
float noisex, noisey;
float Y;
float mouseC = 0;
 
void setup() {
  img = loadImage("leaf.png");
  naruto1 = loadImage("narutob4.jpg");
  naruto2 = loadImage("naruto.jpg");  
  size(720, 480,P3D);
  
}
 
void draw() {
  
  background(255); 
   
   
 
  
  translate(width/2,height);
  //rotateZ(z);
  float radius = 1.0;
  if (mouseC%3 == 2){
  rotateX(map(Y,0,480,0,PI));
  }
  
  Y += 0.5;
  
  if (mouseC%3 == 0) image (naruto1, -width/2, -height, 720, 480);
  
  else if (mouseC%3 == 1) {
      
      image(naruto2, -width/2, -height, 720, 480);
      
    }
  
  for (int z = 0; z < 150; z += 20){
    translate(0,0,z);
    pushMatrix();
  for (int deg =0; deg < 360*3; deg += 13) {
    float angle = radians(deg);
    float x = (cos(angle) * radius);
    float y = (sin(angle) * radius);
    
    noisex = noise(random(x),y,z);
    noisey = noise(x,random(y),z);
    
    if (mouseC%3 == 2){
     
     tint(0);
     image(img, x + noisex*15, y + noisey*15, 30, 30);
 
    } 
 
    radius = radius + 2;
    
  }
    popMatrix();
  }
  z += 0.01;
}
 
void mouseClicked(){
 
 mouseC += 1;
  
}


