
  /**
   Basado en
   "Igoumeninja 
   Aris Bezas 
   Spirals project"
   
   Corrientes de aire
   
   por Nataly Guzmán
    Agosto,2009
    En este trabajo se muestran movimientos en espiral , 
    que asemejan el movimiento del viento, del aire.
    Al hacer click, la imagen vuelve a correr.-
 */ 
 
Spiral spiral; 
 
 PImage cielo;
 
void setup() { 
  cielo= loadImage("flores.jpg");
  size(cielo.width, cielo.height,P3D); 
  background(cielo);
  
  frameRate(50000); 
   
  spiral = new Spiral(2,5.6,4.5,1.4,4,9); 
} 
 
void draw()  { 
  
  
  spiral.calcular(); 
} 
 
void mousePressed() { 
  if (mousePressed == true) { 
   background(cielo); 
  } 
} 
 
class Spiral  { 
  int diam = 50; 
  int contador; 
  float theta = 283.8; 
  float R,N,H,P,L,K,u,v,R2; 
  float[] W = new float[diam]; 
  float[] Fx = new float[diam]; 
  float[] Fy = new float[diam]; 
  float[] Fz = new float[diam]; 
   
  Spiral(float RVar,float NVar,float HVar,float PVar,float LVar,float KVar)  { 
    R = RVar;    // radio del tubo
    N = NVar;  // numero de vueltas 
    H = HVar;  // altura 
    P = PVar;  // fuerza
    L = LVar;    // Controles de pico largo
    K = KVar;    
  } 
    void calcular()  { 
    for (int i = 0; i < diam; i++)  { 
      u = u + .01; 
      v = v + .002; 
      W[i] = pow((u/(2*PI)*R),0.9); 
      Fx[i] = W[i]*cos(N*u)*(1+cos(v)); 
      Fy[i] = W[i]*sin(N*u)*(1+cos(v)); 
      Fz[i] = W[i]*(sin(v)+L*pow((sin(v/2)),K))  + H*pow((u/(2*PI)),P); 
      dibuje(); 
      } 
    } 
     
    void dibuje()  { 
      contador++; 
      if (contador >50)  {  
    } 
      if (contador >100)  { 
      contador = 0;}    
      translate(width/2,height/2); 
      rotateZ(theta/2); 
      rotateY(theta); 
      rotateX(PI/4); 
      fill(68,203,250,10);
       stroke(52,83,247,10);  
      beginShape(TRIANGLE_FAN); 
      for (int i = 0; i < diam-1; i++)  { 
        vertex(Fx[i],Fy[i],Fz[i]); 
     
      } 
      endShape(CLOSE); 
      translate(mouseX/2,mouseY/2); 
      rotateZ(theta/4); 
      rotateY(theta/3); 
      endShape(CLOSE); 
      if (u > 180)  { 

        v = u = 0; 
        
      } 
    } 
   
}

