
//particle generator modified from kit cheong demo code 


class Particle {

  // declare global variables
  
  PShape logo;
  
  float xpos;
  float ypos;
  float _xpos;
  float _ypos;

  float xspeed;
  float yspeed;

  float x;//left wing flapping x
  float x2;//right wing flapping x
  float y;//wings flapping y
  float px, py;//updated location of particle
  float easing = random(.02,.07);//easing acceleration controller
  float m_wingspeed ;//wingflapping speed
  float m_speed;
  float ang;
  float wfran;


  float dia;//diameter of the firefly
  
  
  

  // constructor
  Particle(float _xpos, float _ypos, float _xspeed, float _yspeed) {
    
    shapeMode(CENTER);
    logo = loadShape("LOGO2.svg");

    xpos = _xpos;
    ypos = _ypos;
    xspeed = _xspeed;
    yspeed = _yspeed;
    dia = 400;
  }

  // functionalities
  void run() {
    display();
    update();
    bounce();
  }
  
 

  //spreading the array of particles
  void update() {

    
    //import from mouse targetted file
     //changing the target of the particle  
  if (ctarget) {
    xpos += xspeed;
    ypos += yspeed;
  } 
  else {
    xpos += xspeed;
    ypos += yspeed;
    float targetX = mouseX;
    float targetY = mouseY;
    xpos += (targetX - xpos) * easing;
    ypos += (targetY-ypos) * easing;
  }
  
 
  
  //motion of the particle

  float speed = dist(px, py, xpos, ypos);
  println(speed);
  m_speed = map(speed, 0, 20, 0.05, 0.1);
  m_wingspeed = map(speed, 0, 20, 5, 2);

  //wingtip motion
  float angle = frameCount/m_wingspeed;  //keep the point so it forces float mode!
  //wingtip points
  //wfran= random(2);
  x=  map(sin(angle), -1, 1, 113, 202);
  x2 = map (sin(angle), -1, 1, -111, -202); 
  y=  map(sin(angle), -1, 1, 71, 125);

  //modifiers of the constructed logo
  ang = atan2(py-ypos, px-xpos);

  px = xpos;
  py = ypos;

  }
  

void display() {
  pushMatrix();
  translate(xpos, ypos);
  rotate (ang-(PI/2));
  scale(m_speed);
  shape(logo, 0, 0, dia, dia);

  //properties of the wings
  fill(51, 51, 51);
  noStroke();

  //wing right
  beginShape();
  vertex(63, -1);
  vertex(162, -59);
  vertex(x, y);
  vertex(25, 177);
  vertex(25, 75);
  endShape();

  //wing left
  beginShape();
  vertex(-63, -1);
  vertex(-162, -59);
  vertex(x2, y);
  vertex(-25, 177);
  vertex(-25, 75);
  endShape();
  popMatrix();
}


  void bounce() {
    if (xpos < 5 || xpos > width-5) {
      xspeed = xspeed*-1;
    }
    if (ypos < 5 || ypos > height-5) {
      yspeed = yspeed*-1;
    }
  }
}




