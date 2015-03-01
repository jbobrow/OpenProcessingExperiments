
float a=0;
float b=0;

 void setup(){
  size(200,500);
  background(255);

}
 
void draw(){
  float r=random(0,a+1);
  float r2=random(0,b+1);
  
   noStroke();
   float r3 = r2 + random(60)-30;
  fill(r3,r + random(60)-30,r3);
  
  ellipse(r,r2,5,5);
  
  a+=1;
  b+=1;
}

