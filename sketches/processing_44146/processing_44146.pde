
class CircuitObject {
  boolean dragging = false; // Is the button being dragged?
  boolean rollover = false; // Is the mouse over the button?
  boolean inPos = false; //Is the button in the correct postion?
  boolean inPosLed = false; //Is the LED in place?

  float x, y, w, h;          // Location and size
  float offsetX, offsetY; // Mouseclick offset

  int xMin, xMax, yMin, yMax, type;

  float opacity = 255;
  color c = color(0, 0, 255, opacity);
  float ledState;
  boolean ledOn = false;


  CircuitObject(float tempX, float tempY, float tempW, float tempH, int tempXMin, int tempXMax, int tempYMin, int tempYMax, String _type) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    xMin = tempXMin;
    xMax = tempXMax;
    yMin = tempYMin;
    yMax = tempYMax;
    offsetX = 0;
    offsetY = 0;
    ledState = 0;
    if (_type == "BUTTON") type = 1;
    if (_type == "K10") type = 2;
    if (_type == "K560") type = 3;
    if (_type == "LED") type = 4;
  }

  // Method to display
  void display() 
  {
    switch (type) {
    case 1: // button type
      {
        stroke(100);
        strokeWeight(1);
        fill(0, 0, 255);
        rect(x, y, 30, 10);
        quad(x, y, x+8, y-15, x+25, y-15, x+30, y);
        strokeWeight(2);
        ellipse(x+15, y-7, 15, 10);
        line(x,y,x,y+20);  //left button pin
        line(x+30,y,x+30,y+20); //right button pin
        break;
      }
    case 2: // k10 type
      {
        //K10  RESISTOR
        noFill();
        strokeWeight(1);
        ellipseMode(CORNER);
        stroke(100);
        arc(x-27, y-2, 35, 35, PI, TWO_PI-PI/2);
        arc(x-20, y-2, 45, 35, TWO_PI-PI/2, TWO_PI);
        // line(x,y+2,x-25,y+2);
        // line(x+10,y+2,x+25,y+2);

        ellipseMode(CENTER);
        fill(229, 220, 171);//gross body color
        ellipse(x, y, 30, 15);//BODY
        stroke(247, 133, 17); 
        strokeWeight(2);
        line(x+4, y-6, x+4, y+7);//orange line
        stroke(0);
        line(x-1, y-6, x-1, y+7);//black line  line(66, 46, 66, 59);//black line
        stroke(131, 40, 7);
        line(x-6, y-6, x-6, y+7);//dark red
        break;
      }
    case 3: // k560 type
      {
        //K560 BUTTON RESISTOR
        noFill();
        stroke(100);
        strokeWeight(1);
        ellipseMode(CORNER);
        arc(x-27, y-2, 35, 55, PI, TWO_PI-PI/2);
        arc(x-20, y-2, 45, 35, TWO_PI-PI/2, TWO_PI);
        // line (x,y,x-30,y);
        // line (x+10,y,x+30,y);

        ellipseMode(CENTER);
        fill(229, 220, 171);//gross body color
        ellipse(x, y, 30, 15);//BODY
        stroke(87, 185, 2); 
        strokeWeight(2);
        line(x+4, y-6, x+4, y+7);//green line
        stroke(36, 136, 240);
        line(x-1, y-6, x-1, y+7);//blue line  line(66, 46, 66, 59);//black line
        stroke(131, 40, 7);
        line(x-6, y-6, x-6, y+7);//dark red
        break;
      }
    case 4: // led type
      {
        color c = color(255, 0, 0, opacity);
        if (ledOn) {
          opacity = 255;
          
          fill(255, 0, 0);
          stroke(0);
         // line(740, 75, 740, 125);
          println("LED IS ON!");
        } 
        else {
          opacity = 100;
          println("LED IS OFF!");
        }
        strokeWeight(1.5);
        noStroke();
        fill(c);
        ellipse(x, y, 35, 40);
        fill(c);
        ellipse(x, y+18, 55, 10);
        noStroke();
        fill(c, opacity-75);
        ellipse(x, y, 50, 40);
        fill(c, opacity-100);
        ellipse(x, y, 60, 50);
        stroke (100);
        line(x-5, y+22, x-5, y+83);
        line(x+5, y+22, x+25, y+83);
        break;
      }
    default:
      { 
        break;
      }
    }


    if (ledState ==0)
    {
      x = x +1;
      if (x > width/2)
      {
        x = width/2; 
        ledState = 1;
      }
    }
  }

  // Is a point inside the rectangle (for click)?
  void clicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) 
    {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
    }
  }

  // Is a point inside the rectangle (for rollover)
  void rollover(int mx, int my) 
  {
    if (mx > x && mx < x + w && my > y && my < y + h) 
    {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void stopDragging() 
  {
    dragging = false;
  }

  void drag(int mx, int my)
  {
    if (dragging) {
      x = mx ;
      y = my ;
    }
  }
  // is the button in the right spot?
  void posCheck() 
  {
    if (x > xMin && x < xMax && y > yMin && y < yMax) //this defines where the button goes
    {
      inPos = true;
      println("object type " + type + " is home!");
    } 
    else
    {
      inPos = false;
    }
  }
}


