
/* Code by Julia Grzeskowiak
York/Sheridan Joint Program in Design */
//colour technique credit: Hikari Iwasaki resource: http://www.openprocessing.org/sketch/26882 // 

float y = 200.0;
float x = 200.0;
float z = 2;
float a = 2;
float b = 3;
float c = 4;
float d = 5;
float e = 200;
float f = 200;

float radius = 5.0; //set radius of ellipse

void setup(){
  size(400,400);
  frameRate (35);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  }
  
void draw(){
  background (50);
  
 
    radius = radius += 1.5;   // radius (5.0) equals radius + increasing by increments of 1.5
    ellipse(x, y, radius, radius); // x-coordinate of the ellipse is 200.0, y-coordinate is 200.0, width and height are set to radius (5.0)
    fill(color(e,f+70,z+=3,a+=2.5)); // fill colour of ellipse: Red set to e: (200), Green set to f: (200)+70, Blue set to z: (2)+increase by incements of 3, opacity set to a: (2)+ increase of increments of 2.5.
    
  if(radius > 300){ // if radius is greater than 300,
     radius = 0;    // make radius (0.5) equal to zero 
     e=130;         // and chance the following variables to different values; this will help in changing the colours of ellipse
     f=30;
     z=6;
     a=3;
  }
}
