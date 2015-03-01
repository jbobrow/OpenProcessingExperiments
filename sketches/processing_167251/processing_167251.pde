
float bx;
float by;
float bxspeed = 1;
float byspeed = 2;
float r = 30;

void setup(){
  size(700, 200);
  smooth();
  background(0);
  
   bx = width/2;;
   by = height/2;
   fill(125, 10);
   stroke(0, 10);
}

void draw(){
 

 
  bx += bxspeed;
  by += byspeed;
  
  if(bx > width-r||bx < r){
    byspeed -= random(1, 3);
    bxspeed *= -1;
  }
  if(by >= height-r||by < r){
    byspeed *= -1;
    fill(random(255), random(255), random(255), 10);
  }
    ellipse(bx, by, r, r); 
    ellipse(bx+10,by-20, r,r); 
}
  


