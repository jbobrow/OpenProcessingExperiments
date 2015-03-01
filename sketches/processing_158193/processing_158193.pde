
//Instructions
//click mouse to create a meteor shower
 
int n=200; //store number of stars
float t, dt; //angle for oscillation of sun brightness
boolean meteorsOn = false; //start with meteor shower turned off
Meteorshower [] meteors = new Meteorshower[20]; //create array with 20 meteors
Star[] stars = new Star[n]; //create array with n=200 stars
Spaceship spaceship = new Spaceship(mouseX, mouseY, 0); //create UFO
Planet[] planets = new Planet[5];//create array with 5 planets
 
void setup() {
  size (600, 600);
  background(0);
  smooth();
  noStroke();
 
  //make loop up to length of stars array to create multiple stars
  for (int n=0; n<stars.length; n++) {
    stars[n] = new Star();
  }
  //make loop up to length of planets array to create multiple planets
  //planets are looped every 70 units away from the center of the screen, orbit at random frequencies, have random colors
  for (int i=0; i<planets.length; i++) {
    planets[i] = new Planet(70*i, random(10, 25), 0, random(0.015, 0.025), random(250), random(250), random(250));
  }
}
 
void draw() {
 
  background(0);
 
  //draw and update each star

   
  //draw sun's glow, oscillating brightness of area outside sun and use loop to create gradient for transparency
  //(pt. 2 from assignment)
 
 
  //draw and update each planet
  //(pt. 3 of assignment)

   
  //draw the yellow part of the sun

 
 
  //what to do when the boolean meteorsOn is true (create meteor shower by drawing and updating meteors)
  //(pt. 3 of assignment)
  if (meteorsOn) {
    for (int m=0; m<meteors.length; m++) {
      meteors[m].draw();
      meteors[m].update();
    }
  }
 
  //draw UFO from spaceship class
  spaceship.draw();
}
 
//when mouse is pressed, the boolean meteorsOn becomes true and a meteor shower is initialized
//adjust starting points of meteors to compensate for translation under meteor.draw
//meteors have random position from left end of screen, random size, random speed in x direction, travel at a random angle
void mousePressed() {
  meteorsOn = true;
  float a = random(-PI/4, PI/4);
  for (int m=0; m<meteors.length; m++) {
    meteors[m] = new Meteorshower(random(-3*width/4,-width/2), random(-height/2,height/2), random(5, 10), random(5, 10), a);
  }
}
 
//class describing what stars do
class Star {
  float x, y; //position
  float r; //radius
  float t, dt; //oscillation
 
  //initialize star at random coordinates, with these radii and frequencies of oscillating brightness
  Star() {
    x=random(width);
    y=random(height);
    r=random(2, 4);
    t=random(2*PI);
    dt=radians(random(0.1, 2));
  }
 
  //update the value inside sin() to change brightness between 0 and 255
  //(pt. 2 of assignment)
  void update () {
    t += dt;
  }
 
  //draw star
  void draw() {
    fill(255*sin(t));
    ellipse(x, y, r, r);
  }
}
 
//class describing what meteors do when created
class Meteorshower {
  float x, y; //position
  float r; //radius
  float dx; //speed in x direction
  float a; //angle of rotation
 
  //initialize meteor
  //(pt. 1 from assignment)
  Meteorshower(float x0, float y0, float r0, float dx0, float a0) {
    x=x0;
    y=y0;
    r=r0;
    dx=dx0;
    a=a0;
  }
 
  //rotate coordinates about center of canvas at a random angle and draw meteor, then return coordinates to normal
  void draw() {
    pushMatrix();
    translate(width/2,height/2);
    rotate(a);
    fill(200,200,200,random(150,255));
    ellipse(x, y, r, r);
    popMatrix();
  }
 
  //update position of meteor
  //(pt. 2 of assignment)
  void update() {
    x+=dx;
  }
}
 
//class describing planets
class Planet {
  float d; //distance from sun
  float r; //size of planet
  float a; //angle planet makes with horizontal x axis
  float da; //rate of change in angle
  float R; //red
  float G; //green
  float B; //blue
 
  // initialize planet
  Planet (float d0, float r0, float a0, float da0, float R0, float G0, float B0) {
   
  }
 
  //draw ellipse with these colors and at position that depends on angle a and with size r
  void draw() {
    fill(R, G, B);
    ellipse(width/2+d*cos(a), height/2+d*sin(a), r, r);
  }
 
  //update angle with respect to horizontal x axis
  //(pt. 2 of assignment)
  void update() {
    a+=da;
  }
}
 
//class describing what UFO does
class Spaceship {
  float x, y, dx, dy; //position and change in position
  float e = 0.1; //easing towards mouse
  float a; //angle of rotation
 
  //initialize spaceship
  //(pt. 1 from assignment)
  Spaceship(float x0, float y0, float a0) {
    x=x0;
    y=y0;
    a=a0;
  }
 
  //draw UFO that eases toward and rotates depending on mouse position
  //(pt. 2 from assignment)
  void draw() {
    dx = (mouseX-x)*e;
    dy = (mouseY-y)*e;
    x+=dx;
    y+=dy;
    //rotate coordinates about UFO position depending on how far left or right of the mouse the UFO is,
    //then return to normal coordinates
    pushMatrix();
    a = radians(mouseX-x);
    translate(x, y);
    rotate(a);
    fill(255);
    ellipse(0, 6, 10, 10);
    fill(250, 0, 0);
    ellipse(0, 0+2, 25, 15);
    fill(200, 230, 255);
    arc(0, 0, 15, 15, -PI, 0);
    ellipse(0, 0, 15, 5);
    popMatrix();
  }
}
