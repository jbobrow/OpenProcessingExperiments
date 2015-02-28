
class Origin{
  int x,y;
  float[][] water;
  int ii;
  float a,v,f;
  int g;
  Origin(){
  }
  void getloc(int x,int y,float[][] water,float a,float f,float v,int g){
   this.x=x;
    this.y=y;
    this.water=water;
    ii=0;
    this.f=f;
    this.a=a;
    this.v=v;
    this.g=g;
  }
 void run(){
    float dis,pdis;
    float t,pt;
    t=ii/frameRate;
    dis=v*t;
    for(int i=0;i<width+g;i+=g)
      for(int j=0;j<height+g;j+=g)
      {
        pdis=sqrt(pow(i-x,2)+pow(j-y,2));
        if(pdis<=dis){
          pt=t-pdis/v;
          water[i][j]+=A(pt)*org_run(pt);
        }
      }
      ii++;
  }
  float org_run(float t){
    float ff;
    ff=f-t*0.04;
    return sin(2*PI*ff*t);
  }
  float A(float t){
    return (a-t*5>0)? a-t*5:0;
  }
}

          
    
    

