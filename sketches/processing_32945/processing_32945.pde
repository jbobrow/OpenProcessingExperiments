
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

void setup () {
  size (500,1000);
  background (255);
  smooth();
 fill(255, 0, 0);
 
  while (j<500){
   
    while (i<11){
    ellipse (i*50, j*50, 50, 50);
    i=i+1;
    }
    j=j+1;
    i=0;
  }

}

void draw (){
  
  fill (255);
   strokeWeight (2);
   
 while (q<1000){
 
 while (p<521){
 ellipse (p*6, q, 25, 25);
 p=p+6;
 }
 q=q+45;
 p=0;
 }
 
  noFill ();
  strokeWeight (1);
 while (l<1000){ 
   
 while (k<521){ 
 ellipse (k*5, l*2, 30, 30);
k=k+7;
}
l=l+20;
k=0;
 }
  fill(255);
  while (o<1000){
  
 while (m<521){
ellipse (m*3, o*5, 25, 25);
 m=m+9;
 }
 o=o+10;
 m=0;
  }

noFill();
while (r<1000){ 
 
while (n<521){
 ellipse (n, r*8, 30, 30);
 n=n+45;
}
r=r+3;
n=0;
}



}                               
