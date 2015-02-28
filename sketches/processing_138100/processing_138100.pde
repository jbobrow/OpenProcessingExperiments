
void setup(){
  size(400,400);
  smooth();
}
int x=100;
int speedx=10;
int y=0;
int speedy=7;
int z=50;
int speedz=4;
int i=150;
int j=-8;
int q=0;
int k=10;
int b=200;
int a=5;
int c=50;
int f=7;
int h=200;
int p=11;
void draw(){
  background(30);
  frameRate(30);
  noStroke();
  i=i+j;
  if((i<0)||(i>=500)){
    j=j*-1;
  }
  q=q+k;
  if((q<0)||(q>=500)){
    k=k*-1;
  }
  b=b+a;
  if((b<0)||(b>=500)){
    a=a*-1;
  }
  c=c+f;
  if((c<0)||(c>=500)){
    f=f*-1;
  }
    h=h+p;
  if((h<0)||(h>=500)){
    p=p*-1;
  }
  fill(60,180,i,200);
  float r=random (150,200);
  ellipse(200,x,130,130);
  x=x+speedx;
  if ((x<0)||(x>=450)){
    speedx=speedx*-1;
  }
  fill(60,180,i+100,200);
  ellipse(100,y,130,130);
  y=y+speedy;
  if ((y<0)||(y>=450)){
    speedy=speedy*-1;
  }
  fill(60,180,i-100,200);
  ellipse(300,z,130,130);
  z=z+speedz;
  if ((z<0)||(z>=450)){
    speedz=speedz*-1;
  }
  if (mousePressed==true){
    float m=random(0,400);
    stroke(255);
    strokeWeight(.5);
    line (0,210,200,i);
    line (0,215,200,i+5);
    line (0,220,200,i+10);
    line (0,225,200,i+15);
    line (0,230,200,i+20);
    line (0,235,200,i+25);
    line (0,240,200,i+30);
    line (400,210,200,i);
    line (400,215,200,i+5);
    line (400,220,200,i+10);
    line (400,225,200,i+15);
    line (400,230,200,i+20);
    line (400,235,200,i+25);
    line (400,240,200,i+30);
    //next set
    line (0,100,200,q);
    line (0,105,200,q+5);
    line (0,110,200,q+10);
    line (400,100,200,q);
    line (400,105,200,q+5);
    line (400,110,200,q+10);
    //third
    line (0,330,200,b);
    line (400,330,200,b); 
  // fourth
    line (0,25,200,c);
    line (400,25,200,c); 
   //fifth
    line (0,450,200,h);
   line (0,450,200,h+5);  
    line (400,450,200,h); 
    line (400,450,200,h+5); 
  }
}

