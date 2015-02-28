
void setup(){
  size(400,400);
  
}
int x=1;
int xChange=1;

void draw(){
  background(0);
  noFill();
  stroke(255);
  smooth();
  ellipse(200,200,100,100);
  
  if(x>30||x<-70){
   xChange*=-1;
  }
  x+=xChange;
  
  for(int i=0;i<80;i++){
    line(150+x-i*10,200,235+x+i*10,165-i*10);
    line(150+x-i*10,205,235+x+i*10,235+i*10);
    line(200+x+i*7,200,235+x+i*10,170-i*10);
    line(200+x+i*7,200,235+x+i*10,235+i*10); 
  }
}
