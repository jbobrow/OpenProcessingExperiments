
float x;
float y;
float targetX, targetY;
float easing = 0.05;

void setup () {
 size (500,600);
 background(0,0,0);
 smooth();
}

void draw () {
  
  if (mousePressed){

  stroke(255);
  line(mouseX,mouseY,mouseX+random(-300,300),mouseY+random(-300,300));
  stroke(100);
  line(mouseX,mouseY,mouseX+random(-800,800),mouseY+random(-800,800));
  
  targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  stroke(255);
   
  fill(100,random(50),random(200),50);
  ellipse(x-20,y+20,random(30,20),random(30,20));
  ellipse(x+20,y-20,random(30,20),random(30,20));
  ellipse(x+20,y+20,random(30,20),random(30,20));
  ellipse(x-20,y-20,random(30,20),random(30,20));
  
  fill(255,0,random(255),80);
  ellipse(x,y,random(30,20),random(30,20)); 
  
  
  fill(random(190,245),143,random(179,245));
  stroke(255);
  ellipse(x+random(-50,50),y+random(-50,50),random(10,10),random(10,10));
  
  fill(random(47,82),4,random(63,82),180);
  ellipse(x+random(-100,100),y+random(-100,100),random(20,20),random(20,20));
  
  if (keyPressed == true) {
  
  noStroke();  
  fill(random(255),random(255),random(255));
  ellipse(x-20,y+20,random(30,20),random(30,20));
  ellipse(x+20,y-20,random(30,20),random(30,20));
  ellipse(x+20,y+20,random(30,20),random(30,20));
  ellipse(x-20,y-20,random(30,20),random(30,20));
  }
    
    
  
  }
}

