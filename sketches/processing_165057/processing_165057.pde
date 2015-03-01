
float lightX=0, lightY=0, step =10;
boolean goRight = true;
void setup(){
  size(600,600);
}

float dotProduct
(float x1, float y1, float z1, float x2, float y2, float z2){
 return x1*x2 + y1*y2 + z1*z2; 
  
}

void draw(){
  background(0);
  int gridX = 20;
  int gridY = 20;
  
  float nX=0, nY=0, nZ=1; // normal vector
  if(goRight){
      if(lightX<width)
        lightX+=step;
      else{
         lightY+=step;
         goRight=false; 
      }
    }
    else{
      if(lightX>0)
         lightX-=step;
      else{
         lightY+=step;
         goRight=true; 
      }
    }
  for(int y=0;y<height;y+=gridY){
   for(int x=0;x<width;x+=gridX){
    
     //compute light vector
     float lX = lightX - x;
     float lY = lightY - y;
     float lZ = 100;
     
     //normalize light vector
     float lMag = sqrt(lX*lX + lY*lY + lZ*lZ);
     lX/=lMag;
     lY/=lMag;
     lZ/=lMag;
      
      //compute dot product and cosine angle
      float cosine = dotProduct(nX, nY, nZ, lX, lY, lZ);
      
      //set brightness
      fill(cosine * 255, cosine * 255,0);
      rect(x, y, gridX, gridY); 
    
    
    
   } 
  }
  
  
}
