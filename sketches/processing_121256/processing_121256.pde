
// Step 1. Declare an object.
Ellipse myEllipse1;
Ellipse myEllipse2;
Ellipse myEllipse3;
Ellipse myEllipse4;
Ellipse myEllipse5;
Ellipse myEllipse6;
Ellipse myEllipse7;
Ellipse myEllipse8;
Ellipse myEllipse9;
Ellipse myEllipse10;
Ellipse myEllipse11;
Ellipse myEllipse12;

void setup()  {    
  size(displayWidth, displayHeight);
  // Step 2. Initialize object.
  myEllipse1 = new Ellipse();
  myEllipse2 = new Ellipse();
  myEllipse3 = new Ellipse();
  myEllipse4 = new Ellipse();
  myEllipse5 = new Ellipse();
  myEllipse6 = new Ellipse();
  myEllipse7 = new Ellipse();
  myEllipse8 = new Ellipse();
  myEllipse9 = new Ellipse();
  myEllipse10 = new Ellipse();
  myEllipse11 = new Ellipse();
  myEllipse12 = new Ellipse();
}    

void draw()  {    
  background(random(0,255),159,255);  
  // Step 3. Call methods on the object. 
  myEllipse1.move();  
  myEllipse1.display();
  myEllipse2.move();  
  myEllipse2.display();
  myEllipse3.move();  
  myEllipse3.display();
  myEllipse4.move();  
  myEllipse4.display();
  myEllipse5.move();  
  myEllipse5.display();
  myEllipse6.move();  
  myEllipse6.display();
  myEllipse7.move();  
  myEllipse7.display();
  myEllipse8.move();  
  myEllipse8.display();
  myEllipse9.move();  
  myEllipse9.display();
  myEllipse10.move();  
  myEllipse10.display();
  myEllipse11.move();  
  myEllipse11.display();
  myEllipse12.move();  
  myEllipse12.display();
}    
class Ellipse
{

    color c;
    float xpos;
    float ypos;
    float yspeed;

    Ellipse()
    {
        noStroke();
        c = color(random(0, 255), random(0, 255), random(0, 255));
        xpos = random(0, width);
        ypos = -50;
        yspeed = random(2, 7);
    }


    void display()
    {
        fill(c);
        ellipse(xpos, ypos, 50, 50);

    }


    void move()
    {
        ypos = ypos + yspeed;

        if (ypos > width + 55)
        {
            xpos = random(0, width);
            yspeed = random(3, 10);
            c = color(random(0, 255), random(0, 255), random(0, 255));
            ypos = -50;
        }

    }

}
