
class Ball{
   //global variables

   float x = 0;
   float y = 0;
   float speedX= random(-4,4);
   float speedY= random(-4,4);
   float radius = random(50);
   float r = random(255);
   float g = random(255);
   float b = random(255);
   //constructor

   Ball(float _x, float _y){

      x = _x;
      y = _y;

   }

   //functions
   void run(){
      display();
      move();
      bounce();
      gravity();


   }


   void gravity(){
      speedY += 0.2;
   }



   void bounce(){
      if(x > width){
         speedX = speedX * -1;
      }
      if(x < 0){
         speedX = speedX * -1;
      }
      if(y > height){
         speedY = speedY * -1;
      }
      if(y < 0){
         speedY = speedY * -1;
      }
   }


   void move(){
      x += speedX;
      y += speedY;

   }

   void display(){
      fill(r,g,b);
      ellipse(x,y, radius,radius);
   }
}

