
boolean boton=false;
float w;
float b;
float z;
float q;
float col;
float cal;
float cul;
float a;
float k;
float u;
float g;

void setup(){
  size(400,400);
background(#0AFCDA);}

void draw(){
  if(boton==true){
  frameRate(12);
  col=random(255);
  cal=random(255);
  cul=random(255);
  fill(col,cal,cul);
  w=random(80,200);
  b=random(0,200);
  z=random(0,200);
  q=random(0,200);
rect(w,b,z,q);}
else
{ 
  col=random(255);
    cal=random(255);
    cul=random(255);
    fill(col,cal,cul);
    a=random(100,200);
    k=random(100,200);
    u=random(0,200);
    g=random(0,200);
    ellipse(a,k,u,g);}
    fill(#F218CB);
    stroke(0);
rect(0,10,40,40);}
   
    void mousePressed()
    {
      if (mouseX>0 && mouseX<40 && mouseY>0 && mouseY<40)
      {
        boton=!boton;
        fill(#0AFCDA);
        rect(0,0,400,400);
      }
    }

        
