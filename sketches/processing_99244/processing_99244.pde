
int i=0;
 
void setup()
{
size(500,500);
  background (255);
}
 
void draw() {

   
  for(int i=0;i<500;i=i+150)
  {
    float h=random(500);
    float j=random(500);
    float k=random(100,300);
    float col1=random(155,255);
    float col2=random(155,255);
    float col3=random(155,255);
    float opacity=random(70,100);
     
    frameRate(6);
     
    ellipse(h,j,k,k);
    strokeWeight(10);
    stroke(col2,col3,col1,opacity);
    fill(col3,col1,col2,opacity);
   
     
  }
   
}
