
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
  if  (k==30) {
  direction = 0;
  }
  if (k==0) {
    direction=1;
  }
  if (direction==1){
    k=k+0.5;
  } else{
      k=k-0.5;
    }
    fill(255,100,100);
for(j=0;j<50;j++)
{
for(i=0;i<80;i++)
{
  dia=random(1,20);
  ellipse(k*i*20,k*j*20,dia,dia); 
}
}
}
