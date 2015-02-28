
//Michael's additions

//using array
//version 9 with segments from spring 2012, http://www.openprocessing.org/sketch/55408

DotMove[] dots = new DotMove[3000];
PImage logo;
float t;

void setup() { 
  size(600, 600);
  smooth();
  for (int i = 0; i<dots.length; i++) {
    float x = random(width);
    float y = random(height);
    int r = i + 2;
    dots[i] = new DotMove(x, y, r);
    
    logo = loadImage("nasa_logo.png");
  }
}

void draw() { //methods
  background(255);
  

  noStroke();
  fill(237, 27, 47);
  for (int i = 0; i <dots.length; i++) {
    dots[i].move();
    dots[i].display();

    //t = map(d, 30, 60, 255, 0);
  }
}

class DotMove { 

  float x, y; //calculate wiggling coords
  float targetX; //target that ex and ey are trying to get to
  float targetY;
  int diameter;
  float speed = 2.5;
  float ex, ey; //will keep track of the eased position of the Dot as it tries to go from where it is, to its target
  float ox, oy;
  float easing = 0.04;

  DotMove(float tempX, float tempY, int tempDiameter) { //constructor
    x = tempX;
    y = tempY;
    ex=x;
    ey=y;
    diameter = tempDiameter;
  }

  void move() {

    if (dist(width/2, height/2, mouseX, mouseY)<=180) {
      targetX= width/2+random(-20, 20);
      targetY= height/2+random(-20, 20);
    }
    else 
    {
      targetX = x;
      targetY = y;
    }

    x += random(-speed, speed);
    y += random(-speed, speed);


    ex += (targetX-ex) * easing; //easing
    ey += (targetY-ey) * easing; //easing
  }

  void display() {
    
    //Grab colors from the reference image here.
    //Do anything associated with display here.
    
ellipse(ex, ey, 5, 5);
  if (dist(width/2, height/2, mouseX, mouseY)<=180) {
      targetX= width/2+random(-20, 20);
      targetY= height/2+random(-20, 20);
    float xpos = random (width);
  float ypos = random (height);
    
  color temp = logo.get(int(xpos), int(ypos)); //getting color
  
    if(blue(temp) < 200 )
{
    ex = xpos;
    ey = ypos;
    ellipse(ex, ey, 5, 5);

    }
  }else{
    ellipse(ex, ey, 5, 5);
    }
 }

}


