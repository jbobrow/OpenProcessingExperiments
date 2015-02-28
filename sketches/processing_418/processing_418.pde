
class Ball{
  
 float x, y;
 float radius;
 float colores;
 float speedX, speedY;
 float accy;
 int counter;
 
 Ball(float posX, float posY, float r,  float ay, float sx, float sy){
  x = posX;
  y = posY;
  radius = r;
  colores = 164;
  speedX = random(-0.1,1);
  speedY = 1;
  accy = ay; 
  counter = 0;
  speedX = sx;
  speedY = sy;
  }
 
 void move(){
   x += speedX;
   y += speedY;

  // println(x + " " + y);
   //if (counter < 10)
   if (y >= height - (2*radius)/2 || y < 0){          //stoping the balls at the bottom
     speedY *= -0.90;
     //counter ++;
     }
    speedY = speedY + accy;      //adding gravity

    
   if (y >= height - 2*radius/2){
    y = height-2*radius/2;
    speedX = 0;
   }
 }
   

   void display(){
    fill(colores,80); 
    ellipse(x,y,2*radius,2*radius);
   }
   
 
}

