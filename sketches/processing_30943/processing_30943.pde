
int n=1500;
float acc=0.3;
Particle[] p = new Particle[n];

void setup(){
  size(900,450);
  //frameRate(5);
  background(0);
  stroke(255);
  //strokeWeight(5);
  for(int i=0;i<n;i++){
    p[i] = new Particle();
  }  
}

void draw(){
  background(0);
  for(int i=0;i<n;i++){
    p[i].update();
  }    
}

void direction(Particle p,float mx,float my){
  float r0=150;
  float d=dist(mx,my,p.x,p.y);
  float dx=0,dy=0;
  
  if(d>r0){
    float r1=sqrt(d*d-r0*r0);
    float delta=sqrt((d+r0+r1)*(d+r0-r1)*(d-r0+r1)*(r0+r1-d))/4;
    //float x1=(mx+p.x)/2+(p.x-mx)*(r0*r0-r1*r1)/(2*d*d)+2*(my-p.y)/(d*d)*delta;
    //float x2=(mx+p.x)/2+(p.x-mx)*(r0*r0-r1*r1)/(2*d*d)-2*(my-p.y)/(d*d)*delta;
    //float y1=(my+p.y)/2+(p.y-my)*(r0*r0-r1*r1)/(2*d*d)-2*(mx-p.x)/(d*d)*delta;
    //float y2=(my+p.y)/2+(p.y-my)*(r0*r0-r1*r1)/(2*d*d)+2*(mx-p.x)/(d*d)*delta;
    dx=(mx+p.x)/2+(p.x-mx)*(r0*r0-r1*r1)/(2*d*d)-2*(my-p.y)/(d*d)*delta;
    dy=(my+p.y)/2+(p.y-my)*(r0*r0-r1*r1)/(2*d*d)+2*(mx-p.x)/(d*d)*delta;

    /*
    println("--------------------");
    println("mx:my="+mx+":"+my);
    println("x:y="+p.x+":"+p.y);
    println("d="+d);
    println("r1="+r1);
    println("x1:y1="+p.x1+":"+p.y1);
    println("x2:y2="+p.x2+":"+p.y2);
    println("vx:vy="+p.vx+":"+p.vy);
    */    
  }else if(d==0){
    dx=1;
    dy=1;
  }else if(d<r0){
    float a=atan(abs((p.y-my) / (p.x-mx)));
    dx=mx+r0*cos(a)*(p.x-mx)/abs(p.x-mx);
    dy=my+r0*sin(a)*(p.y-my)/abs(p.y-my);
  }else{
    dx=p.x;
    dy=p.y;
  }
  
  float a=atan( abs( (p.y-dy) / (p.x-dx)));
  float spd=dist(0,0,dx-p.x,dy-p.y);
  p.vx+=(dx-p.x)*acc/spd;
  p.vy+=(dy-p.y)*acc/spd;
  
  spd=dist(0,0,p.vx,p.vy);
  if(spd>5){
    p.vx=p.vx*5/spd;  
    p.vy=p.vy*5/spd;  
  }
}

class Particle{
  float x,y,vx,vy;
  boolean pressed = false;
  
  Particle(){
    x=random(900);
    y=random(450);
    vx=random(11)-5;
    vy=random(11)-5;
  }
  
  void update(){     
    if(mousePressed==true)
    {
      pressed = true;
      direction(this,mouseX,mouseY);
    }
    else
    {
      if(pressed==true){
        pressed = false;
        vx=random(11)-5;
        vy=random(11)-5;  
      }
    }
    
    x+=vx;
    y+=vy;
    
    if(x>width){
      vx*=-1;
      x=2*width-x;
    }else if (x<0){
      vx*=-1;
      x*=-1;
    }
    
    if(y>height){
      vy*=-1;
      y=2*height-y;
    }else if (y<0){
      vy*=-1;
      y*=-1;
    }
    point(x,y);
  }
}



