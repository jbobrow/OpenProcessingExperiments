
float x ;
float y ;

float a = 180;
float b = 120;

float mass1 = 1.9 * pow(10, 30); //SUN
float density1 = 1.4;

float mass2 = 5.9 * pow(10, 24); //EARTH
float density2 = 5.5;

float grav = 6.67 * pow(10, -11); // gravitational constant

float factor = 0.00000001;
float theta;

float o = 1;

PVector v1, v2, v3, t;

////////////////////////////////////////////////

void setup(){
  size(450,450);
  noStroke();
  smooth();
  frameRate(60);
  float theta = 0; //true anomaly
}

////////////////////////////////////////////////

void draw() {

  float volume1 = mass1/density1;
  float radius1 = pow((0.75* volume1) /3.14, .333333);

  float volume2 = mass2/density2;
  float radius2 = pow((0.75* volume2) /3.14, .333333);

  float i = factor * radius1; //diameter of sun in km
  float j = factor * radius2; //diameter of earth in km

  float mu = grav*(mass1+mass1); // standard gravitational parameter

  float h = b * sqrt(mu / a); // specific relative angular momentum

  float e = sqrt((pow(a,2)-pow(b,2)))/(a); // eccentricity

  background(0); //background
  
  ////////////////////////////////////
  
  if((keyPressed)&&(key=='x')){
  }else{ 
    theta = theta + 1;  //loops theta
    if (theta > 360) {
      theta = 0;
    }
  }

  float thetarad = theta  * (PI/180);  //theta converted to raidans

  float r = ((pow(h,2)/(mu))*((1)/(1+o*e*cos(thetarad)))); // distance
  float rmax =((pow(h,2)/(mu))*((1)/(1+o*e*cos(3.14))));   // max distance
  float rmin =((pow(h,2)/(mu))*((1)/(1+o*e*cos(0))));      // min distance

  float x = cos(radians(theta)) * r + o*e*2*a; // x-coordinate from polar
  float y = sin(radians(theta)) * r ; // y-coordinate from polar

  float d = sqrt(pow(x,2)+pow(y,2));

  float v = sqrt(mu*(2/d - 1/a));

  float dis = -o*e*a;

  v1 = new PVector(x,y);

  ////////////////////////////////////

  fill(255, 204, 0);
  noStroke();
  ellipse(width/2 + dis, height/2, i, i); // sun

  fill(#0000FF);
  stroke(0);
  strokeWeight(1);
  ellipse(width/2 + v1.x + dis, height/2 + v1.y, j, j); // earth
  
  stroke(255);
  noFill();
  ellipse(width/2, height/2, 2*a, 2*b); //orbit

  noStroke();
  fill(#0000FF);
  ellipse( width/2 + v1.x + dis, height/2 + v1.y, 10*j, 10*j); // locator

////////////////////////////////////
  
  stroke(255);

  line( width/2 + v1.x + dis, height/2 + v1.y, width/2 + dis, height/2); //string
  v2 = new PVector(-v1.x, -v1.y);

  //line( width/2 + v1.x + dis, height/2 + v1.y, width/2 - dis, height/2); //string
  v3 = new PVector(-v1.x - 2*dis, -v1.y);

  //line(width/2 + dis, height/2, width/2 - dis, height/2); // mid line

  float v2mag = v2.mag();
  float totmag = v2.mag() + v3.mag();

  float part = v2mag/totmag;
  float mid = 2*-dis; //this line is 2*-dis long

  //line( width/2 + x + dis, height/2 + y, width/2 + dis + mid*part, height/2); // angle bisector

  float slope = -((height/2)-(height/2+v1.y)) / ((width/2 + dis + mid*part) - (width/2 + v1.x + dis)) ;

  float perp = -1/slope;
  float tanangle = atan(perp);
  float tx = 1000*cos(tanangle);
  float ty = 1000*sin(tanangle);
  
  t = new PVector(tx, ty);

  t.limit(v*.00000006);

  if(y<0){
    line(width/2 + v1.x + dis, height/2 + v1.y, width/2 + v1.x + t.x + dis, height/2 - t.y + v1.y);
  } 
  else {
    line(width/2 + v1.x + dis, height/2 + v1.y, width/2 + v1.x - t.x + dis, height/2 + t.y + v1.y);
  }

  ////////////////////////////////////
  strokeWeight(4);
  point(width/2 + a, height/2);  //east
  point(width/2 - a, height/2);  //west
  point(width/2, height/2 -b);   //south
  point(width/2, height/2 +b);   //north
  point(width/2, height/2);      //center
  point(width/2 +dis, height/2);      //focus of sun
  point (width/2 -dis, height/2);     //other focus

  ////////////////////////////////////
//B
  if((  mousePressed == true )&&( abs(width/2 - mouseX) < 20 )){
    b = abs(height/2 - mouseY);
  }
  
//A
  if(( mousePressed == true )&&( abs(height/2 - mouseY) < 20 )){
    a = abs(width/2 - mouseX);
  }

  ////////////////////////////////////

  if(a<b){
    fill(0);
    noStroke();
    ellipse(width/2, height/2, i, i); // sun

    stroke(255);
    strokeWeight(1);
    line(width/2+e*a, height/2, width/2 + x+e*a, height/2 +y); // string

    stroke(255);
    strokeWeight(4);
    point(width/2 -dis, height/2);      //focus of sun
  }

  ////////////////////////////////////

  if(a<b){  //adjusts a and b
    a++;
  }

  if((.5*i > a - (e*a))&&(a>b)){  //keeps sun within orbit
    a--;
  }
  
  ////////////////////////////////////

fill(255);

  text("a = " + a + ", b = " + b, 10, 15);
  text("r = " + r, 10, 30);
  text("theta = " + theta, 10, 45);
  text("d = " + d, 10, 60);
  text("v = " + v, 10, 75);
  text("x = " + x, 10, 90);
  text("y = " + y, 10, 105);

  ////////////////////////////////////

  if((keyPressed)&&(key == 'w')&&(a != b)) {
    b++;
  }
  if((keyPressed)&&(key == 's')){
    b--;
  }
  if((keyPressed)&&(key == 'a')&&(a != b)){
    a--;
  }
  if((keyPressed)&&(key == 'd')){
    a++;
  }
  if((keyPressed)&&(key == 'q')){
    o=1;
  }
  if((keyPressed)&&(key == 'e')){
    o=-1;
  }
}

