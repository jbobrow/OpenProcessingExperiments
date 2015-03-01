
void setup(){
  size(500,500);
}
void draw(){
  for(int i=0;i<20;i+=10){
rect(mouseX,mouseY,30,30);
fill(200,i,i*8,cos(i)*80);
noStroke();
  }
}


