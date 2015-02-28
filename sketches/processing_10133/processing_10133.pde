
import processing.opengl.*; 

float pi = 3.1415;

int w = 600; //size of the window
int Nt = 600;

int strW = 2;

float A[] = new float[w]; 
float I[] = new float[w];


float D2A[] = new float[w]; 
float D2I[] = new float[w];

//A prod, A degr, A diff, I degr, I diff
float p[][] = new float[][] {{0.5,2,2,2,1,0},{0.1,2,1,2,0.5,0},{1,15,0.1,10,2,0},{0.1,7,1.5,8,2,2}};
int pind =3;


float dt = 0.05;
int t=0;

void setup(){ 

  size(w,Nt); 
  smooth(); 
  
  //noLoop(); 
  
  //initial condition
  
  for(int i=0;i<w; i++)
  {
    A[i] = 1.1+cos(6*pi*i/w);
    I[i] = 1.2+sin(2*pi*i/w);
    stroke(20*A[i]);
    point(i,t);
  }
  
  t=t+1;

} 

void draw(){ 
  //fill(0);
  
  if(t < Nt)
  {

  //background(255);

  //Laplacian
  for(int i=1;i<w-1; i++)
  {
    D2A[i] = A[i-1] + A[i+1] - 2*A[i];
    D2I[i] = I[i-1] + I[i+1] - 2*I[i];
  }
  D2A[0] = A[1] - A[0]; 
  D2I[0] = I[1] - I[0]; 

  for(int i=0;i<w; i++)
  {
    A[i] = A[i] + dt*( 5*A[i]*A[i]*A[i]/(I[i]*I[i])  + p[pind][0] -p[pind][1]*A[i] + p[pind][2]*D2A[i] + 0.0*random(-1,1) ) ;
    I[i] = I[i] + dt*( 1*A[i]*A[i]*A[i]  -p[pind][3]*I[i] + p[pind][4]*D2I[i] + p[pind][5]*random(-1,1));
        
    //stroke(5*A[i],250-5*I[i],250-10*D2A[i]);
    
    stroke(250-50*A[i]);
    point(i,t);
    

  }

  t=t+1;
  }
} 

void mouseReleased() {

    for(int i=0;i<w; i++)
  {
    A[i] = 1.1+cos(6*pi*i/w);
    I[i] = 1.2+sin(2*pi*i/w);

    t=1;
    background(255);
  }
  
  pind = pind+1;
  if(pind==4){pind=0;}
  
}

void keyPressed() {

   p[0][0] =random(0,1);
   p[0][1] =random(0,15);
   p[0][2] =random(0,4);
   p[0][3] =random(0,15);
   p[0][4] =random(0,4);
   p[0][5] =random(0,2);
   
   t=1;
   background(255);
   pind =0;
}

