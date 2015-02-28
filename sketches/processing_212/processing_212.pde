
/*
Pempti 17 Apriliou 2008 Igoumenintza
Aris Bezas
play with the superformula
*/


int dim = 600;//Window dimension
int num = 500;//Arithos Sformon se akthe Sforma 
int formes = 2;//Arithmos Sformon

int maxpal = 512;
int numpal = 0;

Sform sformes;

void setup()  
{
  size(700,700);
  background(255);
  noFill();
  frameRate(10000);
  sformes = new Sform(40,1,1,1);
}

void draw()  
{
  sformes.calculate();
}

class Sform
{
  float x,y;
  float r,th=0,step=0.15;
  float m,n1,n2,n3;
  float b=1,a=1; 
  int counter1=0,counter2=0,epi=200;
  
  Sform(float mVar, float n1Var, float n2Var, float n3Var)  {
    m = mVar;
    n1 = n1Var;
    n2 = n2Var;
    n3 = n3Var;
  }
  
  void calculate()  {
    counter1 = counter1 + 5;
    if (counter1 == 500)    m=int(random(20));
    if (counter1 == 250)    n1=n2=n3=random(.5);
    if (counter1 == 300)    n2=random(6);
    if (counter1 == 400)    n3=random(6);
    if (counter1 == 500)    epi=int(random(1,4))*100;
    
    translate(width/2,height/2);
    for(int i=1; i < num; i++) {
      r = epi*pow(((pow(abs(cos(m*th/4)/a),n2))+(pow(abs(sin(m*th/4)/b),n3))),(-1/n1));  
      th = th + step;
      x = r*cos(th);//pow(abs(cos(th)),n1);
      y = r*sin(th);//pow(abs(sin(th)),n1);
      drawing();
    }
    if (counter1 > 500) {
      counter1 = 0;counter2++;}
    if (counter2 == 4)  {
      background(255);
      counter2=0;}
  }
  
  void drawing()  {
    stroke(noise(255),noise(255),noise(255),70);
    point(x,y);
    point(x-random(-2,2),y-random(-2,2));
    stroke(red(255),0,0,20);
    point(x-random(-2,2),y-random(-2,2));
    stroke(0,2,150,20);
    point(x-random(-2,2),-y-random(-2,2));    
    stroke(150,0,150,20);
    point(-x-random(-2,2),-y-random(-2,2));
  
}
}

void mousePressed() {
  background(255);
} 
  

