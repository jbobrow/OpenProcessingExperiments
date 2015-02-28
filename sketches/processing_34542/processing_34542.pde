
//Wanderer//Alejandro González//Dominio Público//a(at)60rpm.tv////////////////////
//Just a sketch I did for fun, inspired by Keith Peters's lovely Lissajous webs://
//http://www.bit-101.com/blog/?p=3258/////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//This sketch could be optimized heavily, be serious//////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


int X,Y;        //x and y of the center of drawing
float f=300f,   //butterfly scale factor
f_=1-1e-4,      //butterfly scale factor scale factor... (you can add more if you believe it necessary)
D=30f,          //distance to check
cD,             //a variable to check whether a particle is beyond the border of canvas+D 
t,              //ecuation parameter
C=2e6,c,A=C*.1; //color range,hue,alpha

LinkedList<PVector> ps;   //list of points added
PVector cp;               //current point
 
void setup(){
  size(700,700); colorMode(HSB,C); smooth(); background(#111111); //general settings
  X=width/2; Y=height/2; cD=X+D;                                  //variable settings
  ps=new LinkedList<PVector>(); cp=new PVector(0,0);              //object settings
}

void draw(){
  w();
  for (PVector p:ps){
    float d=PVector.dist(cp,p);
    if(d>0 && d<D){             //first one in order to avoid lines between a point and itself         
      stroke(c++,C,C,A);        //add a bit of cosmic energy
      line(cp.x,cp.y,p.x,p.y);
    } 
  } 
}

//Wander
//Particle wanders through a butterfly ecuation: http://en.wikipedia.org/wiki/Butterfly_curve_(transcendental)//
void w(){
   float r=(exp(sin(t))-(2*cos(t*4))-pow(sin(((2*t)-PI)/24),5))*(f*=f_);
   float x=X+r*cos(t);
   float y=Y+r*sin(t); 
   if((abs(x-X)>cD)||(abs(y-Y)>cD)){                             
     //if next point is inside our canvas add it to the list, if not make a commentary 
   }else{ 
     cp=new PVector(x,y); 
     ps.add(cp);  
   }
   t+=noise(x*.05,y*.05,r)*.05; //some groove here
}


