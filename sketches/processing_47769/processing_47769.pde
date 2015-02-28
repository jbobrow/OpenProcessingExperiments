
/**
 * doodle 1
 *
 * Matthew Conroy ( conroy (at) math.washington.edu )
 **/



float[] pointR=new float[100];
float[] pointTheta=new float[100];

int numPoints=8;

int symmetry = 30;

int kk = 2;

int timer=0;

float factor1=random(0,1);
float factor2=random(0,1);


void setup()
{
  size(600, 600);
  
  for(int i=0; i<numPoints; i++) {
     pointR[i]=width*0.45*i/numPoints;
     pointR[i]=width*0.3;
     //pointTheta[i]=random(0,TWO_PI/symmetry);
     pointTheta[i]=0;
  }
}

void draw()
{
  ++timer;
     
  smooth();
  float redA = 188+60*cos(timer*0.004);
  float greenA = 188+60*sin(timer*0.0043);
  float blueA = 188+60*sin(timer*0.00427+3.12923);
   
  fill(0.5*(255-redA),0.5*(255-greenA),0.5*(255-blueA),255);
  rect(0,0,width,height);
  
  stroke(redA,greenA, blueA,120);
  noFill();
  for(int i=0; i<numPoints; i++) {
     kk=1;
     int j=(kk*i+4) % numPoints;
     int ll = (kk*i+6) % numPoints;
     int mm = (kk*i+7) % numPoints;
     for(int k=0; k<symmetry; ++k) {
         float x1 = width*0.5+pointR[i]*cos(pointTheta[i]+k*TWO_PI/symmetry);
         float y1 = width*0.5+pointR[i]*sin(pointTheta[i]+k*TWO_PI/symmetry);
         float x2 = width*0.5+pointR[j]*cos(pointTheta[j]+k*TWO_PI/symmetry);
         float y2 = width*0.5+pointR[j]*sin(pointTheta[j]+k*TWO_PI/symmetry);
         float x3 = width*0.5+pointR[ll]*cos(pointTheta[ll]+k*TWO_PI/symmetry);
         float y3 = width*0.5+pointR[ll]*sin(pointTheta[ll]+k*TWO_PI/symmetry);
         float x4 = width*0.5+pointR[mm]*cos(pointTheta[mm]+k*TWO_PI/symmetry);
         float y4 = width*0.5+pointR[mm]*sin(pointTheta[mm]+k*TWO_PI/symmetry);
         
         //line(x1,y1,x2,y2);
         //bezier(x1,y1,x3,y3,x2,y2);
         //bezier(x1, y1, 10+(x1+2*x2)/3,10+(y1+2*y2)/3.,-13+(2*x1+x2)/3.,-28+(2*y1+y2)/3., x2, y2);
         //bezier(x1,y1,x3,y3,x4,y4,x2,y2);
         float ampl = 0.25*(1+cos(timer*0.0078273+i*0.3838));
         ellipse(x1,y1,ampl*200,ampl*200);
         //rectMode(CENTER);
         //rect(x1,y1,ampl*200,ampl*200);
         //rectMode(CORNER);
     }
  }
  
  float sumR=0;
  float sumt=0;
  for(int i=0; i<numPoints; i++) {
     sumR += pointR[i];
     sumt += pointTheta[i]; 
  }
  
  float rAve = sumR/numPoints;
  float tAve = sumt/numPoints;
  
  for(int i=0; i<numPoints; i++) { 
     float rDelta=0.5+0.5*sin(timer*0.05)+0.002*sin(i+3);
     float tDelta=0.001+0.001*sin(timer*0.04)+0.002*cos(i+2);
     pointR[i] += 1.5*rDelta*cos(timer*0.0137+11*i)+0.01*cos(i);
     pointTheta[i] += 1*tDelta*sin(timer*0.01)+0.001*cos(i+3.322);

  }
  


} // end draw 



