
int rad=105;
float[] posX = new float[rad];
float[] posY = new float[rad];
float[] posZ = new float[rad];
float[] lengr = new float[rad];
  
void setup(){
  size(600,600,P3D);
  noStroke();
  
  for(int i=0;i<rad;i++)
  {
    posX[i]=random(width);
    posY[i]=random(height);
    posZ[i]=random(-height,height);
    lengr[i]=random(20,40);
  }
}
  
void draw(){
  background(50,50,100);
  figure(posX,posY, posZ, lengr);
}
 
void figure(float [] X, float [] Y, float [] Z, float [] r)
{
  
  lights();
  directionalLight(255, 255, 255, 0, height, 0);
  
   
  for(int i=0;i<rad;i++)
  {
      pushMatrix();
      translate(X[i],Y[i],Z[i]);
      fill(random(170,250),random(150,255),random(90,250));
      sphere(r[i]);
       if(Y[i]>height)
        Y[i]=0;   
      else
        Y[i]+=random(5);
     
      popMatrix();
  }
}
