
/* 
 Igoumeninja 15/5/2008
 Aris Bezas
 Spirals project
 */

Spiral spirals;


void setup() {
  size(600,600,P3D);
  background(255);
  frameRate(50000);
  
  spirals = new Spiral(2,5.6,4.5,1.4,4,9);
}

void draw()  {
  spirals.calculate();
}

void mousePressed() {
  if (mousePressed == true) {
   //u = v =10;
   background(255);
  }
}

class Spiral  {
  int dim = 50;
  int counter;
  float theta = 283.8;
  float R,N,H,P,L,K,u,v,R2;
  float[] W = new float[dim];
  float[] Fx = new float[dim];
  float[] Fy = new float[dim];
  float[] Fz = new float[dim];
  
  Spiral(float RVar,float NVar,float HVar,float PVar,float LVar,float KVar)  {
    R = RVar;    // radius of tube
    N = NVar;  // number of turns
    H = HVar;  // height
    P = PVar;  // power
    L = LVar;    // Controls spike length
    K = KVar;    // Controls spike sharpness
  }
    void calculate()  {
    for (int i = 0; i < dim; i++)  {
      u = u + .01;
      v = v + .002;
      W[i] = pow((u/(2*PI)*R),0.9);
      Fx[i] = W[i]*cos(N*u)*(1+cos(v));
      Fy[i] = W[i]*sin(N*u)*(1+cos(v));
      Fz[i] = W[i]*(sin(v)+L*pow((sin(v/2)),K))  + H*pow((u/(2*PI)),P);
      drawing();
      }
    }
    
    void drawing()  {
      counter++;
      if (counter >50)  {
      //L = random(1,50);
    }
      if (counter >100)  {
      counter = 0;}    
      translate(width/2,height/2);
      rotateZ(theta/2);
      rotateY(theta);
      rotateX(PI/4);
      fill(100,0,23,10);
      stroke(100,0,43,10);
      //beginShape(TRIANGLE_STRIP);
      beginShape(TRIANGLE_FAN);
      for (int i = 0; i < dim-1; i++)  {
        vertex(Fx[i],Fy[i],Fz[i]);
        //vertex(Fx[i]+2,Fy[i]+2,Fz[i]+2);
        //vertex(Fx[i]-2,Fy[i]-2,Fz[i]-2);
      }
      endShape(CLOSE);
      //endShape(CLOSE);
      translate(mouseX/2,mouseY/2);
      rotateZ(theta/4);
      rotateY(theta/3);
      rotateX(mouseX);
      fill(100,0,23,1);
      stroke(100,0,43,1);
      beginShape(TRIANGLE_FAN);
      for (int i = 0; i < dim-1; i++)  {
        vertex(Fx[i],Fy[i],Fz[i]);
        //vertex(Fx[i]+2,Fy[i]+2,Fz[i]+2);
        //vertex(Fx[i]-2,Fy[i]-2,Fz[i]-2);
      }
      endShape(CLOSE);
      if (u > 180)  {
        //theta = random(360);
        v = u = 0;
        //background(255);
        //println(theta);
      }
    }
  
}
/*
class Spiral  {
  int dim = 50;
  float theta = 283.8;
  float R,N,H,P,L,K,u,v;
  float[] W = new float[dim];
  float[] Fx = new float[dim];
  float[] Fy = new float[dim];
  float[] Fz = new float[dim];
  
  Spiral(float RVar,float NVar,float HVar,float PVar,float LVar,float KVar)  {
    R = RVar;    // radius of tube
    N = NVar;  // number of turns
    H = HVar;  // height
    P = PVar;  // power
    L = LVar;    // Controls spike length
    K = KVar;    // Controls spike sharpness
  }
    void calculate()  {
    for (int i = 0; i < dim; i++)  {
      u = u + .01;
      v = v + .002;
      W[i] = pow((u/(2*PI)*R),0.9);
      Fx[i] = W[i]*cos(N*u)*(1+cos(v));
      Fy[i] = W[i]*sin(N*u)*(1+cos(v));
      Fz[i] = W[i]*(sin(v)+L*pow((sin(v/2)),K))  + H*pow((u/(2*PI)),P);
      drawing();
      }
    }
    
    void drawing()  {
      translate(width/2,height/2);
      rotateZ(theta/2);
      rotateY(theta);
      rotateX(PI/4);
      fill(100,0,23,10);
      stroke(100,0,43,10);
      //beginShape(TRIANGLE_STRIP);
      beginShape(TRIANGLE_FAN);
      for (int i = 0; i < dim-1; i++)  {
        vertex(Fx[i],Fy[i],Fz[i]);
        //vertex(Fx[i]+2,Fy[i]+2,Fz[i]+2);
        //vertex(Fx[i]-2,Fy[i]-2,Fz[i]-2);
      }
      endShape(CLOSE);
      //endShape(CLOSE);
      translate(mouseX/2,mouseY/2);
      rotateZ(theta/4);
      rotateY(theta/3);
      rotateX(mouseX);
      fill(100,0,23,1);
      stroke(100,0,43,1);
      beginShape(TRIANGLE_FAN);
      for (int i = 0; i < dim-1; i++)  {
        vertex(Fx[i],Fy[i],Fz[i]);
        //vertex(Fx[i]+2,Fy[i]+2,Fz[i]+2);
        //vertex(Fx[i]-2,Fy[i]-2,Fz[i]-2);
      }
      endShape(CLOSE);
      if (u > 180)  {
        theta = random(360);
        v = u = 0;
        background(255);
        //println(theta);
      }
    }
  
}
*/

  

