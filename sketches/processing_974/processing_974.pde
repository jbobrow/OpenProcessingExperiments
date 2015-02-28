
float sigmoid(float v, float vmax)
{
  float vmid=vmax/2;
  float i=vmax/3;
  int j=80;
  float r=100/( pow(j,((vmid+i/2-v)/i))) ;
  return r;
}//sigmoid

float inverse(float v,float vmax)
{
   float i=v/vmax;
   float r=1+pow((1-i),3)*-1; 
   return r;
}//inverse

