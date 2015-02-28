
float circleX=0;
float circleY=0;
float circleXS=255;
float circleYS=255;
float circleXJ=0;
float circleYJ=0;
float circleXM=0;
float circleYM=0;
float A;
float B;
float C;
float D;
int I=1;
int P=1;
int K=0;
int J=1;
float T=.5;

void setup()
{
  size(1200,700);
  background(#000000);
}

void draw()
{
  D=random(-30,30);
  C=random(-30,30);
  A=random(255);
  B=random(255);
  strokeWeight(5);
  fill(0,0,0);
  stroke(0,0,B);
  ellipse(1100+A,50+D,30,30);
  ellipse(50+D,600+A,30,30);
  
  
    stroke(circleYS,0,circleXS);
  strokeWeight(10);
  fill(circleXJ,0,circleYJ);
  ellipse(circleX,circleY,K,K);
  
    stroke(circleYS,0,circleXS);
  strokeWeight(10);
  fill(circleXJ,0,circleYJ);
  ellipse(circleXM+width,circleYM+height,K,K);

  circleX=circleX+I;
  circleY=circleY+P;
  circleXM=circleXM-I;
  circleYM=circleYM-P;
  circleXJ=circleXJ+T;
  circleYJ=circleYJ+T;
  circleXS=circleXS-T;
  circleYS=circleYS-T;
  K=K+J;
  if(circleX==width)
  {I=I-1;}
  if(circleX==0)
  {I=I+1;}
  if(circleY==height)
  {P=P-1;}
  if(circleY==0)
  {P=P+1;}
  if(K==300)
  {J=J-1;}
  if(K==0)
  {J=J+1;}
  if(circleXJ==255)
  {T=-.5;}
  if(circleXJ==0)
  {T=+.5;}
}

