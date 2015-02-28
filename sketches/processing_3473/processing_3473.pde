
float sep,nn,r,f,n,N; 
 
void setup(){ 
  n=0;
  r=0;
  sep = 5; 
  nn = 30; 
  size(500, 500); 
  smooth(); 
  noCursor();
} 
 
void draw(){ 
  n+=0.01;
  r+=0.001;
  background(0); 
  N=noise(n);
  for(float y =sep; y <= 400; y += nn){ 
    for(float x = sep+10; x <= 400; x += nn){ 
     f = dist(mouseX+135, mouseY+190, x, y); 
     translate(mouseX-115,mouseY-190); 
     rotate(r); 
     fill(150,220,10,50); 
     rectMode(CENTER); 
     rect(x,f,30,20); 
     fill(40,120,30,60); 
     rect(f,y,60,40); 
     noStroke(); 
     fill(60,140,50,130);  
     rect(f,f,15,15); 
     fill(#93FF86,170); 
     rect(f,mouseY,5,5); 
     ellipse(200,200,mouseX-125,N*8); 
    }   
    } 
  } 
 

 
 
 
 
 

