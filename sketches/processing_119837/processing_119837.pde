
int i;
int j;
float k=14;
int direction;
void setup()
{
  size(500,500);
  rectMode(CENTER);
  noStroke();
}
void draw()
{
 
  background(0);
  
  if(k == 0) {
      direction = 1;
      fill(199,12,13);
  } else if(k == 125) {
      direction = 0;
      fill(135,24,24);
  }
  
  if(direction == 1) {
    k=k+0.5;
  } else {
    k=k-0.5;
  }
  
 
  
  
  
  for(j=1;j<8;j++) {
      for(i=2;i<8;i++) {
          if (j%2==0){
              rect(k*0.5*i,j*60,i*5,i*5);
          } else {
              rect(k*0.4*i,j*60,(9-i)*5,(9-i)*5);
          }
      }
  }
  
//println(mouseX);
  }
  
