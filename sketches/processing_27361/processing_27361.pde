
float x, y, dX, dY;

float easing;


void setup(){
  size(600, 600);
  background(255);
  easing = .05;
} 

void draw(){
  
  fill(0,10);
  rect(0,0,width,height);
  
 dX = mouseX -x;
 dY = mouseY -y;
 
 x = x + dX*easing;
 y = y + dY*easing;
 
 ellipse(x, y,100,100);
 

}
//Press mouse and move across screen

void mousePressed (){
  strokeWeight(5);
  float weight = dist (mouseX,mouseY, pmouseX, pmouseY);
  fill (random(255), random(255), random(255));
  ellipse(mouseX, mouseY, random(width), random(height));
  ellipse(mouseX, mouseY, 80, 80);
}


class Circle{
  float x;
  float y;
  float distance;
  float id;
  float xpos, ypos;
  float acceleration = .5;

    
 
 
 
 //constructor
  Circle(float xpos, float ypos){
    x = xpos;
    y = ypos;
  }
  
  void display (){
    ellipse(x,y,100,100);
    
  }
   void move(){
     x += acceleration;
   }
    void collision(){
  
    }
  }
   


