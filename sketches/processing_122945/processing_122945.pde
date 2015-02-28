
// HW #9
// Written by Mark Choi
// Andrew ID: mschoi
// Ã�Â© Mark Choi December 2013 Pittsburgh, Pa 15213  All Rights reserved
// referenced: Ã�Â© takumi 
//
// Screensaver: It's Snowing!

int Length=75;
float[] arrayX = new float[Length];
float[] arrayY = new float[Length];
float[] arrayZ = new float[Length];
float[] arrayr = new float[Length];
 
void setup(){
  size(600,400,P3D); 
  background(0);
  noStroke();
  for(int i=0;i<Length;i++)
  {
    arrayX[i]=random(width);
    arrayY[i]=random(-height,0);
    arrayZ[i]=random(-height*2,height/2);
    arrayr[i]=random(3,10);
  }
}
 
void draw(){
  background(0);
  figure(arrayX, arrayY, arrayZ, arrayr);
}

void figure(float [] X, float [] Y, float [] Z, float [] r)
{
  lights();
  directionalLight(255, 255, 255, 0, height, 0);
  directionalLight(30, 30, 30, width, 0, 1);
  directionalLight(50, 50, 50, 0, -height, 0);
  
  for(int i=0;i<Length;i++)
  {
      pushMatrix();
      translate(X[i],Y[i],Z[i]);
      float zalpha = map(Z[i], 0, 200, 0, -height);
      float alpha = 255-zalpha;
      fill(200, 200, 200, alpha);
      sphere(r[i]);
      if(Y[i]>height+100)
        Y[i]=0;    
      else
        Y[i]+=random(1,3);
      popMatrix();
  }
}



