
float s;
float cell=20;
float ll=cell;


void setup(){
  size(800,400);
  background(255);  
}

void draw(){
  //background(255);
  fill(255,20);
  rect(0,0,width,height);
  for(int i=0; i<=width;i+=cell){
   for(int j=0; j<=height;j+=cell){
    s= dist(mouseX,mouseY,i,j);
    s=map(s,0,width,0,2*PI);
    
    stroke(0,150,255);
    strokeWeight(2);
    pushMatrix();
    translate(i,j);
    rotate(s);
    line(-ll/2,-ll/2,ll/2,ll/2);
    popMatrix();
   } 
  }
  
}


