
int i=0;
int j=0;
int k=5;
int l=5;
int m=0;
int n=7;
int o=0;
int p=0;
int q=4;
int r=9;
int s=25;

void setup () {
  size (500,1000);
  background (255);
  smooth();
 
 noFill();
  while (j<2000){
   
    while (i<11){
    ellipse (i*50, j*50, 50, 50);
    i=i+1;
    }
    j=j+1;
    i=0;
  }
 
}

void draw (){
  fill (255, 0, 0);
  strokeWeight (1);
 while (l<2000){ 
   
 while (k<521){ 
 ellipse (k*5, l*2, 30, 30);
k=k+7;
}
l=l+20;
k=0;
 }
  
  noFill ();
  while (o<2000){
  
 while (m<521){
ellipse (m*3, o*5, 25, 25);
 m=m+9;
 }
 o=o+10;
 m=0;
  }
 
while (n<2000){
 ellipse (n, 64, 30, 30);
 n=n+45;
}

 strokeWeight (10);
 stroke (255);
 
 while (q<2000){
 
 while (p<521){
 ellipse (p*6, q, 50, 50);
 p=p+15;
 }
 q=q+75;
 p=0;
 }
 
 stroke (0);
 strokeWeight (1.5);

while (s<2000){
 
 while (r<521){
 ellipse (r, s, 40, 40);
 r=r+45;
 }
 s=s+50;
 r=0;
}

}
