
float maxle=6; //layers of petals
float maxra=130; //initial radius
float minbend=.73; //"bend" on petals (1=circles)

float edgevar=160; //velocity on random edge variance
float maxedgevar=40; //max edge deviation
float edgemem=500; //memory for the edge randomness

float lightd=10; //light distance
float lvar=15; //light randomness variance
float la=23; //light alpha multiplier
float darkd=15; //dark distance
float dvar=15; //dark randomness variance
float da=18; //dark alpha multiplier

float maxbright=230; //maximum brightness of petals
float brightvar=100; //maxbright-brightvar is the brightness at the center
float sa=250; //saturation
float basehu=128; //color center
float inithuvar=128; //color variance
float huvar=15; //step variance

float stepinc=.0015;

float wot, hot;
float steple=maxra/maxle;
float edgememp1=edgemem+1; //for speed

float[] toRect(float ra, float th)
{
  float[] ou={sin(th)*ra,cos(th)*ra};
  return ou;
}

void setup(){
  size(400,400);

  wot=width/2;
  hot=height/2;
  
  colorMode(HSB);
}

void draw() {
  background(255);
  rose();
}

void rose() {
  translate(wot,hot);
  
  float hu=random(basehu-inithuvar,basehu+inithuvar);
  for(float le=0;le<=maxle;le++)
  { 
    float completed=(le/maxle);
    float rad=maxra-(le*steple);
    float ap=(minbend);//+(le/50));
    float a=ap*rad;
    float b=(1-ap)*rad;
    float an=completed*TWO_PI+random(1);
    
    float edgepos=0;
    
    hu=(hu+random(-huvar/2,huvar))%255; //a;ways move forward
    float br=maxbright-(completed*brightvar);
    float shadea=(1-completed);
    shadea*=shadea;//darker on the outside
    
    float[] tr,trl,trd;
    for(float t=0;t<2*TWO_PI;t+=stepinc)
    {

      float r=a+b*cos(2.5*t+an)+edgepos;
      tr=toRect(r,t);
      if(r>a)
      {
        stroke(hu,sa,br,100);
        smooth();
        line(0,0,tr[0],tr[1]);
        noSmooth();
        
        trl=toRect(r-lightd,t);
        stroke(0,0,255,shadea*la);
        line(tr[0],tr[1],trl[0]+random(-lvar,lvar),trl[1]+random(-lvar,lvar));
        
        trd=toRect(r+darkd,t);
        stroke(0,0,0,shadea*da);
        line(tr[0],tr[1],trd[0]+random(-dvar,dvar),trd[1]+random(-dvar,dvar));
      }
      edgepos=(edgepos*edgemem+random(-edgevar,edgevar))/(edgememp1);
      edgepos=constrain(edgepos,-maxedgevar,maxedgevar);
    }
  }
}

