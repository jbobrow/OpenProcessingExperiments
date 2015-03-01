
boolean boton=false;
 int x,y;
 float a,b,c,d,e,f,i,j,k,l,m,n,o,p; 
 
void setup(){
   size(300,600);
   background(255);
}

void draw(){

   
  if(boton==true){
    
 
    stroke(x);
  x=x+500;
  
 strokeWeight(8);
  a=random(5);
  b=random(240);
  c=random(250);
  fill(a,b,c);
  
  d=random(0,300);
  e=random(0,400);
  f=random(0,45);
  i=random(0,45);
  rect(d,e,f,i);
  
}else{
    
     stroke(y);
  y=y+500;
  strokeWeight(8);
  
  j=random(229);
  k=random(44);
  l=random(183);
  fill(j,k,l);
  
  m=random(0,300);
  n=random(0,400);
  o=random(0,45);
  p=random(0,45);
  ellipse(m,n,o,p);

  stroke(#A20000);
  strokeWeight(5);
  fill(#CE1D1D);
  rect(100,450,100,50);
}
}
  void mousePressed(){
   if(mouseX>100&&mouseX<200 && mouseY>450&& mouseY<500){
    boton=!boton;
    stroke(255);
    fill(255);
    rect(0,0,300,445);
    
   }
  } 
