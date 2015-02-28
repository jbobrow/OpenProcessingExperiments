
//hell yeah
//with a little help from noah



Threeangle t1,t2,t3;

void setup(){
  size(1200,750);
  background(0);
  smooth();
  noStroke();
  //for(int i = 0; i < 100; i+=.4){
    //this slowed down the sketch for some reason, don't understand why...
  t1 = new Threeangle(100,100,80,20,120,200);
  t2 = new Threeangle(800,200,160,40,200,380);
   t3 = new Threeangle(50,100,160,100,600,280);
  //}
}

void draw(){
 // background(0);
  t1.move();
  t1.display();
  t2.move();
  t2.display();
   t3.move();
  t3.display();
}





class Threeangle{
  
  
  float x1,y1,x2,y2,x3,y3,distance1,distance2,distance3;
  
  Threeangle(float _x1,float _y1, float _x2, float _y2, float _x3, float _y3){
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    x3 = _x3;
    y3 = _y3;
    
    //distance1 = dist(x1, y1, mouseX, mouseY);
    
    //distance2 = dist(x2, y2, mouseX, mouseY);
    
    //distance3 = dist(x3, y3, mouseX, mouseY);
    
  }
    
    
 void move(){
   float snap = dist(x1,y1,x2,y2);
   float easing = 0.07;
   snap ++;
   if (dist(mouseX, mouseY, x1, y1)<=100){
     y1 --;
     x2-=.5;
     y2-=1;
     x3-=.5;
     y3 -= 10;
   }else{ snap --; }
    if (dist(mouseX, mouseY, x2, y2)<=50){
     y1 ++;
     x2 ++;
     y2 ++;
     x3-=1.3-((dist(x2,y2,mouseX,mouseY)/10));
     y3-=.5;
   }
   
   if (dist(mouseX, mouseY, x3, y3)<=50){
     y1 += 2;
     x3 --;
     y3 ++;
     x2--;
     y2-=.5;
     
   }
   //if(dist(x1,y1,x2,y2)>200){
    // x1 = (y2 - (dist(x2,y2,x3,y3)/2.2)*easing);
  //   y1 = x2 - (dist(x2,y2,x3,y3)/1.9);
  // }, 
  if(dist(mouseX, mouseY, x1,y1)>=10){
    x1 = ((mouseX - x1) * easing + x1) + random(-20,80);
    y1 = ((mouseY - y1) * easing + y1 + random(-80,20));
  }
  if(dist(mouseX, mouseY, x2,y2)>=15){
    x2 = ((mouseX - x2) * easing + x2) + random(-40,20);
    y2 = ((mouseY - y2) * easing + y2) + random(-20,50);
    fill(200, (300 + (dist(mouseX, mouseY, y2 + 10, x2))), 80, random(0,14));
  }
   if(dist(mouseX, mouseY, x3,y3)>=100){
    x3 = ((mouseX - x3) * easing + x3)+ random(-20,20);
    y3 = ((mouseY - y3) * easing + y3)+ random(-20,40);
  }
 }
 
 void display(){
   triangle(x1,y1,x2,y2,x3,y3);
 }
  }
  
  


