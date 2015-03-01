
Chain[] links = new Chain[25];

void setup(){
  //size of sketch, initial bgcolor
  size(800,800);
  background(0);

   for(int i = 0; i < links.length; i++){
   links[i] = new Chain();
  }

   
}

void draw(){
  //background(0);
  
  fill(0,5);
  noStroke();
  rect(0,0,width,height);

 for(int i = 0; i < links.length; i++){      
   if(i == 0){
     
     
     links[i].update(mouseX,mouseY);
     
     
   }else{
     
    
   links[i].update(links[i-1].x2,links[i-1].y2);   
     
   }
   links[i].display();
 }

  
}

class Chain{
  float x,y,x2,y2,d,fx,fy,fx2,fy2,angle;
  
  float deltax, deltay, ddd;

  float easing = .1;

  Chain(){
  x = 0;
  y = 0;
  
  x2 = 0;
  y2 = 0;
  
  d = 5;
  }
  
  void update(float tx, float ty){
  
  x = tx;
  y = ty;
  
  deltax = x-x2;
  deltay = y-y2;
  
  ddd = dist(x,y,x2,y2);

if(dist(x,y,x2,y2) > d){

//  if(deltax > 0){

if(deltax > 0 + d){
    x2 += ddd/2-d;
  }


  if(deltay > 0 + d){
    y2 += ddd/2-d;
  }

  if(deltax < 0 - d){
    x2 -= ddd/2-d;
  }

  if(deltay < 0 - d){
    y2 -= ddd/2-d;
  }
}

fx += (x - fx) * easing;
fy += (y - fy) * easing;
fx2 += (x2- fx2) * easing;
fy2 += (y2 - fy2) * easing;

angle = atan2(deltay, deltax) * 180 / PI;

d = map(fy,0,height,.1,35);

  }
  
  void display(){

   

//noFill();
fill(0);
strokeWeight(7);
stroke(180,255,15,128);
pushMatrix();
translate(fx,fy);
rotate(radians(-270+angle));
triangle(0,0,d*2,d*2,-d*2,d*2);
popMatrix();
//fill(255,0,0);
//ellipse(fx2,fy2,d*2,d*2);

  }
  
}


