

int sketchX=600;
int sketchY=600;
int numberOfBullets=1000;
float MA=0.96;

Particle bullets = new Particle(numberOfBullets,sketchX,sketchY);


void setup(){
  size(600,600);
//smooth();
  bullets.collision=true;
  bullets.damping=.99;
  ellipseMode(CENTER);
}

void draw(){
  background(0);
  
  bullets.update();
  for(int i=0;i<numberOfBullets;i++){
    if (mousePressed==true){
      float ang=atan2((bullets.x[i]-mouseX),(bullets.y[i]-mouseY));
      float dist=sqrt(pow(bullets.x[i]-mouseX,2)+pow(bullets.y[i]-mouseY,2));
      bullets.ax[i]= -sin(ang)*.2;
      bullets.ay[i]= -cos(ang)*.2;
      
      if(dist<100){
        float bulletAng=atan2(bullets.vx[i],bullets.vy[i]);
        int r=round(MA*red(bullets.colour[i])+(1-MA)*(0.5+0.5*cos(bulletAng))*255);
        int g=round(MA*green(bullets.colour[i])+(1-MA)*(0.5+0.5*cos(bulletAng+2*PI/3))*255);
        int b=round(MA*blue(bullets.colour[i])+(1-MA)*(0.5+0.5*cos(bulletAng+4*PI/3))*255);
        bullets.colour[i]=color(r,g,b,10);
      }
      
      //stroke(75);
      //strokeWeight(1);
      //line(mouseX,mouseY,bullets.x[i],bullets.y[i]);
    } else {
      bullets.ax[i]=0;
      bullets.ay[i]=0;
    }
  }
  
}








class Particle { 
  float[] x = new float[1]; 
  float[] y = new float[1]; 
  float[] vx = new float[1]; 
  float[] vy = new float[1]; 
  float[] ax = new float[1]; 
  float[] ay = new float[1]; 
  color[] colour = new color[1];
  int isize,sx,sy;
  float damping = 1;
  boolean collision=true;
  
  Particle (int i, int a, int b) {  
    x = expand(x,i);     for(int j=0;j<i;j++){x[j]=random(0,a);}
    y = expand(y,i);     for(int j=0;j<i;j++){y[j]=random(0,b);}
    vx = expand(vx,i);   for(int j=0;j<i;j++){vx[j]=random(-5,5);}
    vy = expand(vy,i);   for(int j=0;j<i;j++){vy[j]=random(-5,5);}
    ax = expand(ax,i);   for(int j=0;j<i;j++){ax[j]=0;}
    ay = expand(ay,i);   for(int j=0;j<i;j++){ay[j]=0;}
    colour = expand(colour,i);   for(int j=0;j<i;j++){colour[j]=color(255,5);}
    isize=i; sx=a; sy=b;
  } 
  
  void update() { 
    for(int j=0;j<isize;j++){
      vx[j]+=ax[j];
      vy[j]+=ay[j];
      vx[j]*=damping;
      vy[j]*=damping;
      x[j]+=vx[j];
      y[j]+=vy[j];
      stroke(colour[j]);
      strokeWeight(10);
      point(x[j],y[j]);
//      stroke(255,100);
//      strokeWeight(5);
//      point(x[j],y[j]);
      
      if(collision==true){
        if(x[j]>sx){  x[j]=sx-(x[j]-sx);  vx[j]*=-.9;}
        if(y[j]>sy){  y[j]=sy-(y[j]-sy);  vy[j]*=-.9;}
        if(x[j]<0) {  x[j]=0-x[j];   vx[j]*=-.9;}
        if(y[j]<0) {  y[j]=0-y[j];   vy[j]*=-.9;}
      }
    }
  } 
}


