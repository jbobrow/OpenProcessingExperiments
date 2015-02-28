
ArrayList<Body_RKF> Bodies;
Derivatives   Sun_Gravity;   // derivatives object

final float  zoom = 300;
final int    MAX_ITER = 30;
      
double dt_glob = 0.01;
double t_glob = 0;
double tmax = 1000.0;

PFont myFont;



void setup(){
  Sun_Gravity = new EulerVelPos3D();
  Bodies = new ArrayList();
  for (int i=0;i<20;i++){
    Body_RKF B = new Body_RKF( i, new double[6], 0.0d, 0.001d );
    //B.X[0] = random(0.2,1.2);
    B.X[0] = 1;
    //B.X[4] = random(0.1,1.5);
    B.X[4]=0.1 + 0.05*i;
    Bodies.add( B ); 
  }
  size(800,800);
  background(0);
  myFont = createFont("ArialMT", 10);
  textFont(myFont);
}

int sc = 10;

void draw(){
  fill(0,5); rect(0,0,800,800);
  strokeWeight(1); 
  for (int i=0; i<1; i++){ 
    t_glob +=dt_glob;
    for( Body_RKF B : Bodies ){
      B.move(t_glob);
      B.paint();
      strokeWeight(3); line( 20+6*B.id, 20, 20+6*B.id, 20+ (float)(B.nevals/B.t)/sc  );
      //strokeWeight(3); line( 20+6*B.id, 20, 20+6*B.id, 20+log( (float)(B.nevals/B.t) )*10 );
      //strokeWeight(3); line( 20+6*B.id, 20, 20+6*B.id, 20+log( (float)((B.nevals-B.nevals_old)/(B.t-B.t_old)) )*10 );
    }
  }
  stroke(255); fill(255); 
  strokeWeight(1);   paintAxis( 20, 20, sc );
  strokeWeight(10);  point(400,400);
}



public interface Derivatives {
    public void derivs( double t0, double[] X, double[] dX );
}

void G_acceleartion( double[] X, double [] as ){
 double x = X[0]; double y = X[1]; double z = X[2];
 double r2 = x*x+y*y+z*z;
 double r  = Math.sqrt(r2);
 double aa  = -1.0d/ (r2*r);
 as[0]=x*aa; as[1]=y*aa; as[2]=z*aa; 
}

double [] as = new double[3]; 

class EulerVelPos3D implements Derivatives {
public void derivs(  double t, double[] X, double[] dX ){
  G_acceleartion(X,as);
  dX[0]= X[3];  dX[1]= X[4];  dX[2]= X[5];   // update positions 
  dX[3]=as[0];  dX[4]=as[1];  dX[5]=as[2];   // update forces
}
}

/* JAT: Java Astrodynamics Toolkit
 * Implements a Runge-Kutta-Fehlberg adaptive step size integrator
 * from Numerical Recipes. Modified to RK78 from the original RK45 in NR.
 * RK78 values from Erwin Fehlberg, NASA TR R-287
 * gets derivs via Derivatives interface
 * 
 * @author <a href="mailto:dgaylor@users.sourceforge.net">Dave Gaylor
 * @author modified by Steven Hugg
 * @version 1.0
 */
 

class Body_RKF {
 double [] X;
 double [] X_old;
 double [] Xinterp;
 int id;

 // double[] Y, double[] Yout, double[] Yerr, Derivatives dv

 void  interpolate_lin( double t_glob, double  t, double  t_old, double []  X_old, double []  X, double [] Xinterp ){
   double  tt=(t_glob-t_old)/(t-t_old); double  mt=(1-tt);
   for (int i = 0; i < ndim; i++){ Xinterp[i] = X_old[i]*mt + X[i]*tt;  }
 }
 
 double interCubXV( double t, double x0, double x1, double v0, double v1 ){
    double tt = t*t;   
    double dx  =  x1-x0;        double pv = v1+v0;
    double B   = -v0-pv +3*dx;  double A =  pv-2*dx;
    return A*tt*t + B*tt + v0*t + x0;
 };
 
  void  interpolate_xvcub( double t_glob, double  t, double  t_old, double []  X_old, double []  X, double [] Xinterp ){
   double tstep = (t-t_old); 
   double tt=(t_glob-t_old)/tstep;
   int ndim_half = ndim>>1;
   for (int i = 0; i < ndim_half; i++){ Xinterp[i] = interCubXV ( tt,  X_old[i], X[i], X_old[i+ndim_half]*tstep, X[i+ndim_half]*tstep );  }
 }

 void move(double t_glob){
   if(t<t_glob){
     X_old = X.clone(); t_old = t; nevals_old = nevals;
     while (t<t_glob){
       RKF45_adaptive( X, X, Xerr, Sun_Gravity );
     }
   }  
   //interpolate_lin( t_glob,t,t_old, X_old, X, Xinterp );
   interpolate_xvcub( t_glob,t,t_old, X_old, X, Xinterp );
 };

 Body_RKF( int id, double [] X0, double t0, double dt0 ){
     this.id = id;
     X    = X0;
     X_old    = new double[X.length];
     Xinterp = new double[X.length];
     t  = t0; dt = dt0;
     init_RKF45( X.length , 1e-9 );
     clr = 0xFF000000 | int(random(255)) | (int(random(255))<<8) | (int(random(255))<<16);
 }

 color clr;
 void paint(){
     stroke(clr);  
     strokeWeight(2);  point( (float)X[0]*zoom + 400, (float)X[1]*zoom + 400 ); 
     strokeWeight(1);     point( (float)Xinterp[0]*zoom + 400, (float)Xinterp[1]*zoom + 400 );
   //  line ( (float)Xinterp[0]*zoom + 400, (float)Xinterp[1]*zoom + 400, (float)X_old[0]*zoom + 400, (float)X_old[1]*zoom + 400 ); 
 };
// ==================== RKF45 integration scheme =======================  
  final int RK_LEN = 6; 
  final double [] at = { 0, 1d/4d, 3d/8d, 12d/13d, 1, 1d/2d };   // time0
  final double [] chat = {25d/216d, 0, 1408d/2565d, 2197d/4104d, -1d/5d};
  final double [] c    = {16d/135d, 0, 6656d/12825d, 28561d/56430d, -9d/50d, 2d/55d};
        double [][] b = new double [6][5];
        
  int ndim;
  double [][] f;         // derivatives
  double []   Xtmp;      // temporary state
  double []   Xerr;      // temporary state
  final double [] Xscales = { 0,0,0,   1,1,1 }; // scales for error metric 
  
  double accuracy;
  double t, t_old, dt;
  int nevals, nevals_old;
    
  void init_RKF45( int ndim, double accuracy ){
    nevals = 0;
    this.accuracy =  accuracy;
    this.ndim = ndim;
    Xerr = new double [ ndim ];
    Xtmp = new double [ ndim ];
    f    = new double [RK_LEN][ndim]; 
    b    = new double [6][5];
    b[1][0] = 1d/4d;        
    b[2][0] = 3d/32d;      b[2][1] = 9d/32d;       
    b[3][0] = 1932d/2197d; b[3][1] = -7200d/2197d; b[3][2] = 7296d/2197d;
    b[4][0] = 439d/216d;   b[4][1] = -8d;          b[4][2] = 3680d/513d;   b[4][3] = -845d/4104d;
    b[5][0] = -8d/27d;     b[5][1] = 2d;           b[5][2] = -3544d/2565d; b[5][3] = 1859d/4104d;  b[5][4] = -11d/40d;    
  }
        
  void RKF45_step(double[] y, double t, double h, double[] yout, double[] yerr, Derivatives dv) {  
      dv.derivs( t + at[0]*h, y   , f[0] ); for (int i = 0; i < ndim; i++) { Xtmp[i] = y[i] + h *   b[1][0]*f[0][i]; } 
      dv.derivs( t + at[1]*h, Xtmp, f[1] ); for (int i = 0; i < ndim; i++) { Xtmp[i] = y[i] + h * ( b[2][0]*f[0][i] + b[2][1]*f[1][i]   ); } 
      dv.derivs( t + at[2]*h, Xtmp, f[2] ); for (int i = 0; i < ndim; i++) { Xtmp[i] = y[i] + h * ( b[3][0]*f[0][i] + b[3][1]*f[1][i] + b[3][2]*f[2][i]   ); }  
      dv.derivs( t + at[3]*h, Xtmp, f[3] ); for (int i = 0; i < ndim; i++) { Xtmp[i] = y[i] + h * ( b[4][0]*f[0][i] + b[4][1]*f[1][i] + b[4][2]*f[2][i] + b[4][3]*f[3][i]   ); } 
      dv.derivs( t + at[4]*h, Xtmp, f[4] ); for (int i = 0; i < ndim; i++) { Xtmp[i] = y[i] + h * ( b[5][0]*f[0][i] + b[5][1]*f[1][i] + b[5][2]*f[2][i] + b[5][3]*f[3][i] + b[5][4]*f[4][i]  ); }  
      dv.derivs( t + at[5]*h, Xtmp, f[5] ); 
      
      // construct solutions
      // yout is the 8th order solution
      for (int i = 0; i < ndim; i++) {
          yout[i] = y[i] + h*(    c[0]*f[0][i] +   c[2]*f[2][i] +    c[3]*f[3][i] +    c[4]*f[4][i] + c[5]*f[5][i] );
          yerr[i] = y[i] + h*( chat[0]*f[0][i] +chat[2]*f[2][i] + chat[3]*f[3][i] + chat[4]*f[4][i]                ) - yout[i];
         // yout[i]-=0.5*yerr[i];
          
      }
      nevals+=6;
  }
  
  void RKF45_adaptive( double[] Y, double[] Yout, double[] Yerr, Derivatives dv ){
  final double SAFETY = 0.9; 
  final double PGROW = -0.2;
  final double PSHRINK = -0.25;
  final double ERRCON = 1.89E-4;
 // final double ERRCON = 0.5;
  final double TINY = 1.0E-30;
  
  double error=0;
  int n = Y.length;
  double dt_temp;
  for (int itr=0; itr<MAX_ITER; itr++ ){
    RKF45_step(  Y, t, dt, Xtmp,  Yerr, dv );
    for (int i=0; i<n; i++ ){  error = Math.max( error, Math.abs( Xerr[i]*Xscales[i] ) ); }
    error /=accuracy;
    if (error <= 1){
      //println("dt  "+dt); 
      t+=dt;
      for (int i=0; i<n; i++ ){ Yout[i] = Xtmp[i]; }
      dt_temp = dt * SAFETY * Math.pow(error,PGROW);
      dt = Math.min(dt_temp, 2.0 * dt);
      break;
    }
    dt_temp = SAFETY * dt * Math.pow(error,PSHRINK);
    dt = Math.max(dt_temp, 0.25 * dt);
  }
  //for (int i=0; i<n; i++ ){ Yout[i] = Xtmp[i]; }
}  
  
}
