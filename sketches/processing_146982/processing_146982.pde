
final int n = 400;
final float dt            = 0.2;
final float c_errode      = 0.4 *dt;
final float c_rain        = 0.001*dt;
final float c_sediment    = 0.001*dt;
final float f_sediment    = 0.1;    
final float f_mix         = 0.1;  final float mf_mix  = 1.0-f_mix; 
//final float f_orig        = 0.001; final float mf_orig = 1.0-f_orig; 
final float max_erode     = 0.9;

float [][] h_orig  = new float[n][n];
float [][] h       = new float[n][n];
float [][] watter  = new float[n][n];
float [][] watter_ = new float[n][n];
float [][] slope   = new float[n][n];

final int perframe = 10;

void setup(){
  size(800,400);
  for(int i=0;i<n;i++){ for(int j=0;j<n;j++){ 
    //h  [i][j] = 0.5 * ( 1.0 +  sin( i*0.12 + sin(i*0.07 ) ) * sin( j*0.08 + sin(i*0.045 ) ) );
    //h       [i][j] = h_orig  [i][j] = noise( 0.01 * i, 0.01 * j );
    h       [i][j] = h_orig  [i][j] = 2*noise( 0.01 * i, 0.01 * j )*( 10000.0/(10000.0+(i-200)*(i-200)+(j-200)*(j-200)) );
    if((i*i+j*j)<40000) h       [i][j] = h_orig  [i][j] = 0.5 + 0.1*noise( 0.01 * i, 0.01 * j );
    watter  [i][j] = watter_ [i][j] = 0.1;
  } }
  frameRate(3);
}

void draw(){
  for (int i=0;i<perframe;i++){
    rain_and_evaporation ( );
    flow_and_errosion    ( );
  }
  //plot(0  ,0, 1.0, h      );
  //plot(500,0, 1.0, watter );
  plot(0  ,0, -1.0, h      );
  plot(400,0, -100.0, watter );
}


// ======== Algorithm

final void flow_and_errosion( ){
   // gradient evaluation
   for(int i=1;i<n-1;i++){ for(int j=1;j<n-1;j++){ 
     float hij  = h[i][j];
     int imin = 0,jmin = 0;
     float dh,dhmin=0,dhmin2=0;
     dh = h[i-1][j  ]-hij;         if( dh<dhmin ){  imin = -1; jmin =  0; dhmin2=dhmin; dhmin = dh; }
     dh = h[i+1][j  ]-hij;         if( dh<dhmin ){  imin = +1; jmin =  0; dhmin2=dhmin; dhmin = dh; }
     dh = h[i  ][j-1]-hij;         if( dh<dhmin ){  imin =  0; jmin = -1; dhmin2=dhmin; dhmin = dh; }
     dh = h[i  ][j+1]-hij;         if( dh<dhmin ){  imin =  0; jmin = +1; dhmin2=dhmin; dhmin = dh; }
     final float cdiag = 0.70710678118;
     dh = (h[i-1][j-1]-hij)*cdiag; if( dh<dhmin ){  imin = -1; jmin = -1; dhmin2=dhmin; dhmin = dh; }
     dh = (h[i-1][j+1]-hij)*cdiag; if( dh<dhmin ){  imin = -1; jmin = +1; dhmin2=dhmin; dhmin = dh; }
     dh = (h[i+1][j-1]-hij)*cdiag; if( dh<dhmin ){  imin = +1; jmin = -1; dhmin2=dhmin; dhmin = dh; }
     dh = (h[i+1][j+1]-hij)*cdiag; if( dh<dhmin ){  imin = +1; jmin = +1; dhmin2=dhmin; dhmin = dh; }
     //println( i+" "+j+" "+dhmin+" "+dhmin2 );
     if( dhmin<-0.00001 ){
       float wij   = watter[i][j];
       float sediment = wij*c_sediment/(1-dhmin); wij-=sediment;
       watter_[i+imin][j+jmin] += wij;
       //float mud =  c_errode * wij*(-dhmin);
       float mud =  c_errode * sqrt(wij)*(-dhmin);
       mud = min( mud, (dhmin2 - dhmin) * 0.1  );
       h[i][j]            =   hij  - mud + sediment;
       //h[i][j]            =    f_orig*h_orig[i][j] + mf_orig*hij  - mud + sediment;
       h[i+imin][j+jmin] += mud*f_sediment;
     }
   } } 
}

final void rain_and_evaporation ( ){
  for(int i=1;i<n-1;i++){ for(int j=1;j<n-1;j++){ 
    float wij     = watter_[i][j]  + c_rain;   watter_[i][j] = 0.0;
    watter[i][j]  = watter[i][j]*mf_mix +   wij*f_mix;
  } }
}

final void plot(int ix0, int iy0, float sc, float [][] Fin ){
  int nj=Fin[0].length;
  float fmin = 0;
  if (sc<0){
    fmin = 1000000; float fmax = -1000000;
    for(int i=2;i<Fin.length-2;i++){ for(int j=2;j<nj-2;j++){
      float fij  = Fin[i][j];
      if(fij>fmax) fmax=fij;  if(fij<fmin) fmin=fij;
    } }
    sc = -sc/(fmax-fmin);
  }
  for(int i=0;i<Fin.length;i++){ for(int j=0;j<nj;j++){
    float f = 255*sc*(Fin[i][j]-fmin); 
    color c = color(f,f,f);
    set(i+ix0,j+iy0, c);
  } }
}






