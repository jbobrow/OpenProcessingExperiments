
boolean odd = false;

int x;

int y;


RedDot dot;

Cursor c;


void setup() {  // this is run once.   

    // set the background color

    background(255);

    // canvas size (Integers only, please.)

    size(300, 300);

    // smooth edges

    smooth();

    // limit the number of frames per second

    frameRate(30);

    dot = new RedDot();

   

    System.out.println("Hi");

}

public class RedDot {

    private int x;

    private int y;

    public RedDot() {

      x = 0;

      y = 0;

    }

    public void draw() {

      stroke( random(255), random(50), random(50) );

      strokeWeight(1);

      fill ( random(255), random(50), random(50) );

      ellipse( x, y, 5, 5 );

    }

    public int getX() {

      return X;

    }

  

    public int getY() {

      return Y;

    }

  

    public void move() {

      if( x >= width && y >= height ) {

          x = 0;

          y = 0;

      }

      x++;

      y++;

    }

}

public class Cursor {

    private float curX;

    private float curY;

   

    private float randBotLeft = random(0, 50);

   

    private float randBotRight = random(width-50,width);

   

    private float randTop = random(width/2.0-50,width/2.0+50);

   

    public Cursor(float x, float y) {

      curX = x;

      curY = y;

    }

    public void draw() {

     

      stroke(random(50), random(255), random(255), 90);

      line(curX+2, curY-2, randBotLeft, height);

      stroke(random(255), random(255), random(50), 90);

      smooth();

      strokeWeight(1);

      line(curX-2, curY-2, randBotRight, height);

      stroke(random(255), random(50), random(255), 90);

      smooth();

      strokeWeight(1);

      line(curX, curY+2, randTop, 0);

      strokeWeight(1);

      

      fill(209);

      

      stroke(209);

      ellipse(curX, curY, 40, 40);

    }

   

    /*public boolean RedDotHit() {

        

       double redSlope = (double)(randTop-(curY+2))/(0 - height)

    }*/

}

void mouseMoved(){

x = mouseX;

y = mouseY;  }



void draw() {  // this is run repeatedly.  


  

    /*if ( ! odd ) {

       if(y < height) {

         println("increasing y...");

          y+=random(0,50);

      } else {

          odd = true;

      }

    }

  

    if ( odd ) {

      if( y > 0 ) {

          println("DECREASING y...");

          y-=random(0,50);

      } else {

          odd = false;

      }

    }*/

    /*

    //background(255);

    // set the color

    stroke(random(50), random(255), random(255), 90);

  

    // draw the line

    line(x+2, y-2, random(0, 50), height);


    stroke(random(255), random(255), random(50), 90);

    smooth();

    strokeWeight(2);

    line(x-2,y-2, random(width-50,width), height);


    stroke(random(255), random(50), random(255), 90);

    smooth();

    strokeWeight(10);

    line(x,y, random(width/2.0-50,width/2.0+50), 0);

    */

    //draw the cursor


    // move over a pixel

    /*if (i < width) {

      i++;

    } else {

      i = 0;

    }*/

    background(255);

    dot.move();

    dot.draw();

    c = new Cursor(mouseX, mouseY);

    c.draw();

}

