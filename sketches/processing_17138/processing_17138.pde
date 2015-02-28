

class estel
{
float xIni,yIni,xNext,yNext,centerX,centerY,rad,cl;
int iniT;
float[] ctrlX = new float[10];
float[] ctrlY = new float[10];

estel(float X, float Y, float R, float CL )
{
  iniT=frameCount;
  centerX=X;
  centerY=Y;
  rad=R;
  cl=CL; // cicles
   float aux;
  for(int i=0; i<10; i=i+2)
  {
   aux=rad+random(0,rad/2); 
   ctrlX[i]=centerX+aux*(cos((PI/8)+i*PI/5));
   ctrlY[i]=centerY+aux*(sin((PI/8)+i*PI/5));
  // ellipse(ctrlX[i],ctrlY[i],10,10);
  }
  
  
  for(int i=1; i<10; i=i+2)
  {
   aux=rad+random(-3*rad/4,-rad/4); 
   ctrlX[i]=centerX+aux*(cos((PI/8)+i*PI/5));
   ctrlY[i]=centerY+aux*(sin((PI/8)+i*PI/5));
//   ellipse(ctrlX[i],ctrlY[i],10,10);
  }
  
  xIni=ctrlX[0];
  yIni=ctrlY[0];

}


void updatEstel()
{
 float k, shrink;
 int T;
 T=frameCount-iniT;
 k=round(T/10);
 shrink=1-k/cl;
 
 if(shrink>0)
 {
  xNext=centerX+shrink*(ctrlX[T%10]-centerX);
  yNext=centerY+shrink*(ctrlY[T%10]-centerY);
  line(xIni,yIni,xNext,yNext);
  
  xIni=xNext;
  yIni=yNext;
 }

}


}

