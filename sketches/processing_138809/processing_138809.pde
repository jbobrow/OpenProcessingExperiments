
float x = 0;
float y;
float y1;
int c = 0;
int c1 = 1;
float x2 = -1;
float y2;
float y3;
float xa = -2;
float ya;
float yaplus;
float cirx = 0;
float ciry = 220;
int cirs = 20;
int r2 = 20;
float n = 2;
float t = 1;

void setup(){
  size(400,400);
  background(255);
}

void draw(){
  noStroke();
  fill(c,0,0);
  rect(x,0,1,y);
  
  c=c+c1;
  if(c>255){
    c1=c1*-1;
  }
  y2=height-x2;
  y3=height-(x2+1);
  if(x2>250){
  stroke(0);
  }
  //line(x2,y2,x2+1,y3);
  x2=x2+1;
  noStroke();
  fill(50,75,c);
  rect(x2,y2,2,height-y2);
  y=0.01*pow((x-100),2);
  y1=0.01*pow(((x+1)-100),2);
  
  line(x,y,x+1,y1);
  noStroke();
  fill(c,c,c);
  rect(x,y,2,height-y);
  x=x+1;
  
  fill(0,2*c,0);
  ya=xa+250;
  rect(xa,ya,2,height-ya);
  xa=xa+1;
  for(int i =0; i<30;i++){
    
    noStroke();
    if((t/2) == n){
    fill(255);
    n=n+1;
    } else {
      fill(0);
    }
    ellipse(cirx,ciry,r2,r2);
    cirx=cirx+cirs;
   ciry=0.008*pow((cirx-150),2)+40;
    
    t=t+1;
  }
  cirx=0;
}
