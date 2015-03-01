
boolean change=false;
float x;
float y;
float w;
int r= #0AEFF9;
void setup()
{
  size(600,600);
  background( #09FB2D);
  fill( #06F38C);
    rect(0,560,600,40);
  
}
void draw()
{
  if(change==true){

    fill(r);
  r=r+1;
      rect(y,w,x,x);
      y=random(10,590);
  w=random(10,550);
  x=random(10,20);
  } else{
    
    fill(r);
  r=r+1;
      ellipse(y,w,x,x);
  y=random(10,590);
  w=random(10,550);
  x=random(10,20);
  }
  }
void mousePressed(){
  if(mouseY>560 && mouseX>0 && mousePressed){
    background( #09FB2D);
    fill( #06F38C);
    rect(0,560,600,40);
    change=!change;
  }
}
