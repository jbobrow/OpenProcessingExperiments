
float s;
float cell=15;
float ll=cell;

float r=20;
float xp;
float yp;
float xs=5;
float ys=5;

void setup(){
  size(800,400);
  background(255); 
 
   xp=width/2;
  yp=height/2; 
}

void draw(){
  //background(255);
  fill(255,20);
  rect(0,0,width,height);
  
  xp+=xs;
  yp+=ys;
    if(xp>width || xp<0){
   xs*=-1 ;
  }
  if(yp>height || yp<0){
     ys*=-1;
  }
  
  
  for(int i=0; i<=width;i+=cell){
   for(int j=0; j<=height;j+=cell){
    s= dist(xp,yp,i,j);
    s=map(s,0,width,0,2*PI);
    
    stroke(0,150,255,60);
    strokeWeight(2);
    pushMatrix();
    translate(i,j);
    rotate(s);
    line(-ll/2,-ll/2,ll/2,ll/2);
    popMatrix();
   } 
  }
  
    noStroke();
  fill(250,43,143,200);
  ellipse(xp,yp,r,r);
  
}


