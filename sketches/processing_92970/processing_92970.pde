

float k=0;
float l=0;
float m=0;
float n=0;
float o=0;
float p=0;
float q=0;
void setup(){
  size(255,255);
    textAlign(CENTER, CENTER);
}
void draw(){
  smooth();
  background(0);
  for(int i=0;i<255;i=i+20){
    for(int j=0;j<255;j=j+20){
      stroke(255,255,0,k);
      point(i,j);
    }
  }
  k=k+1.5;
  if (k>235){
    l=l+1.5;
     for(int a=10;a<255;a=a+20){
    for(int b=10;b<255;b=b+20){
      stroke(255,160,0,l);
      point(a,b);
    }
     }
  }   
  if(l>225){
  m=m+3;
  for(int x=5;x<255;x=x+10){
    for(int y=5;y<255;y=y+10){
      stroke(255,90,0,m);
      point(x,y);
    }
  }
}
 if(m>200){
  n=n+2;
  for(int c=0;c<255;c=c+10){
    for(int d=0;d<255;d=d+10){
      stroke(255,20,0,n);
      point(c,d);
    }
  }
 }
 if(n>180){
  o=o+5;
  for(int e=5/2;e<255;e=e+5){
    for(int f=5/2;f<255;f=f+5){
      stroke(255,0,20,o);
      point(e,f);
    }
  }
 }
  if(o>150){
  p=p+10;
  for(int g=0;g<255;g=g+5){
    for(int h=0;h<255;h=h+5){
      stroke(255,0,20,p);
      point(g,h);
    }
  }
  }
  if(p>70){
    q=q+50;
     fill (255,q);
      text("heat | tejo",width/2,height/2);
  }
}

void mousePressed() {
 k=0;
 m=0;
 n=0;
 o=0;
 p=0;
 q=0;
}
    





