
int i=0;
 
void setup()
{
size(500,500);
}
 
void draw() {
  background (225,205,255);
   
  for(int i=0;i<500;i=i+10)
  {
    float a=random(500);
    float b=random(400);
    float c=random(200);
    float opacity=random(60);
     
    frameRate(8);
  
    strokeWeight(b);
    stroke(a,b,c);
     
    float d=random(10);
    
    ellipse(250,250,d-100,d-100);
    fill(a,a,a);
    
    line(a,a,1,1);
  }
}



