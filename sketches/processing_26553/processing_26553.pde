
float circleX;
float circleY;

void setup()

{

  size (400, 300);
  background (240);
  circleX = width/2;
  circleY = height/2 + 50;
  frameRate(100);
  
}

void draw()
{
   ellipseMode(CENTER);
   rectMode(CENTER);
   
   //egg
   fill(255,255,255); 
   ellipse(circleX - 20, circleY +20, 150, 75);
   
   //chicken body
   fill(255, 255, 0);
   //fill( random(255), random(255), random(255), random(255));
   ellipse(circleX - 100, circleY - 60, 60, 60);
   
   //chicken face
   ellipse(circleX - 85, circleY - 90, 40, 40);

   //chicken legs
   //stroke(255,141,0); //orange
   //fill(255,141,0); //orange
   
   //first feet
   line(circleX - 110,circleY - 32, circleX - 110,circleY - 24);  
   line(circleX - 110, circleY - 25, circleX - 120, circleY - 15);
   line(circleX - 110, circleY - 25, circleX - 100, circleY - 15);
   
   //second feet
   line(circleX - 80,circleY - 37, circleX - 80,circleY - 27);  
   line(circleX - 80, circleY - 26, circleX - 90, circleY - 16);
   line(circleX - 80, circleY - 26, circleX - 70, circleY - 16);
   
   // chicken eyes
   fill(0);
   ellipse(circleX - 75, circleY - 90, 8, 8);
   
   //chicken beak
   line(circleX - 65, circleY - 90, circleX - 50, circleY - 80);
   line(circleX - 67, circleY - 80, circleX - 50, circleY - 80);
   
}

