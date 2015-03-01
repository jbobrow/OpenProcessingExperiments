
boolean boton=false;
float x;
float y;
float w;
float z;

float r;
float g;
float b;
void setup()
{
  size(600,600);
  background(#FF2C3A);
  fill(#FFC400);
    rect(200,540,200,40);
    stroke(0);
    rect(205,545,190,30);
   
}
void draw()
{
  if(boton==true){
 
    fill(r,g,b);
  
      rect(y,w,x,z);
      y=random(10,590);
  w=random(10,490);
  x=random(10,50);
  z=random(20,60);
  r=random(255);
  g=random(255);
  b=random(255);
  } else{
     
    fill(r,g,b);
  
      ellipse(y,w,x,z);
  y=random(10,540);
  w=random(10,520);
  x=random(10,50);
  z=random(20,60);
  r=random(255);
  g=random(255);
  b=random(255);
  }
  }
void mousePressed(){
  if(mouseY>540 && mouseY<580 && mouseX>200 && mouseX<400 ){
   background(#FF2C3A);
  fill(#FFC400);
    rect(200,540,200,40);
    stroke(0);
    rect(205,545,190,30);
    boton=!boton;
  }
  
  
}

