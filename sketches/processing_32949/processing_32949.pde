
int i=0;
int j=0;
int k=5;
int l=5;
int m=0;
int n=7;
int o=0;
int p=0;
int q=4;
int r=0;
int s=100;

void setup () {
  size (500,1000);
  background (255,0,0);
  smooth();

 
  while (j<500){
   
    while (i<11){
    ellipse (i*50, j*50, 50, 50);
    i=i+1;
    }
    j=j+1;
    i=0;
  }
 noFill();
 strokeWeight (2);
 while (q<1000){
 
 while (p<521){
 ellipse (p*6, q, 10, 10);
 p=p+13;
 }
 q=q+37;
 p=0;
 }
 
}

void draw (){
  
  strokeWeight (1);
 while (l<1000){ 
   
 while (k<521){ 
 ellipse (k*5, l*2, 30, 30);
k=k+7;
}
l=l+20;
k=0;
 }
  
  while (o<1000){
  
 while (m<521){
ellipse (m*3, o*5, 25, 25);
 m=m+9;
 }
 o=o+10;
 m=0;
  }
 
while (n<1000){
 ellipse (n, 64, 30, 30);
 n=n+45;
}

strokeWeight (1);
stroke (255,255, 255);
while (r<2500){
ellipse (0,0,r,r);
r=r+10;
}

strokeWeight (1);
//stroke (0,0,0);
while (s<2500){
ellipse (0,1000,s,s);
s=s+25;
}

}               
