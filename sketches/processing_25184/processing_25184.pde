
float a;
float y;
float aspeed = +5;
float yspeed = -31;
 
void setup(){
  size(500,500);
  background(0);
  a=90;
  y=45;
  
}
 
void draw(){
   
  if(y >= 500-10){
    yspeed = yspeed * -1;
  }
   
  if (y<=0+10){
  yspeed = yspeed * -1;
}
 
if(a >= 500-10){
    aspeed = aspeed * -1;
  }
   
  if (a<=0+10){
  aspeed = aspeed * -1;
}
   
  a= a + aspeed;
  y= y + yspeed;
  noStroke();
  fill(a,random(255),random(255),random(20));
  ellipse(a,y,random(50),random(50));
  fill(y,random(100),random(100),random(30));
  rect(y,a, random(100),random(100));
   fill(0);
  ellipse(a,y,random(10),random(15));
}
 
                
