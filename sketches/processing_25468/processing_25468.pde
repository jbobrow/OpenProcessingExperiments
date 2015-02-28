
int x =20;
int y =0;
float z =5;
void setup () {
  background (0);
  size (800,900);
  smooth();
}
  
void draw(){
    noStroke();
  fill(10,0,0,90);
  ellipse (0,0,20,x);
   
  fill(60,50,50,90);
  ellipse (30,40,x,x);
   
   fill(50,10,y,90);
  ellipse (500,500,x,x);
   
  fill(20,30,y,90);
  ellipse (400,300,x,x);
    
  fill(205,50,0,90);
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
    
  fill(60,180,0,90);
  ellipse (250,500,x,x);
    
    
  y=y+20;
  x=x+10;
  z=z+15;
}
                
                                
