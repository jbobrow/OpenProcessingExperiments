
ParticleSystem Particles = new ParticleSystem();

float MA=0.96;

void setup(){
  size(600,600);
  frameRate(60);
  Particles.damping=.995;
}
void draw(){
  background(0);
  if (mousePressed==true){
    if (mouseButton==RIGHT){
      for (int i=0;i<Particles.isize;i++){
        float ang=atan2((Particles.x[i]-mouseX),(Particles.y[i]-mouseY));
        float dist=sqrt(pow(Particles.x[i]-mouseX,2)+pow(Particles.y[i]-mouseY,2));
        Particles.ax[i]= -sin(ang+.1)*.2;
        Particles.ay[i]= -cos(ang+.1)*.2;
        
        if(dist<100){
          float bulletAng=atan2(Particles.vx[i],Particles.vy[i]);
          int r=round(MA*red(Particles.colour[i])+(1-MA)*(0.5+0.5*cos(bulletAng))*255);
          int g=round(MA*green(Particles.colour[i])+(1-MA)*(0.5+0.5*cos(bulletAng+2*PI/3))*255);
          int b=round(MA*blue(Particles.colour[i])+(1-MA)*(0.5+0.5*cos(bulletAng+4*PI/3))*255);
          Particles.colour[i]=color(r,g,b,255);
          Particles.damping=.99;
        }
      }
    } 
    if (mouseButton==LEFT){
      Particles.addParticle(1,mouseX,mouseY);
      Particles.colour[Particles.isize-1]=color(random(255),random(255),random(255),255);
    }
  }else {
      for (int i=0;i<Particles.isize;i++){
        Particles.ax[i]=0;
        Particles.ay[i]=0;
        Particles.damping=1;
      }
  }
  
  Particles.update();
}


class ParticleSystem { 
  float[] x = new float[0]; 
  float[] y = new float[0]; 
  float[] vx = new float[0]; 
  float[] vy = new float[0]; 
  float[] ax = new float[0]; 
  float[] ay = new float[0]; 
  color[] colour = new color[0];
  int[] psize = new int[0];
  int isize = 0;
  float damping = 1;
  float surface = 1;
  boolean collision = true;
  
  ParticleSystem () {  
  } 
  
  void addParticle (int i, int a, int b) {  
    x = expand(x,isize+i);             for(int j=isize;j<i+isize;j++){x[j]=a;}
    y = expand(y,isize+i);             for(int j=isize;j<i+isize;j++){y[j]=b;}
    vx = expand(vx,isize+i);           for(int j=isize;j<i+isize;j++){vx[j]=0;}
    vy = expand(vy,isize+i);           for(int j=isize;j<i+isize;j++){vy[j]=0;}
    ax = expand(ax,isize+i);           for(int j=isize;j<i+isize;j++){ax[j]=0;}
    ay = expand(ay,isize+i);           for(int j=isize;j<i+isize;j++){ay[j]=0;}
    colour = expand(colour,isize+i);   for(int j=isize;j<i+isize;j++){colour[j]=color(255,255);}
    psize = expand(psize,isize+i);     for(int j=isize;j<i+isize;j++){psize[j]=10;}
    isize+=i;
  } 
  void removeParticle (int i) {  
    x = subset(x,i);     
    y = subset(y,i);    
    vx = subset(vx,i);  
    vy = subset(vy,i); 
    ax = subset(ax,i);   
    ay = subset(ay,i);   
    colour = subset(colour,i); 
    isize-=i;
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
      strokeWeight(psize[j]);
      point(x[j],y[j]);
      
      if(collision==true){
        if(x[j]>width){  x[j]=width-(x[j]-width);  vx[j]*=-surface;}
        if(y[j]>height){  y[j]=height-(y[j]-height);  vy[j]*=-surface;}
        if(x[j]<0) {  x[j]=0-x[j];   vx[j]*=-surface;}
        if(y[j]<0) {  y[j]=0-y[j];   vy[j]*=-surface;}
      }
    }
  } 
}


