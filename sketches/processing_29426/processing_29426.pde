
void setup(){
  size(255,255);
 }
void draw(){
  background(0);
  ellipseMode(CENTER);
  int cir=255;

  while(cir>0){
   noStroke();
      float distance=abs(mouseX-cir);
     
    fill(distance);
       
    ellipse(width/2,height/2,cir,cir);
    cir-=10;
  }
}

