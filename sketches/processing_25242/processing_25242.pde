
int x =10;
int y =0;
float z =0.5;
void setup () {
  background (0);
  size (350,350);
  smooth();
}
 
void draw(){
   
  fill(y,0,0,90);
  ellipse (0,0,x,x);
  
  fill(y,50,50,90);
  ellipse (30,40,x,x);
  
   fill(0,0,y,90);
  ellipse (500,500,x,x);
  
  fill(20,30,y,90);
  ellipse (400,300,x,x);
   
  fill(y,y,0,90);
  ellipse (240,0,x,x);
  
  fill(y,y,30,50);
  ellipse(180,90,x,x);
   
  fill(0,y,0,90);
  ellipse (0,500,x,x);
   
    fill(y,0,y,90);
  ellipse (250,0,x,x);
  
   fill(z,0,y,90);
  ellipse (0,250,x,x);
   
  fill(0,y,y,90);
  ellipse (500,250,x,x);
   
  fill(z,y,0,90);
  ellipse (250,500,x,x);
   
   
  y=y+1;
  x=x+2;
  z=z+0.5;
 
}        
