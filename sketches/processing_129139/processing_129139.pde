
int a = 0;
int b = 0;
int c = 0;
int d = 600;
int e = 0;
int f = 0;
int g = 600;
int h = 0;
int i = 300;
int j = 0;
int k = 600;
int l = 300;
int m = 300;
int n = 0;
int o = 0;
int p = 300;

PImage smile;

void setup(){
 size(600,600);
 background(0);
 
 
}

void draw(){
  stroke(#77FF17,100);
  strokeWeight(2);
 if(a<600){
  line(0,b,a,600);
  a=a+10;
  b=b+10;
 } 
if (c<600){
 line(d,0,0,c);
 c=c+10;
 d=d-10;
}
if (e<600){
 line(f,0,600,e);
 f=f+10;
 e=e+10;
}
if (g>0){
 line(600,h,g,600);
 g=g-10;
 h=h+10;
}
if(i<600){
 line(i,j,k,l);
 i=i+7;
 j=j+7;
 k=k-7;
 l=l+7;

}
if(m>0){
 line(m,n,o,p);
 m=m-7;
 n=n+7;
 o=o+7;
 p=p+7;
}


}


