
//
// ANIMATED P5CAIRO LOGO
//
// I animate circles to move into place of the p5 logo while fading out.
// The p5 logo fades in, and they meet somewhere in the middle.
//
// Youssef Faltas, March 2014



PImage img;

int n = 13;
int[] X = new int[n+1];
int[] Y = new int[n+1];

int[] Xi = new int[n+1];
int[] Yi = new int[n+1];
int[] Xf = new int[n+1];
int[] Yf = new int[n+1];
int[] r = new int[n+1];

int a = 1;

void setup() {
  size(256, 256);
  smooth();
  
  //String url = "https://pbs.twimg.com/profile_images/418091794459418626/kcg3utzv.png";
  
  img = loadImage("logo.png");
   
  background( 255 );
  
  for( int i=0; i<n; i++){
    Xi[i] = int(random(0,300));
    Yi[i] = int(random(0,300));
    r[i] = int(random(70,90));
    Xf[i] = int(random(100, 300));
    Yf[i] = int(random(0,60));  
  }

  
  r[n] = 210;  
  Xf[n] = -50;
  Yf[n] = 40;

  r[n-1] = 180;
  Xf[n-1] = 40;
  Yf[n-1] = 130;
  
  Xf[n-2] = 15;
  Yf[n-2] = 215;

  Xf[n-3] = 60;
  Yf[n-3] = 20;
 
  Xf[n-4] = 140;
  Yf[n-4] = 110;
  
  Xf[n-5] = 270;
  Yf[n-5] = 120; 
 
  Xf[n-6] = 180;
  Yf[n-6] = 100;   
  
  for( int i=0; i<n; i++){
    X[i] =  Xi[i]; 
    Y[i] =  Yi[i]; 
    
  }
   
   frameRate(14);  
   
}

void draw() {
  
 background( 255 );
 
 
 a = a+2;
 tint(255,a);
 image( img, 0, 0, width, height);
 
 
 
 if (a < 270) {
   
   noStroke(); 
    
   for( int i=0; i<n+1; i++ ){
     
     if( Xf[i] == X[i]) X[i] = X[i];
     if( Yf[i] == Y[i]) Y[i] = Y[i];
     
     if (Xf[i] > X[i])        X[i] = X[i] +int( random(1,4));
     else if( Xf[i] < X[i])  X[i] = X[i] - int( random(1,4));
     
    if( Yf[i] > Y[i])        Y[i] = Y[i] +int( random(1,4));
    else if ( Yf[i] < Y[i])  Y[i] = Y[i] -int( random(1,4)); 
    
    fill(120,110,60,255-a);
    ellipse(X[i],Y[i],r[i],r[i]);
    fill(255,255,255,255-a);
    ellipse(X[i],Y[i],5,5);
   }
   
   stroke(255,255,255,255-a);
    for( int i=0; i<n+1; i++){
      for( int j=0; j<n+1; j++){
        if ( abs (Xf[i]-Xf[j]) < 80 && abs (Yf[i]-Yf[j]) < 120 ){ 
        line(X[i],Y[i], X[j], Y[j]);
        }
      }
    }
  
 }
  
   

  
  
}

