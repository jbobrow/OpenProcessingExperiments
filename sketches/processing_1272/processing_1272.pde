
// Fibonacci Zoom
 
// - Jim Bumgardner
 
int f = 0;
 
 
float kMaxOffset = .9;
 
float phi = (sqrt(5)+1)/2 - 1; // golden ratio
float ga = phi*2*PI;           // golden angle
 
 
void setup()
{
  size(600,600);
  frameRate(30);
   
  println("phi " + phi);
  println("Big Picture (R=20) = " + sqrt(2601*20*20));
  // println("Small radius = " + R);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  drawit();
}
 
 
void drawit()
{
  background(64);
  float m = 1+f;
  float rad = width/2 - 64;
  float asmall = (PI*rad*rad)/m;
  float R = sqrt((rad*rad)/m); // also sqrt(asmall/PI);
 
   // area filled thus far
   // asmall = PI*R*R
   // areafilled = asmall*i;
   // radiusfilled = Math.sqrt(areafilled/PI);
   // PI cancels out giving: radiusfilled = sqrt(R*R*i);
   // ratio of this radius-filled-so-far to rad
  float cumA = 0;
  for (int i = 0; i < m; ++i)
  {
    float a = i*ga; // angle
    fill(128+(i*5)%128);
 
    float ir = i/(float) (m-1); // i as a ratio
    float xo = asmall*kMaxOffset*2*ir - asmall*kMaxOffset; // area offset of this nodule
    float areai = asmall+xo;                 // area of this nodule
    float radi = sqrt(areai/PI);             // radius of this nodule
    float radcum = sqrt(cumA/PI);            // radius of cum area
     
    // println("d1 = " + d + " d2 = " + );
 
    radi *= min(1,(m-i)/5.0);
 
    float x = width/2 + sin(a)*(radcum+radi);
    float y = width/2 + cos(a)*(radcum+radi);
    
    ellipse(x-radi,y-radi,radi*2,radi*2);
    cumA += PI*radi*radi;
  }
}
 
void draw()
{
  drawit();
  ++f;
}



