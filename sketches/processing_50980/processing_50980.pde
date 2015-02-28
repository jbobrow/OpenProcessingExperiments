
// The Consuming Balls
// By Charles Carr

// set the width and height equal to the screen's width and height
int WIDTH = 800;
int HEIGHT = 600;

// Create an arraylist
ArrayList balls;

// How many balls will there be in the beginning?
int density = 500;

void setup()
{
    // size() sets the size
    size(800,600);
    
    // Ellipses are drawn from the center
    ellipseMode(CENTER);
    
    // instantiate the array list
    balls = new ArrayList();
    
    // create a 'density' amount of balls and place them into the array list.
    for (int i = 0; i < density; i++)
    {
        balls.add(new Ball(random(100,WIDTH-100), // x position
                           random(100,HEIGHT-100), // y position
                           random(-10,10), // x speed
                           random(-10,10), // y speed
                           1, // radius
                           color(random(255),random(255),random(255)) // color
                           ) // end ball
                  ); // end arraylist add
    }
}

void draw()
{
    // The background shall be black!
    background(0);
    
    // For as many balls that remain to exist...
    for (int i = balls.size()-1; i >= 0; i--)
    {
        // Start a new ball object at index 'i' of the array list
        Ball ball = (Ball) balls.get(i);
        
        // Reposition and redraw the ball at index 'i' of the array list
        ball.bounce();
        ball.display();
        
        // This loop will check for all the collisions
        for (int j = balls.size()-1; j >= 0; j--)
        {
            // Don't check collisions with itself
            if (i == j)
            {
                // stop this iteration of the for loop and go to the next one.
                continue;
            }
            else // if the we're referring to a ball that isn't the initial indexed ball ('i')...
            {
                // Call another ball at index 'j' of the array list.
                Ball otherBall = (Ball) balls.get(j);
                
                // Check is ball of index 'i' is in collision with ball of index 'j'
                if (ball.getx() + ball.getRad() >= otherBall.getx() - otherBall.getRad() &&
                    ball.getx() - ball.getRad() <= otherBall.getx() + otherBall.getRad() &&
                    ball.gety() + ball.getRad() >= otherBall.gety() - otherBall.getRad() &&
                    ball.gety() - ball.getRad() <= otherBall.gety() + otherBall.getRad())
                {
                    // if the ball of index 'i' is bigger than the ball of index 'j',
                    if (ball.getRad() >= otherBall.getRad())
                    {
                        // Then increase the radius of the ball at index 'i' by the half the radius of the ball at index 'j'
                        ball.incRad(otherBall.getRad() / 2);
                        
                        // and remove the ball at index 'j' from the array list never to be seen again!
                        balls.remove(j);
                        
                        // Stop this iteration of the loop and stop doing the loop entirely.
                        break;
                    }
                    
                    // if the ball of index 'j' is bigger than the ball of index 'i',
                    if (ball.getRad() < otherBall.getRad())
                    {
                        // Then increase the radius of the ball at index 'j' by the half the radius of the ball at index 'i'
                        otherBall.incRad(ball.getRad() / 2);
                        
                        // and remove the ball at index 'i' from the array list never to be seen again!
                        balls.remove(i);
                        
                        // Stop this iteration of the loop and stop doing the loop entirely.
                        break;
                    } // end if (ball radius)
                } // end if (ball collision)
            } // end if (same ball)
        } // end for (j)
    } // end for (i)
}

// Blueprint for the "ball" object
class Ball
{
    // You have an x-position, y-position, x and y speed, radius, and color.
    float x;
    float y;
    float xspeed;
    float yspeed;
    float rad;
    color bcolor;
    
    // Constructor for the class.
    Ball(float x, float y, float xspeed, float yspeed, float rad, color bcolor)
    {
        // 'this.<variable> refers to the variable above this function, not the same-named variable in this function's arguments.
        this.x = x;
        this.y = y;
        this.xspeed = xspeed;
        this.yspeed = yspeed;
        this.rad = rad;
        this.bcolor = bcolor;
    }
    
    // Returns the x
    float getx()
    {
        return x;
    }
    
    // Returns the y
    float gety()
    {
        return y;
    }
    
    // Returns the radius
    float getRad()
    {
        return rad;
    }
    
    // increases the radius by the argument's amount
    void incRad(float i)
    {
        rad += i;
    }
    
    // Draw the ball
    void display()
    {
        fill(bcolor);
        ellipse(x,y,rad*2,rad*2);
    }
    
    // Reposition the ball
    void bounce()
    {
        x += xspeed;
        y += yspeed;
        if ((x+rad > WIDTH+rad) || (x-rad < 0-rad))
        {
            xspeed = -xspeed;
        }
        if ((y+rad > HEIGHT+rad) || (y-rad < 0-rad))
        {
            yspeed = -yspeed;
        }
    }
}

void keyPressed()
{
    if (key == '1') {density = 100; setup();}
    if (key == '2') {density = 200; setup();}
    if (key == '3') {density = 300; setup();}
    if (key == '4') {density = 400; setup();}
    if (key == '5') {density = 500; setup();}
    if (key == '6') {density = 600; setup();}
    if (key == '7') {density = 700; setup();}
    if (key == '8') {density = 800; setup();}
    if (key == '9') {density = 900; setup();}
    if (key == '0') {density = 1000; setup();}
}

