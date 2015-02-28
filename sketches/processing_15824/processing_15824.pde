
Lama[] myLama = new Lama[20]; // array of 20 lama's

void setup () {
  // size window
  size(500,500);
  
  for (int i=0; i < myLama.length; i++){
    myLama[i] = new Lama();
  }
}
  
void draw () {
  // blue background and colour for fill
  background(120,50,255);
  for (int i = 0; i < myLama.length; i++){
  // operate Lama object
  myLama[i].move();
  myLama[i].display();
  }
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
  float xs, ys, bs, mass;
  
  public void move() {
     x_position = x_position + xspeed*xdirection;
    y_position = y_position + yspeed*ydirection;
    if (x_position > width-60*s || x_position<60*s) {
      xdirection=-xdirection;
    }
    if (y_position > (height-50*s) || y_position<50*s) {
      ydirection=-ydirection;
    } 
    x_position += xs;
    y_position += ys;
    

   
    if (abs(ys) < 0.07)
      ys = 0;
    if (abs(xs) < 0.07)
      xs = 0;
    for (int i=0; i < myLama.length; i++) {
      Lama b2 = myLama[i];
      if (!(b2==this)) {
        float cD = b2.bs/2 + bs/2;
        float aD = sqrt((b2.x_position - x_position)*(b2.x_position - x_position)+(b2.y_position - y_position)*(b2.y_position - y_position));
        if (cD>aD) {
          float cna = atan2(b2.y_position-y_position, b2.x_position-x_position);
          float mD1 =(cD-aD)*(b2.mass/(mass+b2.mass));
          float mD2 =(cD-aD)*(mass/(mass+b2.mass));
          x_position += mD1*cos(cna+180);
          y_position += mD1*sin(cna+180);
          b2.x_position += mD2*cos(cna);
          b2.y_position += mD2*sin(cna);
          float nX = cos(cna);
          float nY = sin(cna);
          float a1 = xs*nX + ys*nY;
          float a2 = b2.xs*nX + b2.ys*nY;
          float oP = (2.0* (a1-a2)) / (mass + b2.mass);
          xs -= oP*b2.mass*nX;
          ys -= oP*b2.mass*nY;
          b2.xs += oP*mass*nX;
          b2.ys += oP*mass*nY;
        }
      }
    }
  }
 
    
  Lama(){
    // color of the hat
    c = color(10,153,0);
    // color of the body
    c2 = color(255,153,0);
    x_position = random(50,450);
    y_position = random(100,400);
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
  
  }

