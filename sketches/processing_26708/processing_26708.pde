
class Catcher {
float r; 
float x, y;
    float m;
    float n;

  
  
 Catcher(float tR) {
r = tR;
x = 0;
y = 0;
}

void setLocation(float tX, float tY) {
x =tX;
y = tY;
}



  
void display() {
noStroke();
fill(230,100,30);//petals
   ellipse(x+50,y+50,60,60);
   ellipse(x+50,y-50,60,60);
   ellipse(x-50,y-50,60,60);
   ellipse(x-50,y+50,60,60);
fill(255,260,0);//orange petals
   ellipse(x-65,y-5,60,60);
   ellipse(x+65,y-5,60,60);
   ellipse(x,y+65,60,60);
   ellipse(x,y-65,60,60);
noStroke(); //face
fill(125,200,50);
ellipse(x,y,r*3,r*3);
fill(255);//big eye
ellipse (x+20,y-10,r/3,r/3);
ellipse (x-20,y-10,r/3,r/3);
fill(0);//small eye
ellipse (x+20,y-10,r/5,r/5);
ellipse (x-20,y-10,r/5,r/5); 

fill(200,0,40);
 triangle(x-20,y+5,x+23,y+5,x,y+28);
 
    x=mouseX-random(-65,65);
      y=mouseY-random(-65,65);
      m=random(15,15);
      n=random(18,45);
      stroke(255);
    int r = int(random(0,255));
    int g = int(random(0,255));
    int b = int(random(0,255));
     fill(r,g,b);
      ellipse (x,y,m,m);
 
}


boolean intersect(FlowerOne b) {
    float distance = dist(x,y,b.x,b.y); 
    println(distance);
    if (distance < r*2.5 + b.r*2.5) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(FlowerThree b) {
    float distance = dist(x,y,b.x,b.y); 
    if (distance < r*2 + b.r*2) {
      return true;
    } else {
      return false;
    }
  } 
  
   boolean intersect(FlowerTwo b) {
    float distance = dist(x,y,b.x,b.y); 
    if (distance < r + b.r) {
      return true;
    } else {
      return false;
    }
  } 
  
    
   boolean intersect(FlowerFour b) {
    float distance = dist(x,y,b.x,b.y); 
    if (distance < r + b.r) {
      return true;
    } else {
      return false;
    }
  } 
  
}

