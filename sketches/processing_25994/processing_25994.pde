
//Based on the car driving example in learning about objects tutorial.
Planet myPlanet1;
Planet myPlanet2;
Planet myPlanet3;

void setup() {
  size(400,400);
  // Parameters go inside the parentheses when the object is constructed.
  myPlanet1 = new Planet(color(255,0,0),200,10); 
  myPlanet2 = new Planet(color(0,0,255),100,20);
  myPlanet3 = new Planet(color(120),50,5);
}


void draw() {
  background(0);
  stroke(255);
  ellipseMode(CENTER);
  fill(0);
  ellipse(width/2,height/2,400,400);
  ellipse(width/2,height/2,200,200);
  ellipse(width/2,height/2,100,100);
  stroke(0);
  fill(150,150,0);
  ellipse(width/2,height/2,30,30);
  myPlanet1.orbit();
  myPlanet1.display();
  myPlanet2.orbit();
  myPlanet2.display();
  myPlanet3.orbit();
  myPlanet3.display();
}

// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Planet { 
  color c;
  float xpos;
  float ypos;
  //float xspeed;
  //float yspeed;
  float csize;
  float oradius;
  float vr;
  float theta;


//1/2v^2=GM/r^2
//Angle zero degrees pointing straight up. 
//theta = 

  // The Constructor is defined with arguments.
  Planet(color tempC, float temporadius, float tempsize) { 
    c = tempC;
    oradius = temporadius;
    vr = sqrt(2*800/sq(oradius));
    xpos = width/2;
    ypos = (height/2)-oradius;
    //xspeed = -vr;
    //yspeed = 0;
    csize = tempsize;
    theta = 0;
  }

  void display() {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,csize,csize);
  }

  void orbit() {
    theta = theta + vr/oradius;
    //xpos = xpos + xspeed/2;
    //ypos = ypos + yspeed/2;
    //yspeed = -vr*((xpos-width/2)/oradius);
    //xspeed = vr*((ypos-height/2)/oradius);
    xpos = width/2-oradius*sin(theta);
    ypos = height/2-oradius*cos(theta);
  }
}


