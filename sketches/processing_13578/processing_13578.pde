
/*created by rebirth
 Controls:
 UP Arrow - Thrust
 Left and Right Arrows - turn rocket
 -(minus) - zoom out 
 +(plus) - zoom in
 R - reset simulation
 Q - increase gravity of Earth
 W - decrease gravity of Earth
 A - increase thrust
 S - decrease thrust
 G - toggle constant graviy off/on. with it on the gravity decreases as you get further from the Earth (as is what really happens)
 P - pause/unpause
 
 */


float g=-9.81;//meter/s/s gravitational constand
float r=6371000;//the earth's mean radius in meters
PImage earth, rocket;
float pixel_r = 200;//the radius of the earth in pixels
float pixel_ratio = r/pixel_r; //the number of meters one pixel represents
float rocket_w = r*.2;//the verticle size of the rocket. a ridiculously big rocket so you can see it
float rocket_h = rocket_w * .3596;//the horizontal size of the rocket. maintain the aspect ratio of the rocket

//properties of the rocket
float rocket_x = 0;//space x cor
float rocket_y = r;//space y cor
float rocket_height;//determined by x and y cor
float rocket_angle = PI/2;
float rocket_power = 25;
PVector rocket_v = new PVector(0,0);//velcoty
boolean thrusting=false;

boolean grav_field=true;
boolean paused=false;

PFont font;


void setup() {
  background(0);
  size(800,800);
  ellipseMode(RADIUS);
  imageMode(CENTER);
  font = loadFont("ArialMT-20.vlw");
  textFont(font, 20);
  rocket = loadImage("rocket.png");
  earth = loadImage("earth.jpg");
  stroke(255);
}

void draw() {
  if (!paused) {
    background(0);
    draw_earth();
    if (grav_field)
      draw_gravity_field();
    draw_rocket();
    move_rocket();
    fill(255,0,0);
    text("rocket height: " + rocket_height/1000 + " km", 10, 20);
    text("rocket velocity: " + rocket_v.mag() + " m/s", 10, 40);
    text("rocket thrust: " + rocket_power, 10, 60);
    text("gravity of Earth: " + g, 10, 80);
  }
}

void draw_earth() {
  image(earth, space_to_screen_x(0), space_to_screen_y(0), pixel_r*2, pixel_r*2);
}

void draw_rocket() {
  pushMatrix();
  translate(space_to_screen_x(rocket_x), space_to_screen_y(rocket_y) - rocket_w/pixel_ratio/2);
  rotate(-rocket_angle);
  image(rocket, 0, 0, rocket_w/pixel_ratio, rocket_h/pixel_ratio);
  if(thrusting) {
    fill(255, 60, 0,220);
    noStroke();
    beginShape();
    translate(-rocket_w/pixel_ratio/2,0);
    vertex(0, rocket_h/pixel_ratio/2);
    vertex(0, -rocket_h/pixel_ratio/2);
    vertex(-rocket_h/pixel_ratio*2, 0);
    endShape(CLOSE);
  }
  popMatrix();
}



//apply forces to the rocket
void move_rocket() {
  float theta = PI - atan2(rocket_y,-rocket_x);//angle from positive x axis going counter clockwise
  float loc_g;//local gravity var
  PVector rocket_thrust;
  rocket_height = sqrt(rocket_x*rocket_x + rocket_y*rocket_y) - r;//the rocket's height from the Earth's surface
  if (grav_field) {
    loc_g = gravity_from_height(rocket_height);
  }
  else {
    loc_g = g;
  }
  fill(255,0,0);
  text("gravity acting on rocket: " + loc_g, 10, 100);
  if (rocket_height >= 0  || thrusting) {
    rocket_v.x += cos(theta)*g;
    rocket_v.y += sin(theta)*g;
    if(thrusting) {
      rocket_v.x += cos(rocket_angle)*rocket_power;
      rocket_v.y += sin(rocket_angle)*rocket_power;
    }
    rocket_x += rocket_v.x;
    rocket_y += rocket_v.y;
  }
  /*if (height = 0) {
   rocket_x = cos(theta)*r;
   rocket_y = sin(theta)*r;
   rocket_v.set(0,0,0);
   }*/
}

//given a gravity, return the height
float height_from_gravity(float gravity) {
  return(r/sqrt(gravity/g) - r);
}

//given a height, return the gravitational force
float gravity_from_height(float h) {
  return(g*(r/(r+h))*(r/(r+h)));
}

//draw a circle around the earth at every 10% gravity loss
void draw_gravity_field() {
  noFill();
  stroke(255);
  for(float i=1; i < 10; i++) {
    float h = pixel_r + height_from_gravity((float)i/10*g)/pixel_ratio;
    text(i*10 + "%", width/2 - 25, height/2 - h);
    ellipse(width/2, height/2, h, h);
  }
}

//keyboard input
void keyPressed() {
  switch (key) {
  case '-':
    pixel_r--;
    pixel_ratio = r/pixel_r;
    break;
  case '+':
  case '=':
    pixel_r++;
    pixel_ratio = r/pixel_r;
    break;
  case 'q':
  case 'Q':
    g-=.5;
    break;
  case 'w':
  case 'W':
    g+=.5;
    break;
  case 'a':
  case 'A':
    rocket_power += .5;
    break;
  case 's':
  case 'S':
    rocket_power -= .5;
    break;
  case 'g':
    grav_field = !grav_field;
    break;

  case 'r':
  case 'R':
    g = -9.8;
    rocket_power = 25;
    rocket_x = 0;//space x cor
    rocket_y = r;//space y cor
    rocket_v.set(0,0,0);
    rocket_angle = PI/2;
    break;
  case 'p':
  case 'P':
    paused = !paused;
    break;
  }


  if (key == CODED) {
    if (keyCode == RIGHT)
      rocket_angle -= .04;
    if (keyCode == LEFT)
      rocket_angle += .04;
    if (keyCode == UP) {
      thrusting = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      thrusting = false;
    }
  }
}

//given a space x coord, return the screen x coord
float space_to_screen_x(float space_x) {
  return(space_x/pixel_ratio + width/2);
}

//given a space y coord, return the screen y coord
float space_to_screen_y(float space_y) {
  return(height/2 - space_y/pixel_ratio);
}


