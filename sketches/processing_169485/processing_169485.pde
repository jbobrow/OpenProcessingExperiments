
boolean boton=false;
float a;
float c;
float d;
float e;
float f;
float h;
float i;
float j;
float r, g, b, k;
void setup()
{size (500,700);
background(#A9FAAA);
frameRate(5);}

void draw(){
  if (boton==true){
  a=random(0,3);
  strokeWeight(a);
  r=random(255);
  g=random(255);
  b=random(255);
  k=random(150,255);
  fill(r,g,b,k);
  float a;
  a=random(width);
  float c;
  c=random(height);
  float d;
  d=random(5,50);
  float e;
  e=random(5,50);
  rect(a,c,d,e); 
  }else{
  a=random(0,3);
  strokeWeight(a);
  r=random(255);
  g=random(255);
  b=random(255);
  k=random(150,255);
  fill(r,g,b,k);
  float f;
  f=random(width);
  float h;
  h=random(height);
  float i;
  i=random(5,50);
  float j;
  j=random(5,50);
  ellipse(f,h,i,j);}
  r=random(0);
  g=random(100,255);
  b=random(100,255);
  fill(r,g,b);
rect(50,650,400,50);}

void mousePressed(){
  if (mouseX>50 && mouseX<450 && mouseY>650 && mouseY<height){
    boton=!boton;
    background(#A9FAAA);
    rect(50,650,400,50);}
}


