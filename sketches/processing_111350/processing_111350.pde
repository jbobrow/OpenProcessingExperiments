
/*   Homework Four - Class Composition
     Sabrina Pardus 
     09/24/13
*/

Composition myComp;

void setup() {
  size (400,400);
  // Initialize Composition Object
  myComp = new Composition(0, 4, 390, 4);
}

void draw() {
  background(0);
  smooth();
  // Operator Composition Object
  myComp.randColors();
  myComp.createPentagon();
  myComp.move();
}

class Composition {
  int x;
  int xSpeed;
  int y;
  int ySpeed;


   Composition(int tempX, int tempXSpeed, int tempY, int tempYSpeed) {
     x = tempX;
     xSpeed = tempXSpeed;
     y = tempY;
     ySpeed = tempYSpeed;
   }
   
   // Random colors
   color randColors() {
     float r = random(55,220);
     float g = random(55,220);
     float b = random(55,220);
     return color(r,g,b);
   }

   // Create the pentagon
   void createPentagon() {
     //Drawing with white lines
      stroke(255);
      strokeWeight(3);
      smooth();
    
      //Draw top section of pentagon
      line(200,0,80,50);
      line(200,0,60,150);
      line(200,0,170,45);  
      line(200,0,98,345);
      line(200,0,190,90);
      line(200,0,220,195);
      line(200,0,320,170);
      line(200,0,330,140);
      line(200,0,255,48);
      line(200,0,300,30);
    
      //Draw right section of pentagon
      line(400,160,330,45);
      line(400,160,253,35);
      line(400,160,390,125);
      line(400,160,340,150);
      line(400,160,340,250);
      line(400,160,161,253);
      line(400,160,160,170);
      line(400,160,162,325);
      line(400,160,300,245);
      line(400,160,310,330);
    
      //Draw left section of pentagon
      line(0,160,18,25);
      line(0,160,50,75);
      line(0,160,135,40);
      line(0,160,130,101);
      line(0,160,220,130);
      line(0,160,60,160);
      line(0,160,260,230);
      line(0,160,80,205);
      line(0,160,150,350);
      line(0,160,80,310);
    
      //Draw bottom-left section of pentagon
      line(80,400,15,325);
      line(80,400,8,215);
      line(80,400,60,225);
      line(80,400,95,170);
      line(80,400,180,240);
      line(80,400,130,345);
      line(80,400,245,310);
      line(80,400,180,390);
    
      //Draw bottom-right section of pentagon
      line(320,400,220,360);
      line(320,400,100,225);
      line(320,400,260,340);
      line(320,400,160,160);
      line(320,400,230,120);
      line(320,400,320,210);
      line(320,400,375,230);
      line(320,400,365,315);
   }
   
   // Move rectangles across the screen
   void move () {
     stroke(0);
     strokeWeight(0);
     x = x + xSpeed; 
     y = y - ySpeed;
  
     if ((x > width - 10) || (x < 0)) {
       xSpeed = xSpeed * -1;  //reverse direction when hits edge
     }
     if ((y > height - 10) || (y < 0)) {
       ySpeed = ySpeed * -1;  //reverse direction when hits edge
     }
     
     fill(randColors(),175);
     rect(y,0,100,400);
     fill(randColors(),175);
     rect(y+100,0,100,400);
     fill(randColors(),175);
     rect(y+200,0,100,400);
     fill(randColors(),175);
     rect(y+300,0,100,400);
   }
}
     







