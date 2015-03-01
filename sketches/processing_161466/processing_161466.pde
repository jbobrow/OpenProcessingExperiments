
// By Antoine DERRIEY ;)

float x,y,l,h;

void setup(){
  size(600,600);
  background(0,0,210);

x=0;
y=0;
l=50;
h=50;

 stroke(255,255,255,210);
 strokeWeight(10);
  smooth();
  rectMode(CENTER);
  
}


void draw() {
 
fill(230,0,0,80);

  for (int t=0; t<width; t+=20){ 
    x= x+20;
  
    
     
 rect(x,t,l,h) ;
}
  
  

}





