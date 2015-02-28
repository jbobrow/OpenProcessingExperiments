
int Length=10;
float[] x=new float[Length];
float[] y=new float[Length];
float[] z=new float[Length];
float xs,ys,zs;
float[] theta=new float[Length];
float[] theta_s=new float[Length];
float[] r=new float[Length];
float[] rs=new float[Length];

void setup(){
  size(760, 420, P3D);
  frameRate(30);
  background(0);
  xs=width/2;
  ys=height/2;
  zs=0;

  for(int i=1;i<Length;i++){
    theta[i]=random(-0.5,0.5);
    theta_s[i]=random(-0.1,0.1);
    r[i]=random(-100,100);
    rs[i]=random(30,60);
  }
}
void draw(){
  background(0);
  camera(width/2, height/2, 500, width/2, height/2, 0, 0, 1, 0);

  pointLight(51, 102, 186, xs,ys,50);
  directionalLight(0, 20, 120, 0, -400, 0);
  ambientLight(0,5,20);
  //spotLight(20, 200, 126, x,y,z, xs, ys, zs, PI/2, 1);

  noStroke();
  fill(255);
  
  for(int i=1;i<Length;i++){
    pushMatrix();
    translate(xs+r[i]*cos(theta[i]),ys+r[i]*sin(theta[i]),zs+r[i]*tan(theta[i]/10));
    sphere(rs[i]);
    theta[i]+=theta_s[i];
    popMatrix();
  }
  
}

