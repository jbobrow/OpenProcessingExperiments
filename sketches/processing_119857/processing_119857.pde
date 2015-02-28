
int i;
int j;
float k;
int direction;
float dia;
void setup()
{
  size(400,400);
}
void draw()
{
 
 background(0);
  if  (k>10) {
  direction = 0;
  }
  if (k<0) {
    direction=1;
  }
  if (direction==1){
    k=k+0.8;
    
  } else{
      k=k-0.3;
    }
    fill(225,225,0);
    stroke(225,225,0);
    
for(j=0;j<50;j++)
{
for(i=0;i<80;i++)
{
  dia=random(1,10);
   
  line(i*10,j*20,j*20,j*20);
  line(i*20,0,i*20,500);
  ellipse(i*20,j*20,k,k);
}
}
}
