

boolean gameStart = false;
 float x1=250,y1=250,r=40,dx1=-12,dy1=-8;
 int alto=150; 
void setup() {
  frameRate(20);
  size(700, 500);
  smooth();
  noStroke(); 
}
 
void draw() {
  background(0);
  fill(0,255,0);
  rect(350,r,1,520-2*r);
  fill(0,255,0);
  rect(width-40, mouseY-alto/2,20,alto);
  fill(0,255,0);
  rect(20, y1-alto/2,20,alto);
  fill(0,255,0);
  rect(x1,y1,20,20);
   if (gameStart) {
  x1=x1+dx1;
  y1=y1+dy1;
  
  if (x1 > width) {
      gameStart = false;
      x1 = 250;
      y1 = 250;
      dx1=-12;
      dy1=-8;
      
    }
  
    if(x1>width-60 && x1<width-50 && y1> mouseY-alto/2 && y1<mouseY+alto/2 ){
    dx1=-dx1*1.2;
  }
   if(x1<r){
    dx1=-dx1;
     }
     
     if(y1>height-r||y1<r)
     {
       dy1=-dy1;
     }
    
}
}
void mousePressed() {
  gameStart = !gameStart;
}

