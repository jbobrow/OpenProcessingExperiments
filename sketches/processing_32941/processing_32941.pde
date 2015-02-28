
int i=0;
int j=0;
int k=5;
int l=5;
int m=0;
int n=7;
int o=0;
int p=0;
int q=4;
int r=20;
int s=20;
int t=5;

void setup () {
  size (500,500);
  background (255,0,0);
  smooth();

 fill(0);
 stroke (255);
  while (j<11){
   
    while (i<11){
    ellipse (i*50, j*50, 50, 50);
    i=i+1;
    }
    j=j+1;
    i=0;
  }
  noFill();
  stroke (0);
 strokeWeight (4);
 while (q<521){
 
 while (p<521){
 ellipse (p*6, q, 10, 10);
 p=p+15;
 }
 q=q+80;
 p=0;
 }
 
}

void draw (){
 
  strokeWeight (5);
stroke (255);

while (s<521){
while (r<521){
ellipse (r, s, 20, 20);
r=r+30;
}
s=s+30;
r=20;
}

strokeWeight(3);
stroke (255);
while (t<521){
while (n<521){
 ellipse (n, t, 60, 60);
n=n+45;
}
t=t+63;
n=7;
}
  
  strokeWeight (2);
  stroke (0);
 while (l<521){ 
   
 while (k<521){ 
 ellipse (k*5, l*2, 30, 30);
k=k+7;
}
l=l+20;
k=0;
 }
  
  while (o<521){
  
 while (m<521){
ellipse (m*3, o*5, 25, 25);
 m=m+9;
 }
 o=o+10;
 m=0;
  }

}

