
int j;
int x=20;
int y=30;
int w=40;
int h=40;

void setup(){
  
  size(400,400);
 // shapes = new Shape[i];
  background(255);
}


void draw(){
 
  stroke(random(0,255),random(0,255),random(0,255),random(0,255));
  for(int i=0; i<100; i++){
  line(i,i+j,mouseX,mouseY);
  j++;
 }    
}

