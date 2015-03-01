
earth e1; //declare class 

float x; //x position of orbit animation 
float y; //y position of orbit animation
float radius = 150; //radius or orbit animation. distance from center.
float degree = 0; //degree of orbit animation 

void setup() {
  size (650, 500, P3D); //P3D for rendering 3D object
  e1 = new earth(10, 0, 0, 13, 5, 0); //reset the value for earth class
}

void draw() {
  degree++; //variable degree get added value '1' for every loop
  background(100); //background color

  /* trace of orbit animation*/
  noFill(); // 
  stroke(150);
  ellipse(width/2, height/2, radius*2, radius*2);
  noStroke();
  /* trace of orbit animation*/

  /* draw orbit animation with earth class*/
  x = radius*cos(radians(degree/2)); //xpos using sin, cos value to animate orbit object(earth)
  y = radius*sin(radians(degree/2)); //ypos /2 is for reduce orbit speed. you can change this
    /* earth class does not have x, y position value 
    so I need 'translate function' to move earth object. 
    and to use 'push,popMatrix function' to reset Matrix canvas*/
  pushMatrix(); 
  translate(x, y);
  e1.update();
  popMatrix();
  /* draw orbit animation with earth class*/
}

/* setting up earth object with satellite object class */
class earth {
  //this class has these kind of variable...
  float earthSize, moonXpos, moonYpos, moonDist, moonSize, degree;
  earth (float sizeE, float x, float y, float d, float sizeM, float d1) {
    earthSize = sizeE; //size for earth(blue sphere)
    moonXpos = x; //x position of satellite(white sphere) 
    moonYpos = y; //y position of satellite(white sphere) 
    moonDist = d; //distance of satellite(white sphere)
    moonSize = sizeM; //size of satellite(white sphere)
    degree = d1; //degree of orbit animation for satellite(white sphere)
  }

  void update() {
    /* draw orbit animation for satellite*/
    degree++; //variable degree get added value '1' for every loop
    moonXpos = moonDist*cos(radians(degree))*1.3; //*1.3 for make spiral movement
    moonYpos = moonDist*sin(radians(degree)); 

    pushMatrix();
    translate(width/2, height/2); //to draw object on center of canvas
    
    /* to rotate orbit ring */
    rotateX(PI/2+degree/1000);
    rotateY(degree/1000);
    rotateZ(degree/1000);
    /* to rotate orbit ring */
    
    /* draw earth object */
    noStroke();
    fill(72, 149, 229);
    sphere(earthSize);
    /* draw earth object */
    
    /* draw orbit ring for orbit object */ 
    noFill();
    stroke(255);
    strokeWeight(1);
    ellipse(0, 0, moonDist*2*1.3, moonDist*2); //*1.3 for make spiral 
    /* draw orbit ring */
    
    /* draw satellite object */
    translate(moonXpos, moonYpos); //refer *draw orbit animation for satellite* 
    fill(255, 253, 242);
    noStroke();
    sphere(moonSize);
    /* draw satellite object */
    
    translate(-width/2, -height/2); //reset canvas matrix
    popMatrix();
  }
}

