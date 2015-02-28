

Circle[] circles;

float vy = 0;
float vx = 0;
float x;
float y;
float wind;
float friction;
float frictionX;
float gravity;
float acceleration;
float velocity;
float directionx;
float directiony;


void setup(){
  background(0, 94, 98);
  size(800, 600);

circles = new Circle[100];
  for(int i = 0; i < circles.length; i++){
    circles[i] = new Circle(random(300), random(300));
  }
  vy += gravity; // OR vy = vy + gravity;
  vx += wind;
  vy += wind;
  vx += frictionX;

  x += vx;
  y += vy;
 if(y > height){
  y = height;
 
 vy *= friction;
 vx *= friction;

  }
  if(x > width){
    x = 0;
    vx = -vx;
    
  }


}


void draw(){

  for(int i = 0; i < circles.length; i++){

    circles [i].display();

    circles [i].move();
   
   fill(174, 221, 60);
    
   

   line(width/2,height/2, random(width),random(height)); 
   stroke(0, 0, 0, 10);
  x = x + (600 * directionx);
  y = y + (.002 * directiony);
  if (x > width){
    directionx = -1;
  }
  if (x < 0){
    directionx = -1;
  }
  if (y > height){
    directiony = -1;
  }
  if (y < 0){
    directiony = 1;
  }
}
   // line(width/2,height/2, random(width),random(height));

   }



//constructor
class Circle{
float x, y;
float vy;
float vx;


//constructor
  Circle(float xpos, float ypos){
    x = xpos;
    y = ypos;
    vy = 6;
    vx = 9;
    friction = -.9;
    frictionX = .98;
    gravity = .05;
    wind = .6;
    acceleration = 1;
    velocity = -.2;
  }
  void display(){
    
    ellipse(x, y, 90, 20);
  }
  void move(){
    x+= acceleration;
    vy += gravity;
    vx*= frictionX;
    x += vx;
    y += vy;
    if(y > height){
  y = height;
  vy *= friction;
    } 
  if(x > width){
  x = width;
  vx *= -29;
   }
  
}

  
}


