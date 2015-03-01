
float a;
float b1;
float c;
float d;
float m;
float n;
float o;
float p;
float r;
float g;
float b;
boolean boton=false;
void setup(){
  size(600,600);
  background(#C76AF0);
  frameRate(5);
  fill(#FF0808);
  ellipse(60,60,60,60);
}
void draw(){
  if(boton==true){
   a=random(width);
b1=random(height/2);
c=random(40);
d=random(50);
r=random(100);
g=random(150);
b=random(200);
fill(r,g,b,200); 
rect(a,b1,c,d);
m=random(width);
n=random(height/2,height);
o=random(50);
p=random(40);
fill(r,g,b,200);
ellipse(m,n,o,p);
  }
  else{ 
  //fill(#C76AF0);
  //rect(0,0,width,height);
  // fill(#FF0808);
    //ellipse(60,60,60,60);
     m=random(width*1/6,width);
n=random(height*1/6,height);
o=random(100);
p=random(90);
fill(r,g,b,200);
ellipse(m,n,o,p);
  }
}


   void  mousePressed(){
     if(mouseX>40 && mouseX<96 && mouseY>40 && mouseY<100){
       boton=!boton;
        fill(#C76AF0);
       rect(0,0,width,height);
       fill(#FF0808);
       ellipse(60,60,60,60);
     } 
  }
