
//

 int sizeX = 512;
 int sizeY = 512;
 
int numberSqrtRooms = 16;
 
 float pi = 3.14;
 
 float scaler = 0.02;

 PVector charge;
 
void setup()
{
  size(sizeX, sizeY);
  background(0);
  
  charge = new PVector(0,0);
}

void mouseClicked(){
  
  background(0);
  
  charge = new PVector(mouseX/float(width),mouseY/float(height));
  
  for(float x = 0.0; x < 1.0; x+= 1/float(width)){
    for(float y = 0.0; y < 1.0; y+= 1/float(height)){
      
      PVector sumVect = new PVector(0,0);
      PVector probePos = new PVector(x,y);
      //For each Point calculate the Vector sum of every (mirrored) charge
      
      for(int i = -numberSqrtRooms/2; i < numberSqrtRooms/2; i++){
        for(int j = -numberSqrtRooms/2; j < numberSqrtRooms/2; j++){
            
            PVector mirroredPoint = new PVector(j+charge.x,i+charge.y);
            
            PVector deltaVect = new PVector(probePos.x-mirroredPoint.x,probePos.y-mirroredPoint.y);
            float d = sqrt(deltaVect.x*deltaVect.x+deltaVect.y*deltaVect.y);
            deltaVect.div(d*d*d);
            sumVect.x += deltaVect.x;
            sumVect.y += deltaVect.y;
            
        }
      }
      
      sumVect.normalize();
      stroke(sumVect.x*127+127,sumVect.y*127+127,0);
      point(x*width,y*width);
      //println(x,y);
      
      
    }
    println(x*100,"%");
  }
  
  
}
 
void draw() {
  
  
}
