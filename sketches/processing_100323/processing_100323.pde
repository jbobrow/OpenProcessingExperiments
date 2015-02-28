
int c=0;
private float dt=.01;//time step
private float ve=750;//effective exhaust velocity
private float v=0;//velocity aka ds/dt
private float s=0;//position
private float m=76;//mass
private float dmdt=8;//mass flow rate, positive
private float cd=.75;//coefficient of drag
private float rho=1109;//atmosphere density
private float a=0.01;//cross-sectional reference area, for drag equation
private float g=9.8;//gravity
private float dvdt=0;
private float t=0;
private float drymass = 63.2;
private float maxheight;
private float mht;
private float maxdvdt;
float mindvdt;
float maxv;
float minv;
float[] T = new float[600];
float[] DVDT = new float[600];
float[] V= new float[600];
float[] S = new float[600];
void setup() {
  size(1000, 1000);
  background(0);
  noLoop();
}
void draw() {

  while (s>0||t<1) {

    for (int i=0; i<5;i++) {
      t+=dt;
      dvdt=0;
      if (s>=0) {
        if (m>drymass) { //if there is still propellant
          m-=dmdt*dt;//burn a little.
          dvdt+=engine(m, dmdt, ve)*dt;
        }
        dvdt-=drag(cd, rho, v, a, m)*dt;
        dvdt-=g*dt;
      } 
      else {
        dvdt=0;
      }
      v+=dvdt*dt;
      s+=v*dt;
      if (s>maxheight) {
        maxheight=s;
        mht = t;
      }

      /*
                System.out.print(t);
       System.out.print(",");
       System.out.print(dvdt);
       System.out.print(",");
       System.out.print(v);
       System.out.print(",");
       System.out.print(s);
       System.out.print(",");
       System.out.println(drag(cd,rho,v,a,m));
       */
    }
    T[c]=t;
    DVDT[c]=dvdt;
    S[c]=s;
    V[c]=v;
    c++;
  }
  text("flight time: ", 10, 15);
  text(t, 65, 15);
  text("max height:", 10, 30);
  text(maxheight, 75, 30);
  System.out.print("Flight time: ");
  System.out.print(t);
  System.out.println("s");
  System.out.print("Max Height of ");
  System.out.print(maxheight);
  System.out.print(" meters at ");
  System.out.print(mht);
  System.out.println(" seconds");
  System.out.println(c);
  for (float i:DVDT) {
    if (i>maxdvdt) {
      maxdvdt = i;
    }
    if (i<mindvdt) {
      mindvdt =i;
    }
  }
  for (float i:V) {
    if (i>maxv) {
      maxv = i;
    }
    if (i<minv) {
      minv = i;
    }
  }
  for (int i=0; i<c; i++) {
    int x = int(map(i, 0, c, 0, width));
    stroke(255, 0, 0);
    point(x, map(S[i], 0, maxheight, height, 0));
    stroke(0, 255, 0);
    point(x, map(DVDT[i], mindvdt*1.1, maxdvdt*1.1, height, 0));
    stroke(0, 0, 255);
    point(x, map(V[i], minv*1.1, maxv*1.1, height, 0));
  }
}

float drag(float cd, float p, float v, float a, float m) {
  return .5*cd*p*v*v*a/m;
}

float engine(float m, float dmdt, float ve) {
  return ve*dmdt/m;
}
