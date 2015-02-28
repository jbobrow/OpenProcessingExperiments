
/**
By Jordan Dozzi,
TRIANGLE_STRIP Mode thanks to Ira Greenberg @ Processing.
http://processing.org/learning/basics/trianglestrip.html
**/

float r;
float g;
float b;
float z;

void setup() {
size(900, 900);
background(255);
smooth();
frameRate(15);
}

//Random background colors introduced
//A random function as well for the complexity of the trig strips (point control)

void draw () {
r=random(255);
g=random(255);
b=random(255);
z=random(40);

background(r,g,b);
 
int x = width/2;
int y = height/2;
float outerRad = min(width, height) * .1;
//Assigning a good number for the innerRad creates depth & balance between 2 strips.

float innerRad = outerRad * 4;
float px = 0, py = 0, angle = 0;

/**Controlling the rotation with rot adds to the complexity and completes
the revolution of the circular strip.
**/

float pts = z;
float rot = 1080/pts;
beginShape(TRIANGLE_STRIP);
for (int ii = 0; ii < 4; ii++) {
  for (int i = 0; i < pts; i++) {
    if (mousePressed) {
      noFill();
      stroke(10);
    }else{
      fill(random(200,255));
    }
//The mousePressed allows one to see the wireframe of both inner and outer componenets 
//of the triangle strip

    px = x + sin(radians(angle))*outerRad;
    py = y + cos(radians(angle))*outerRad;
    angle += rot;
    vertex(px+i, py+i);
    px = x + cos(radians(angle))*innerRad;
    py = y + sin(radians(angle))*innerRad;
    stroke(204);
     
    vertex(px, py);
 
    angle += rot;
  }
  pts -= 5;
  innerRad = outerRad * ii/3;
}
 
endShape();

}




