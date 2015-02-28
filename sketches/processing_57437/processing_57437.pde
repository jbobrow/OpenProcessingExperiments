
class Robot {
  float x;
  float y;
  float speed = 3.5;
  
  
  Robot(float tempX, float tempY){
    x=tempX;
    y=tempY;
  }
  
  void move() {
    x +=random(-speed, speed);
    y +=random(-speed, speed);
  }
  
  void display() {
    
    //neck
    noStroke();
    fill(255,172,139);
    rect(x-15, y-90, 30, 20);

    //hair
    stroke(227,59,142);
    line(x, y-150, x, y-100);
    line(x-20, y-140, x, y-100);
    line(x+20, y-150, x, y-100);


    //ears
    fill(163, 1, 81);
    ellipse (x-20, y-115, 10, 10);
    ellipse (x+20, y-115, 10, 10);


    //head
    noStroke();
    fill(255,97,56);
    ellipse (x, y-100, 50, 50);



    //eyes
    fill(255);
    ellipse(x-4, y-110, 8, 11);
    ellipse(x+10, y-107, 8, 11);
  
     //arms
    fill(121, 189, 143);
    triangle(x-100, y-50, x+50, y+20, x+40, y-20);
    triangle(x+50, y-50, x+120, y-80, x+40, y-120);
  
  
    //body
    noStroke();
    fill(0, 163, 136);
    ellipse(x, y, 150, 150);
    fill(190);
  
  
    
    //mouth
    noFill();
    stroke(255,215,75);
    arc(x+5,y-100,25,25,0,radians(90)); 
    arc(x+10,y-90,8,8,0,radians(90)); 
    
    //legs
    fill(121,189, 143);
    ellipse(x, y+80, 140, 30);
    fill(190,235,159);
    ellipse(x+20,y+80, 25, 25);
    ellipse(x-5,y+80, 25, 25);
    ellipse(x-30,y+80, 25, 25);
  }
} 

