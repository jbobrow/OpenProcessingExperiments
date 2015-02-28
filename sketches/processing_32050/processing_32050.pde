
int a = 0;
int b = 0;
int c = 50;
int e = 40;
int f = 70;
int g = 50;
int h = 15;
int i = 65;
int j = 40;
int k = 40;
int l = 65;
int m = 15;
int n = 40;
int o = 40;
int p = 15;
int q = 90;
int r = 30;
int s = 100;

void setup(){
  size(1000,500);
  noStroke();
  background(0,54,71);
  
} 

void draw(){
 
 
 //righthand small dot
 fill(89,45,10,70);
 ellipse(i, j, h, h);
 
 //bottom small dot
 fill(89,45,10,80);
 ellipse(k, l, h, h);
 
 //lefthand small dots
 fill(89,45,10,200);
 ellipse(m,n, h, h);
 
  //top small dot
 fill(89,45,10,255);
 ellipse(e, p, h, h);
 
 //orange cirlces
 fill(212,106,13,60);
 ellipse(a, b, c, c);
 
  //bigger orange cirlces
 fill(212,106,57,60);
 ellipse(l, m, f, f );
 
  //Largest orange cirlces
 fill(242,216,167,30);
 ellipse(a, b, s, s);
 
 
  
 a = a + 50;
 e = e + 100;
 i = i + 100;
 k = k + 100;
 m = m + 100;
 q = q + 90;
 
 if(q>1000){
   q = 90;
   r = r + 100;}

 if(e>1000){
   e = 40;
   p = p + 100;}
 
 if(m>1000){
   m = 15;
   n = n + 100;}
 
 if(k>1000){
   k = 40;
   l = l + 100;}
 
 if(i>1000){
   i = 65;
   j = j + 100;}
 
 if(e>1000){
   e = 40;
   f = f + 100;}
 
 if(a>1000){
     
   a = 0;
   b = b + 50;}
   
 
}


