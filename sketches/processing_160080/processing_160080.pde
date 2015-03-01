

size(500,500);


int x=0;
int y=0;


while(x<width){
  while(y<height){
  float f=random(255); 
  float z=random(255); 
  float b=random(255);
  fill(b,f,z);
  rect(x,y,10,10);
  y=y+10;
  }
  x=x+10;
 y=0;
}
