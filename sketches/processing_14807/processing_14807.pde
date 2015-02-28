
// declare Lama as a global variable
Lama myLama;

void setup () {
  // size window
  size(200,200);
  
  //Initialize Lama object
  myLama = new Lama();
}

void draw () {
  // blue background and colour for fill
  background(120,50,255);
  // operate Lama object
  myLama.move();
  myLama.display();
}

// define a class
class Lama {
  color c; //the color of the hat
  color c2; // the color of the body
  //variables
  float x_position;
  float y_position;
  float xspeed; 
  float yspeed;
  float s;
  float r;
  float xdirection; 
  float ydirection;
  
  Lama() {
    // color of the hat
    c = color(10,153,0);
    // color of the body
    c2 = color(255,153,0);
    x_position = width/2;
    y_position = height/2;
    xspeed = 1;
    yspeed = 2;
    s = 1;
    r = 0;
    xdirection=1;
    ydirection=1;
  }
  
  void display() {
    fill(c2);
    // ellipse in center mode
  ellipseMode(CENTER);

  //neck and head
  rect(x_position-30*s,y_position-40*s,10*s,40*s);
  ellipse(x_position-33*s,y_position-40*s,30*s,15*s);

  // body
  ellipse(x_position,y_position,60*s,50*s);

  //legs
  line(x_position-15*s,y_position+10*s,x_position-20*s,y_position+50*s);
  line(x_position-10*s,y_position+23*s,x_position,y_position+50*s);
  line(x_position+10*s,y_position+10*s,x_position+13*s,y_position+50*s);
  line(x_position+15*s,y_position+21*s,x_position+23*s,y_position+50*s);

  //tail
  line(x_position+30*s,y_position,x_position+45*s,y_position+5*s);
  line(x_position+38*s,y_position+3*s,x_position+44*s,y_position+2*s);
  line(x_position+37*s,y_position+3*s,x_position+42*s,y_position+8*s);

  //eye
  fill(x_position+75,y_position+75,20);
  ellipse(x_position-28*s,y_position-42*s,3*s,6*s);

  //when the mouse is pressed
  if(mousePressed) {
    //hoedje
    fill(c);
    rotate(radians(r));
    triangle(x_position-35*s,y_position-46*s,x_position-25*s,y_position-60*s,x_position-17*s,y_position-42*s);
  }
  }
  
  void move() {
    x_position = x_position + xspeed*xdirection;
    y_position = y_position + yspeed*ydirection;
    if (x_position > width-60*s || x_position<60*s) {
      xdirection=-xdirection;
    }
    if (y_position > (height-50*s) || y_position<50*s) {
      ydirection=-ydirection;
    } 
  }
}

  
