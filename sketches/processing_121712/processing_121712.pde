
int noofparticles=5;
float omega=1.5;

PVector[] Data;
Bspline_class newbspline;

Position gbest;
float c1=1;
float c2=1.5;
int iter=1;
Particlenew[] particles;

int n=6;
int k=3;
int m=7;

void setup()
{
  size(500,400);
  smooth();
  frameRate(300);
  particles= new Particlenew[noofparticles];
 


    Data = new PVector[m];
//    float r=100;
//    for(int i =0;  i<=360 ;i++)
//    Data[i] = new PVector( 200+r*cos(i*PI/180),200+ r*sin(i*PI/180));
  Data[0]=new PVector(100,50);
  Data[1]=new PVector(100,150);
  Data[2]=new PVector(200,180);
  Data[3]=new PVector(280,250);
  Data[4]=new PVector(340,290);
  Data[5]=new PVector(390,210);
  Data[6]=new PVector(350,70);
  gbest =new Position(n,k,Data[0],Data[Data.length-1]);
   
  newbspline=new Bspline_class(n,k);  
  for(int i=0;i<noofparticles;i++)
    {
      particles[i]=new Particlenew(n,k,Data[0],Data[Data.length-1]);
    }
  for(int i=0;i<noofparticles;i++)
  {
    if(error(particles[i].pbest) <error(gbest))
    gbest.clone(particles[i].pbest);
  }
 
//   for(int i=0;i<noofparticles;i++)
//    {
//      for(int j=1;j<=(particles[i].position.cps.length-1)/2;j++)
//     {
//       particles[i].position.cps[j]=Data[j].get();
//       particles[i].position.cps[particles[i].position.cps.length-1-j]=Data[Data.length-1-j].get();
//     }
//     
//    }
 
  
}

void draw()
{  
  background(255);
   
  
   if( iter<=20000)
  {
    newbspline.definewith_cp(gbest.cps);
    newbspline.change_knots(gbest.knots);
    drawparticles();
    
    for(int i=0;i<noofparticles;i++)
    {
      particles[i].velocity.update_velocity(omega,c1,c2,gbest,particles[i].pbest,particles[i].position);
      particles[i].position.update_position(particles[i].velocity);
    }
    
     for(int i=0;i<noofparticles;i++)
    {
      if(error(particles[i].position)<error(particles[i].pbest))
      particles[i].pbest.clone(particles[i].position);
      
      if(error(particles[i].pbest)<error(gbest))
      gbest.clone(particles[i].pbest);
      
    }
    println(gbest.knots);
    println(error(gbest));
if(gbest.knots[k]<0.1)
gbest.cps[1]=gbest.cps[0];
if(gbest.knots[n]>0.99)
gbest.cps[gbest.cps.length-2]=gbest.cps[gbest.cps.length-1];
    iter++;
  }
 
}

void drawparticles()
{
  for(int i=0;i<m;i++)
  {
    ellipse(Data[i].x,Data[i].y,1,1);
  }
  for(int i=0;i<gbest.cps.length;i++)
  ellipse(gbest.cps[i].x,gbest.cps[i].y,5,5);

   for(float i=0;i<1-0.01;i=i+0.01)
  {
    PVector pnt1=newbspline.get_point(i);
    point(pnt1.x,pnt1.y);
  }


}



float error(Position pos)
{
  
  newbspline.definewith_cp(pos.cps);
  newbspline.change_knots(pos.knots);
  float Q=0; int count=0;
  for(float i=0; i<=1;i=i+(1/((float)m-1)))
  {
    PVector pt= newbspline.get_point(i);
    //Q=Q+dist(Data[count].x,Data[count].y,pt.x,pt.y);
    Q=Q+pow(Data[count].x-pt.x,2)+pow(Data[count].y-pt.y,2);
    count++;
  }
  Q=log(Q)/log(exp(1));
  Q=Q*m;
  Q=Q+(log(m)/log(exp(1)))*(k+n+1);
  //Q=Q+2*(k+n+1);
  return Q;
}






public class Bspline_class
{ 
   private int n=4;  //no of control points= n
   private int k=3;  //order of BSpline=k  NOTE: Degree p=k-1
   PVector[] cpal;     //arraylist of control points
   float[] knots;
    Bspline_class(int ncp,int ord)
   {
     n=ncp;
     k=ord;
     knots=new float[n+k+1];
     cpal= new PVector[n+1];
     // Knots definition
     for(int i=0;i<k;i++)
     {
       knots[i]=0;
       knots[n+k-i]=1;
     }
     for(int i=k;i<=n;i++)
     { 
       float N=(float) n;
       float K=(float) k;
       float I=(float) i;
       knots[i]= (1/(N-K+2)) *(I-K+1);
     }
     //
     
   } 
   
   
   public void definewith_cp(PVector [] arr)
   {
     
     for(int i=0;i<arr.length;i++)
     {
       
       cpal[i]= arr[i].get();
     }
     
   }
   
   public PVector get_point(float val)
   {
     int knotnode=0;
     for(int i=k;i<=n+1;i++)
     if(val< knots[i] && val>=knots[i-1])
     knotnode=i-1;
     if(val==1)
     knotnode=n;
     //println(knotnode);
     PVector [][] P= new PVector [n+1][k];
     //println(cpal);
     for(int i=0;i<n+1;i++)
     {
       P[i][0]=cpal[i].get();//??????????
       //println(P[i][0]+"   OK");
     }
     
     for(int j=1;j<k;j++)
     for(int i=knotnode-k+j+1;i<=knotnode;i++)
     {
       float rij=(val - knots[i])/(knots[i+k-j]-knots[i]);
       PVector temp1,temp2;
       temp1=P[i-1][j-1].get();
       temp2=P[i][j-1].get();
       temp1.mult(1-rij);
       temp2.mult(rij);
       temp1.add(temp2);
       P[i][j]=temp1.get();
       
       //println(P[i][j]+"   "+i+"  "+j); 
     }
     //cpal.clear();
     return P[knotnode][k-1];
   }
   
   void change_knots(float[] arr)
   {
     for(int i=k;i<=n;i++)
     knots[i]=arr[i];
   }
  
}
public class Particlenew
{
  Position position;
  Velocity velocity;
  Position pbest;
  
  Particlenew(int ncp, int k,PVector start,PVector end)
  {
    position=new Position(ncp,k,start,end);
    velocity= new Velocity(ncp,k);
    pbest=new Position(ncp,k,start,end);
  }
}
public class Position
{
  PVector [] cps;
  float [] knots;
  int n;
  int k;
  
  Position(int ncp, int k,PVector start, PVector end)
  {
    this.n=ncp;
    this.k=k;  
    cps= new PVector[n+1];
    knots = new float [n+k+1];
    cps[0]=start.get();
    cps[n]=end.get();
    initialize_position();
  }
  
  private void initialize_position()
  {
    for(int i=1;i<cps.length-1;i++)
    {
      cps[i]=new PVector(random(width),random(height),0);
    }
    
    for(int i=0;i<k;i++)
    {
      knots[i]=0;
      knots[n+k-i]=1;
    }
    for(int i=k;i<=n;i++)
    {
      float N=(float) n;
      float K=(float) k;
      float I=(float) i;
      knots[i]= (1/(N-K+2)) *(I-K+1);
        //knots[i]=random(0,1);
        //sort_knots();
    }
    //println(knots[k]);
   }
   
   public void update_position(Velocity velocity)
   {
      for(int i=1;i<cps.length-1;i++)
      {
         cps[i].x=cps[i].x+velocity.cpsv[i-1].x;
         cps[i].y=cps[i].y+velocity.cpsv[i-1].y;
      }
      
//      for(int i=k;i<=n;i++)
//      {
//         knots[i]=knots[i]+velocity.knotsv[i-k];
//      }
//      
//      sort_knots();
   }
   
   private void sort_knots()
   {
      for(int i=k;i<n;i++)
      for(int j=i+1;j<=n;j++)
      {
        if(knots[i]>knots[j])
        {
          float temp=knots[j];
          knots[j]=knots[i];
          knots[i]=temp;
        }
      }       
      rectify_knots();
    }
   private void rectify_knots()
   {
     for(int i=k;i<=n;i++)
     {
       if(knots[i]<0.500)
       knots[i]=0.5;
       else if(knots[i]>0.95)
       knots[i]=0.95;
     }
   }
   public void clone(Position pos)
   {
     for(int i=0;i<pos.cps.length;i++)
     this.cps[i]=pos.cps[i].get();
     for(int i=pos.k;i<=pos.n;i++)
     this.knots[i]=pos.knots[i];
   }
}
public class Velocity
{
  PVector [] cpsv;
  float [] knotsv;
  int n;
  int k;
  float maximumvel=1.6;
  Velocity(int ncp,int k)
  {
    this.n=ncp;
    this.k=k;
    cpsv=new PVector[n-1];
    knotsv=new float[n-k+1];
    initialize_velocity();
  }
  
  private void initialize_velocity()
  {
    for(int i=0;i<cpsv.length;i++)
    {
      cpsv[i]=new PVector(0,0,0);
    }
    for(int i=0;i<knotsv.length ;i++)
    {
      knotsv[i]=0;
    }
  }
  public void update_velocity(float omega,float c1,float c2,Position gbest, Position pbest, Position pos)
    {
      for(int i=0;i<cpsv.length;i++)
      {
        cpsv[i].x=omega*cpsv[i].x+c1*random(1)*(gbest.cps[i+1].x-pos.cps[i+1].x)+c2*random(1)*(pbest.cps[i+1].x-pos.cps[i+1].x);
        cpsv[i].y=omega*cpsv[i].y+c1*random(1)*(gbest.cps[i+1].y-pos.cps[i+1].y)+c2*random(1)*(pbest.cps[i+1].y-pos.cps[i+1].y);
        if(pow(cpsv[i].mag(),2)>pow(maximumvel,2))
        cpsv[i].mult((maximumvel/sqrt(pow(cpsv[i].x,2)+pow(cpsv[i].y,2))));
      }
//      for (int i=0;i<knotsv.length;i++)
//      {
//        knotsv[i]= 0.4*omega*knotsv[i]+c1*random(1)*(gbest.knots[i+k]-pos.knots[i+k])+c2*random(1)*(pbest.knots[i+k]-pos.knots[i+k]);
//        if(knotsv[i]>maximumvel)
//        knotsv[i]=knotsv[i]*(maximumvel/knotsv[i]);
//      }
    }
  }



