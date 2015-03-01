
/* Based on the "Planets" project by Sarah Oh on OpenProcessing
The sun's glowing and the stars are entirely her work. 
(http://www.openprocessing.org/sketch/142720) */

int n=200; //store number of stars
int current_point = 0; 
float t, dt; //angle for oscillation of sun brightness
 Star[] stars = new Star[n]; //create array with n=200 stars
Planet[] planets = new Planet[3];//create array with 2 planets
MyPoint[] points = new MyPoint[5]; //create array with 5 stored points
int num_conjunctions = 0;
 
void setup() {
  size (600, 600);
  background(0);
  smooth();
  noStroke();
 
  //make loop up to length of stars array to create multiple stars
  for (int n=0; n<stars.length; n++) {
    stars[n] = new Star();
  }
  /* first number: the inner planet has an orbital radius of 100 units; the out planet has an orbital radius of 200 units
     fourth number: the ratio of their angular velocities (inner to outer) is 13/8, so they coincide at 5 points */
  planets[0] = new Planet(0, 20, 0, 0, random(250), random(250), random(250));
  planets[1] = new Planet(100, 20, 0, .039, 255, 165, 0);
  planets[2] = new Planet(200, 20, 0, .024, 0, 0, 160);
}
 
//class describing planets
class Planet {
  float d; //distance from sun
  float r; //size of planet
  float a; //angle planet makes with horizontal x axis
  float da; //angular velocity (change in angle)
  float R; //red
  float G; //green
  float B; //blue
  float x; // JMG
  float y; // JMG
  
  
  // initialize planet
  Planet (float d0, float r0, float a0, float da0, float R0, float G0, float B0) {
    d=d0;
    r=r0;
    a=a0;
    da=da0; 
    R=R0;
    G=G0;
    B=B0;
  }
 
  //draw ellipse with these colors and at position that depends on angle a and with size r
  void draw() {
    fill(R, G, B);
    ellipse(width/2+d*cos(a), height/2+d*sin(a), r, r);
  }
 
  //update angle with respect to horizontal x axis
  void update() {
    a+=da;
  }
  
  float getAngle() { return a; }   // JMG 
  float getX()     { return width/2+d*cos(a); }   // JMG 
  float getY()     { return height/2+d*sin(a); }   // JMG 
 
}

//class for points
class MyPoint{
  float x; //x and y coordinates of the outer planet
  float y;
  
  MyPoint(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  String toString(){
    return "x is " + x + ", y is " + y + "\n";
  }
}
  
void draw() {
 
  background(0);
 
  //draw and update each star
  for (int n=0; n<stars.length; n++) {
    stars[n].update();
    stars[n].draw();
  }
   
  //draw sun's glow, oscillating brightness of area outside sun and use loop to create gradient for transparency
  for (float s=75; s<100; s++) {
    fill(sin(t)*255, 250*((90-s)/25));
    ellipse(width/2, height/2, s, s);         // JMG NOTE: the planet's x,y is calculated here
    dt=radians(0.03);
    t+=dt;
  }
 
  //draw and update each planet
  for (int i=0; i<planets.length; i++) {
    planets[i].draw();
    planets[i].update();
  }
  
  // draw an ellipse at each conjunction      // JMG
  fill(200, 0, 0);
  for (int i = 0; i < num_conjunctions; i++) 
    ellipse(points[i].getX(), points[i].getY(), 8, 8);
  
  // JMG add check for conjunction below
  float p0Angle, p1Angle, p2Angle;
  p0Angle = planets[0].getAngle();
  p1Angle = planets[1].getAngle();
  p2Angle = planets[2].getAngle();
  //since the angle just keeps increasing, this code sets both angles back to a 0-2pi scale to make in easier to find a conjunction
  float tempp1Angle, tempp2Angle;
  tempp1Angle = p1Angle % (2*PI); 
  tempp2Angle = p2Angle % (2*PI);
  // planets are considered to have conjunction if the difference in their angles is less than .0075 radians 
  float angleDif;
  angleDif = abs(tempp1Angle - tempp2Angle); 
  if (angleDif <= .0075 && current_point < 5) {    
    // once a conjunction is found, that point is stored as a function of the location of the outer planet
    println("conjunction found at", tempp1Angle);
    num_conjunctions += 1;
    // points[current_point] = new MyPoint(200*cos(p2Angle),200*sin(p2Angle)); 
    points[current_point] = new MyPoint(planets[2].getX(), planets[2].getY());    // JMG
    current_point+=1;
  }
  
  // the "if" statements below draw lines between the stored points and from the center of the sun through the planets' conjunction  
  if (current_point >= 1) {
    stroke(102,255,255);
    line(width/2,height/2,points[0].getX(),points[0].getY());
    stroke(0);
  }
  if (current_point >= 2) {
    stroke(255);
    line(points[0].getX(),points[0].getY(),points[1].getX(),points[1].getY());
    stroke(102,255,255);
    line(width/2,height/2,points[1].getX(),points[1].getY());
    stroke(0);
  }
  if (current_point >=3) {
    stroke(255);
    line(points[1].getX(),points[1].getY(),points[2].getX(),points[2].getY());
    stroke(102,255,255);
    line(width/2,height/2,points[2].getX(),points[2].getY());
    stroke(0);
  }
  if (current_point >= 4) {
    stroke(255);
    line(points[2].getX(),points[2].getY(),points[3].getX(),points[3].getY()); 
    stroke(102,255,255);
    line(width/2,height/2,points[3].getX(),points[3].getY());
    stroke(0);
  }
  if (current_point == 5) {
    stroke(255);
    line(points[3].getX(),points[3].getY(),points[4].getX(),points[4].getY());
    stroke(102,255,255);
    line(width/2,height/2,points[4].getX(),points[4].getY());
    stroke(0);
  }
  if (current_point == 5) {
    stroke(255);
    line(points[4].getX(),points[4].getY(),points[0].getX(),points[0].getY());
    stroke(0);
  }

    
        
   
  //draw the yellow part of the sun
  fill(255, 255, 150);
  ellipse(width/2, height/2, 75, 75);
 
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

