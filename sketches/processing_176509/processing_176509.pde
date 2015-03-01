
int y = 0;
int j = 520;
int k = 520;
int l = 0;
int m = 0;
//circulos paralelos
int a = 0;
int b = 520;
int c = 520;
int d = 0;
int e = 0;
//circulos en x
int x = 0;
int z = 0;
int p = 520;
int q = -20;
void setup() {
size(500,500);
//Stroke();
background(255);
  

   
}
void draw(){
float value1 = random(100,80);
background(mouseX,mouseY);
//y
fill(random(255),random(255),random(255));
ellipse(250,y,50,50);
//j

fill(random(80),random(25),random(255));
ellipse(150,j,50,50);
//k

fill(random(0),random(0),random(255));
ellipse(350,k,50,50);
//l
fill(random(75),random(45),random(100));
ellipse(50,l,50,50);
//m
fill(random(255),random(200),random(200));
ellipse(450,m,50,50);
//circulos paralelos, a
fill(random(100),random(100),random(100));
ellipse(a,50,50,50);
//b
fill(random(255),random(255),random(255));
ellipse(b,150,50,50);
//c
fill(random(255),random(255),random(255));
ellipse(c,350,50,50);
//d
fill(random(255),random(255),random(255));
ellipse(d,250,50,50);
//e
fill(random(255),random(0),random(255));
ellipse(e,450,50,50);
//circulo en equis, x y z
fill(random(255),random(255),random(0));
ellipse(x,z,50,50);
//p y q
fill(random(255),random(255),random(255));
ellipse(x,z,50,50);
//declaracion de las variables
fill(random(150),random(150),random(150));
ellipse(p,q,50,50);
if(y<520){
  y=y+8;
}else if(y>500){
  y= -20;
}

//segundo circulo
if(j>-20){
  j=j-10;
}else if(j<0){
  j= 520;
}

//tercer circulo
if(k>-20){
  k=k-1;
}else if(k<0){
  k= 520;
}
//cuarto circulo
if(l<520){
  l=l+5;
}else if(l>500){
  l= -20;
}
//quinto circulo
if(m<520){
  m=m+20;
}else if(m>500){
  m= -20;
}
//circulos paralelos
if(a<520){
  a=a+15;
}else if(a>500){
  a= -20;
}
//b
if(b>-20){
  b=b-6;
}else if(b<0){
  b= 520;
}
if(c>-20){
  c=c-20;
}else if(c<0){
  c= 520;
}
if(d<520){
  d=d+4;
}else if(d>500){
  d= -20;
}
if(e<520){
  e=e+2;
}else if(e>500){
  e= -20;
}
//circulos en equis, x y z
if(x<520 && z<520){
  x=x+1; z=z+1; 
}else if(x>500 && z>500){
  x= -20; z= -20;
}
//p y q
if(p>-20 && q<520){
  p=p-1; q=q+1; 
}else if(p<0 && q>500){
  p= 520; q= -20;
}
}


