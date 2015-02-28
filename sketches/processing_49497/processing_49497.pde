


Circle [] circles = new Circle [100];

void setup(){
 size (400, 400);
 smooth(); 
 
 for (int i = 0; i < circles.length; i++){
  circles[i] = new Circle (random(200), random(200), random(50)); 
 }
 
}

void draw(){
  
  background (250);
  
  for (int i = 0; i < circles.length; i++){
  
  circles[i].drawCircle();
  circles[i].update();
  circles[i].checkCollisions();

  }
  
}

class Circle {
 
 float x; 
 float y;
 float xSpeed;
 float ySpeed;
 
 float circleSize;
 
 Circle(float xpos, float ypos, float csize){
   x = xpos;
   y = ypos;
   circleSize = csize;
   
   xSpeed = random (-10, 10);
   ySpeed = random (-10, 10);
   
 }

 void update(){
   x += xSpeed;
   y += ySpeed;
 }
 
 void checkCollisions(){
  
  if ((x < circleSize/2) || (x > width - circleSize/2)){
   xSpeed = -xSpeed; 
  }
   
   if ((y < circleSize/2) || (y > height - circleSize/2)){
    ySpeed = -ySpeed; 
   }
   
 }

 void drawCircle(){
   
   stroke (random (20), random (0), random (255));
   strokeWeight (random (1, 20));
   fill (random (200), random (20), random (100));
   ellipse (x, y, circleSize, circleSize);
      
 }
 
 
}


