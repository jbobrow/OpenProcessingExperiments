
boolean locked = false;
// declare buttons below
CircleButton button1, button2, button3, button4, button5, button6, button7, button8, big, medium, little,left,right,up,down,back,grow,shrink;

//declare colors below
color black = color(0, 0, 0);
color red = color(255, 0, 0);
color gray = color(150);
color green = color(0, 255, 2);
color magenta = color(255, 0, 204);
color cyan = color(0, 255, 255); 
color yellow = color(255, 255, 0);
color blue = color (0, 0, 204);


Circle c1 = new Circle(300, 200, 50, black);


void setup() {
  background(255);
  noStroke();
  size(650, 500);
  button1 = new CircleButton(50, 50, 25, red, gray);
  button2 = new CircleButton(50, 100, 25, black, gray);
  button3 = new CircleButton(50, 150, 25, green, gray);
  button4 = new CircleButton(50, 200, 25, magenta, gray);
  button5 = new CircleButton(50, 250, 25, cyan, gray);
  button6 = new CircleButton(50, 300, 25, yellow, gray);
  button7 = new CircleButton(50, 350, 25, blue, gray);
  button8 = new CircleButton(50, 400, 25, gray, gray);


  big = new CircleButton(550, 50, 25, black, gray);
  medium = new CircleButton(550, 90, 25, black, gray);
  little = new CircleButton(550, 130, 25, black, gray);
  
  left = new CircleButton(180, 390, 25, black, gray);
  right = new CircleButton(260, 390, 25, black, gray);
  up = new CircleButton(220, 355, 25, black, gray);
 down = new CircleButton(220, 430, 25, black, gray);
 back = new CircleButton(220, 390, 25, black, gray);
 
 grow = new CircleButton(340, 390, 65, black, gray);
  shrink = new CircleButton(340, 440, 15, black, gray);
 
 
 
}
void draw() {
  update(mouseX, mouseY);
  
  background(255);

  button1.display();
  button2.display();
  button3.display();
  button4.display();
  button5.display();
  button6.display();
  button7.display();
  button8.display();
  big.display();
  medium.display();
  little.display();
   left.display();
   right.display();
   up.display();
   down.display();
   back.display();
    grow.display();
    shrink.display();
  c1.draw();

}
void update(int x, int y)

{

  if (locked == false) {

    button1.update();
    button2.update();
    button3.update();
    button4.update();
    button5.update();
    button6.update();
    button7.update();
    button8.update();
    big.update();
    medium.update();
    little.update();
    left.update();
    right.update();
    up.update();
     down.update();
     back.update();
     grow.update();
      shrink.update();
  } 

  else {

    locked = false;
  }



  if (mousePressed) {

    // extend this section to handle button clicking
    if (button1.pressed()) {

      c1.setColor(red);
    } 

    else if (button2.pressed()) {

      c1.setColor(black);
    }
    else if (button3.pressed()) {

      c1.setColor(green);
    }    
    else if (button4.pressed()) {

      c1.setColor(magenta);
    }
    else if (button5.pressed()) {

      c1.setColor(cyan);
    }  
    else if (button6.pressed()) {

      c1.setColor(yellow);
    }  
    else if (button7.pressed()) {

      c1.setColor(blue);
    } 
    else if (button8.pressed()) {

      c1.setColor(gray);
    }   
    else if (big.pressed()) {

      c1.setDiameter(100);
    }
     else if (medium.pressed()) {

      c1.setDiameter(35);
    }
   else if (little.pressed()) {

      c1.setDiameter(10);
    }
   else if (left.pressed()) {

      c1.setXY(c1.x-3,c1.y);
    }   
     else if (right.pressed()) {

      c1.setXY(c1.x+3,c1.y);
    }   
  else if (up.pressed()) {

      c1.setXY(c1.x,c1.y-3);
    }   
   else if (down.pressed()) {

      c1.setXY(c1.x,c1.y+3);
    }   
   else if (back.pressed()) {

      c1.setXY(300,200);
    }  
  else if (grow.pressed()) {

      c1.setDiameter(c1.diameter+1);
    }
    else if (shrink.pressed()) {

      c1.setDiameter(c1.diameter-1);
    }
    
    
  }
}
class Button

{

  int x, y;

  int size;

  color basecolor, highlightcolor;

  color currentcolor;

  boolean over = false;

  boolean pressed = false;   



  void update() 

  {

    if (over()) {

      currentcolor = highlightcolor;
    } 

    else {

      currentcolor = basecolor;
    }
  }



  boolean pressed() 

  {

    if (over) {

      locked = true;

      return true;
    } 

    else {

      locked = false;

      return false;
    }
  }



  boolean over() 

  { 

    return true;
  }



  boolean overRect(int x, int y, int width, int height) 

  {

    if (mouseX >= x && mouseX <= x+width && 

      mouseY >= y && mouseY <= y+height) {

      return true;
    } 

    else {

      return false;
    }
  }



  boolean overCircle(int x, int y, int diameter) 

  {

    float disX = x - mouseX;

    float disY = y - mouseY;

    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {

      return true;
    } 

    else {

      return false;
    }
  }
}



class CircleButton extends Button

{ 

  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight) 

  {

    x = ix;

    y = iy;

    size = isize;

    basecolor = icolor;

    highlightcolor = ihighlight;

    currentcolor = basecolor;
  }



  boolean over() 

  {

    if ( overCircle(x, y, size) ) {

      over = true;

      return true;
    } 

    else {

      over = false;

      return false;
    }
  }



  void display() 

  {

    stroke(255);

    fill(currentcolor);

    ellipse(x, y, size, size);
  }
}

class Circle
{
  float x, y, diameter;
  color c;

  Circle(float x, float y, float diameter, color c) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    this.c = c;
  }

  void draw() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }

  void setColor(color c)
  {
    this.c = c;
  }

  void setDiameter(float diameter)
  {
    this.diameter = diameter;
  }

  void setXY(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
}

