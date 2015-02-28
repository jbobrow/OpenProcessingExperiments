
float s;
float cell=20;


void setup(){
  size(800,400);
  background(255);
  
}
void draw(){
  background(255);
  
  for(int i=0; i<=width;i+=cell){
   for(int j=0; j<=height;j+=cell){
    s= dist(mouseX,mouseY,i,j);
    s=s/10;
    fill(0,150,255,40);
    noStroke();
    ellipse(i,j,s,s);
   } 
  }
  
}


