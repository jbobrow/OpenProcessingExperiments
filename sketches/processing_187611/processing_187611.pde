
Chain[] links = new Chain[5];

void setup(){
  //size of sketch, initial bgcolor
  size(800,800);
  background(0);

   for(int i = 0; i < links.length; i++){
   links[i] = new Chain();
  }

   
}

void draw(){
  background(0);
  


if(mousePressed == false){

stroke(100);
strokeWeight(3);
noFill();
beginShape();

line(links[0].fx,links[0].fy,links[1].fx,links[1].fy);
line(links[2].fx,links[2].fy,links[3].fx,links[3].fy);
stroke(0);

strokeWeight(5);

for (int i = 0; i <= 10; i++) {
  float x = lerp(links[0].fx, links[1].fx, i/10.0);
  float y = lerp(links[0].fy,links[1].fy, i/10.0);
  point(x, y);
}

for (int i = 0; i <= 10; i++) {
  float x = lerp(links[2].fx, links[3].fx, i/10.0);
  float y = lerp(links[2].fy,links[3].fy, i/10.0);
  point(x, y);
}

noStroke();
fill(100);
ellipse(links[1].fx,links[1].fy,15,15);
ellipse(links[2].fx,links[2].fy,15,15);

}

stroke(255);
strokeWeight(5);
beginShape();


 for(int i = 0; i < links.length; i++){      
   if(i == 0){
     links[i].update(mouseX,mouseY);
     noFill();
     vertex(links[i].fx,links[i].fy);     
   }else{    
     links[i].update(links[i-1].x2,links[i-1].y2);    
       if(i%3 == 0){    
     bezierVertex(links[i-2].fx,links[i-2].fy,links[i-1].fx,links[i-1].fy,links[i].fx,links[i].fy);
       }else{    
     
       }
   }  
 }

endShape();


if(mousePressed == false){
noStroke();
fill(255);
ellipse(links[0].fx,links[0].fy,25,25);
ellipse(links[3].fx,links[3].fy,25,25);
}

  
}

class Chain{
  float x,y,x2,y2,d,fx,fy,fx2,fy2,angle;
  
  float deltax, deltay, ddd;

  float easing = .5;

  Chain(){
  x = 0;
  y = 0;
  
  x2 = 0;
  y2 = 0;
  
  d = 50;
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

//d = map(fy,0,height,.1,35);

  }
  
  void display(){

   

//noFill();
fill(0);
strokeWeight(7);
stroke(180,255,15,128);
pushMatrix();
translate(fx,fy);
rotate(radians(-270+angle));
//triangle(0,0,d*2,d*2,-d*2,d*2);
popMatrix();
//fill(255,0,0);
//ellipse(fx2,fy2,d*2,d*2);

  }
  
}


