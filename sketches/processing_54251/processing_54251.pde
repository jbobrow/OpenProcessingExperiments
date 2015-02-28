
/*
 * Quelic Berga
 * Procsilas Moscas (procsilas@hotmail.com)
 */

int MAXP=1000; /* nombre màxim de pilotetes alhora */

/* estats d'una piloteta */
int ESTAT_NORMAL=1;
int ESTAT_DESTRUIR=2;
int ESTAT_RECICLAR=3;

float sgn(float x) {
  if (x>=0)
    return 1;
  else 
   return -1;
}

class Piloteta {
  
  float px, py;
  float dx, dy;
  float r;
  float f;
  color c;
  int t; /* transparència */
  int estat;
  int id;
  
  Piloteta(int pid, float px, float py, float r, float f, color c) {
    this.px=px;
    this.py=py;
    this.r=r;
    this.f=f;
    this.c=c;
    this.t=255;
    this.id=pid;
    this.estat=ESTAT_NORMAL;
  }
  
  void dibuixa() {
    fill(c,t);
    ellipse(px, py, r/2, r/2);
  }
  
  void actualitza(float mx, float my) {
    if (estat==ESTAT_NORMAL) {
      dx=(mx-px)/f;
      dy=(my-py)/f;
      
      //dx-=sgn(dx)*r/f;
      //mXdy-=sgn(dy)*r/f;
      
      px+=dx;
      py+=dy;
    
      r=sqrt(r*r+1); /* creix poc a poc */    
      
      // canvi suau de color
      float cc=hue(c);
      if (millis()%4==0) cc+=1; if (cc>360) cc-=360;
      c=color(cc,100,100);
      
    } else { /* destrucció !!! */
      if (estat==ESTAT_DESTRUIR) {
        float k=1.23456789+1.0/f;
        r+=16;
        //c=blendColor(c, #0000FF, LIGHTEST);
        t/=k;
        if (t<=1/2) {
          this.estat=ESTAT_RECICLAR;
        }
      }
    }
  }
  
  void destrueix() {
    estat=ESTAT_DESTRUIR;
  }
}

Piloteta [] p = new Piloteta[MAXP];
float t;
int pid=1; 

void setup() {
  size(800,600,P2D);
  
  t=millis();
  noStroke();

  for (int i=0; i<MAXP; i++) /* al principi no hi ha pilotetes */
    p[i]=null;
    
  /* HSB */
  colorMode(HSB, 360, 100, 100);
}

/* Lorenz atractor */
float L_sigma=3;
float L_rho=26.5;
float L_beta=1;

float L_x0=0, L_y0=1, L_z0=2;
float L_x1=L_x0, L_y1=L_y0, L_z1=L_z0;
float dt=0.01;

int rr=5; /* radi piloteta */

void draw() {
  float mX, mY;
  int id;
  
  fill(0,10);
  rect(0,0,width,height);
  
  if ((millis()-t)>40) {
    /* crear nova piloteta: buscar lloc a l'array i inserir-la */
    int flag=0;
    id=0;
    while ((id<MAXP) && (flag==0)) {
      if (p[id]==null)
        flag=1;
      else
        id++;
    }
    if (flag==1) { /* si hem trobat lloc */    
      p[id]=new Piloteta(pid, random(width), -5, 25, 5+random(250), color(0, 100, 100));
      pid++; /* nombre de pilotetes creades */
      //println(pid);
    }
    
    t=millis();
  }

  /* el fals cursor segueix un atractor de Lorenz */
  L_x1+=(L_sigma*(L_y0-L_x0))*dt;
  L_y1+=(L_x0*(L_rho-L_z0)-L_y0)*dt;
  L_z1+=(L_x0*L_y0-L_beta*L_z0)*dt;
  
  L_x0=L_x1; mX=(1+L_x0/15)*width/2;
  L_y0=L_y1; mY=(1+L_y0/25)*height/2;
  L_z0=L_z1;

  /* fals cursor */
  //mX=(1+sin(millis()/(1987.0/3.0*(2+cos(millis()/5000.0)))))*width/2;
  //mY=(1+cos(millis()/(2987.0/5.0*(2+sin(millis()/5000.0)))))*height/2;
    
//  println(L_x0+", "+L_y0+", "+L_z0);
  
  fill(0,0,100);
  ellipse(mX,mY,rr,rr);
  
  for (int i=0; i<MAXP; i++) {
    if (p[i]!=null)
      p[i].actualitza(mX, mY);
  }  

  for (int i=0; i<MAXP; i++) {
    if (p[i]!=null)
      p[i].dibuixa();
  }
  
  /* destruir les pilotetes que queden toquen el mouse */
  for (int i=0; i<MAXP; i++) {
    if (p[i]!=null) 
      if (p[i].estat==ESTAT_NORMAL)
        if (dist(p[i].px,p[i].py,mX,mY)<p[i].r) {
          p[i].destrueix();
          //rr++;   
        }
  }  
  
  /* fer lloc per les pilotetes noves eliminant les destruides */
  for (int i=0; i<MAXP; i++) {
    if (p[i]!=null)
      if (p[i].estat==ESTAT_RECICLAR)
        p[i]=null;
  }    
} 

