
int x = 0;
int y = 0;


void setup(){

size(displayWidth, displayHeight, P3D);
fill(100);
}

void draw(){
  
  background(255);
  
  for(int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
    pushMatrix();
      translate(i*width/10 + width/10/2,
                j*height/10 + height/10/2);
      
      rotateX(millis() * 0.0005);
      rotateY(millis() * 0.0005);
      box(50);
    popMatrix();
  }
  }
  pushMatrix();
  
  popMatrix();
}
