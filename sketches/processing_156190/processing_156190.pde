
float a ;
float b;
float c;
float d;
float e;
float f;
float g;
float h;
float i;
float j;
boolean k;
boolean l;
boolean m;
boolean n;
boolean o;


void setup(){
  size (800,600);
  fill (0);
  smooth();
  a=width/6 ;
  c=width/3;
  e=width/2;
  g=width*2/3;
 i=width*5/6;
 k= true;
 l= true;
 m= true;
 n= true;
 o= true;
 
}

void draw(){
  background(255);
  
  
  ellipseMode(CENTER);
  fill(123,23,52);
  noStroke();
  ellipse(a,b,20,20);
  fill(213,23,152);
  ellipse(c,d,20,20);
  fill(123,123,52);
  ellipse(e,f,20,20);
  fill(123,23,152);
  ellipse(g,h,20,20);
  fill(123,223,52);
  ellipse(i,j,20,20);
  stroke(153);
  line(a,b,c,d);
  line(c,d,e,f);
  line(e,f,g,h);
  line(g,h,i,j);
  
  if(mouseX>a-10 && mouseX<a+10){
    b=random(100,500);
    d=random(200,400);
    l= false;
  }else if(k){
    b=random(290,310);
  }
   if(mouseX>c-10 && mouseX<c+10 ){
    d=random(100,500);
    b=random(200,400);
    f=random(200,400);
    k= false;
    m= false;
  }else if(l){ 
    d=random(290,310);
  }
   if(mouseX>e-10 && mouseX<e+10 ){
    f=random(100,500);
    d=random(200,400);
    h=random(200,400);
    l= false;
    n= false;
  }else if(m){
    f=random(290,310);
  }
   if(mouseX>g-10 && mouseX<g+10 ){
    h=random(100,500);
    f=random(200,400);
    j=random(200,400);
    m= false;
    o= false;
  }else if(n){
    h=random(290,310);
  }
   if(mouseX>i-10 && mouseX<i+10  ){
    j=random(100,500);
    h=random(200,400);
    n=false;
  }else if(o){
    j=random(290,310);
  }
  
}




  
