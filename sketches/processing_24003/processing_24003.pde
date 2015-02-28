
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
  
  if(y >= 500-45){
    yspeed = yspeed * -1;
  }
  
  if (y<=0+45){
  yspeed = yspeed * -1;
}

if(a >= 500-45){
    aspeed = aspeed * -1;
  }
  
  if (a<=0+45){
  aspeed = aspeed * -1;
}
  
  a= a + aspeed; 
  y= y + yspeed;
  noStroke();
  fill(a,random(255),random(255),random(100));
  ellipse(a,y,random(90),random(90));

}

                
                
