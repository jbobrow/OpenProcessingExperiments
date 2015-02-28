

  float y1;
  float t;
  float v, T, m, w, k,L=800,z, Tn, Bn, Fn, rho, amp;
  
  void setup() {
    size(800, 400);
    smooth();
    stroke(178,74,61);
    fill(178,74,61);
  }
  
  void draw() {
    v=80+mouseX/4;//sqrt(T/rho);
     amp=0.025*abs(mouseY - 400);
    background(200);
      for(int x=0; x < L; x++) {
        y1=0;
        for (int n=1; n< 10;n++){  
        k=(3.14*n)/L;                                                           //Numero de onda
        w=v*k;                                                                  // Frecuencia
        Fn=2*(-1/((L*L)*(k*k)*w))*(sin(k*L)-(k*L)*cos(k*L));              //factor comun
        Tn=Fn*(2*(sin(w*t)-sin(w*(t-1))+sin(w*(t-2))));                         //convolucion
        Bn=Fn; //coeficiente
        y1+=22-20*(Bn*sin(w*t) + Tn)*sin(k*x) - 3*amp*((x/L)*(lmda(t-1)));    //u(x,t)  
    }
    ellipse(x,y1,3,3); 
   }
    t = t + 0.1;
  }
  
  float lmda(float p)
  {
    float q=0;
    if(abs(p)>=1) q=0; 
    if(abs(p)<1)q=1-abs(p);
    return q;
  }
  
  void mouseClicked(){
  t=0;
  y1=0;
  }
