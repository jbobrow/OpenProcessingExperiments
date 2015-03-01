
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
  fill(r2,r,r2);
  
  ellipse(r,r2,5,5);
  
  a+=1;
  b+=1;
}



