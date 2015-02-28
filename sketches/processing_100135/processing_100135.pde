
/**
 * references the example library: 'Simple 3D Bird' by Ira Greenberg.  
 */

Starfield starfield; 
 
PImage pig;
float ang = 0, ang2 = 0, ang3 = 0, ang4 = 0;
float px = 0, py = 0, pz = 0;
float flapSpeed = 0.07;

PImage pig2;
float ang5 = 0, ang6 = 0, ang7 = 0, ang8 = 0;
float px2 = 0, py2 = 0, pz2 = 0;
float flapSpeed2 = 0.12;

PImage pigwing1;
PImage pigwing2;

void setup(){
  
  size(1100, 640, P3D);
  pig = loadImage("pigsfly2.png");
  pig2 = loadImage("pigsfly1.png");
  pigwing1 = loadImage("pigwing1.png");
  pigwing2 = loadImage("pigwing2.png");
  starfield = new Starfield( 100 );
  noStroke();
    
}

void draw(){
  background(0);
  starfield.draw();
  lights();

  // Flight
  px = sin(radians(ang3)) * 199;
  py = cos(radians(ang3)) * 20;
  pz = sin(radians(ang4)) * 350;
  translate(width/2 + px, height/2 + py, -700+pz);
  rotateX(sin(radians(ang2)) * 12);
  rotateY(sin(radians(ang2)) * 5);
  rotateZ(sin(radians(ang2)) * 6);
   
  // Body
  fill(255);
  image(pig, 0,0, width/2, height/2);
  // wing1  
  fill(255);
  pushMatrix();
  rotateY(sin(radians(ang)) * -20);
  image(pigwing1, 0,-30, width/2, height/2);
  popMatrix();
  // wing2
  fill(255);
  pushMatrix();
  rotateY(sin(radians(ang)) * 20);
  image(pigwing1, 0,-30, width/2, height/2);
  popMatrix();
  
  // first flap
  ang += flapSpeed;
  if (ang > 3) {
    flapSpeed *= -1;
  } 
  if (ang < -3) {
    flapSpeed *= -1;
  }

  // first angles
  ang2 += 0.01;
  ang3 += 2.0;
  ang4 += 0.75;
  
  // flight2
  px2 = sin(radians(ang7)) * 100;
  py2 = cos(radians(ang7)) * 40;
  pz2 = sin(radians(ang8)) * 700;
  translate(width/4 + px2, height/4 + py2, -10+pz2);
  rotateX(sin(radians(ang6)) * 6);
  rotateY(sin(radians(ang6)) * 2);
  rotateZ(sin(radians(ang6)) * 3);

  // body2
  fill(255);
  image(pig2, 0,0, width/2, height/2);
  // wing3
  fill(255);
  pushMatrix();
  rotateY(sin(radians(ang5)) * -15);
  image(pigwing1, 0,0, width/2, height/2);
  popMatrix();
  // wing4
  fill(255);
  pushMatrix();
  rotateY(sin(radians(ang5)) * 15);
  image(pigwing1,0, 0, width/2, height/2);
  popMatrix();

  // second wing flap
  ang5 += flapSpeed2;
  if (ang5 > 4) {
    flapSpeed2 *= -1;
  } 
  if (ang5 < -4) {
    flapSpeed2 *= -1;
  }

  // second angles
  ang6 += 0.01;
  ang7 += 3.0;
  ang8 += 0.75;
}


public class Starfield {
private Star stars[];
private int count;
public Starfield( int count ) {
this.count = count;
stars = new Star[count];
for ( int i =0; i < count; i++) {
stars[i] = new Star( random( width ), random( height ), random( 50 ));
}
}
public void draw() {
strokeWeight( 5 );
for ( int i =0; i < count; i++) {
stroke( stars[i].z * 25 );
point( stars[i].x, stars[i].y );
stars[i].x -= stars[i].z;
if (stars[i].x < 0) {
stars[i] = new Star( width, random( height ), sqrt(random( 300 )));
}
}
}
}
class Star {
float x, y, z;
Star( float x, float y, float z ) {
this.x = x;
this.y = y;
this.z = z;
}
}






