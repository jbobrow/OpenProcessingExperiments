
 /*
 // Sierpinski
 // 
 // Creating a Sierpinski triangle using the chaos game iteration method
 // and then rotating it.
 //
 // http://en.wikipedia.org/wiki/Sierpinski_triangle#Chaos_game 
 //
 // Youssef Faltas, April 2014
 //
 */
 
int r, L, d;

float vx1, vy1, vx2, vy2, vx3, vy3;   // 3 vertices
float vx, vy;                         // a random vertix
float x, y;                           // a point

PImage tri;
float angle;


void setup() {

  size(192, 157); 
  frameRate(100);
  
  background(0); 
  noStroke();

  d = 20 ;                       // width = 2d + L
  L = width-(2*d);

  // an equilateral triangle, side = L 
  vx1 = d; 
  vy1 = height-d;
  vx2 = d+L;
  vy2 = height-d;
  vx3 = 0.5*width;
  vy3= height - d - (L*sqrt(0.75));
  
  // start with a random point inside the triangle  
  x = random(vx1,vx2);
  y = random(vy3,vy1);
  
  tri = loadImage("https://pbs.twimg.com/media/BmJpWGvCEAExMT-.png"); 
  angle= 0;
  
}

void draw() { 
  
  // for the first 20 seconds create a Sierpinski triangle:
  //
  // 1- start from a random point inside the triangle (x,y) 
  // 2- pick a random vertix (vx,vy)
  // 3- go halfway towards it
  // 4- mark this new point
  // 4- repeat from the new point
  
  if(frameCount < frameRate*20){
    
    // pick a random vertix 
    r = ceil(random(0,3));
    if (r == 1) { vx = vx1; vy = vy1; }   
    if (r == 2) { vx = vx2; vy = vy2; }  
    if (r == 3) { vx = vx3; vy = vy3; }  
    
    // go halfway to the random vertix
    x = (x + vx) / 2;
    y = (y + vy) / 2;
    
    // colors
    if (x > width/2 &&  y > height/2 -d)  fill(255,3,222);
    if (x < width/2 &&  y > height/2 -d ) fill(222,255,3);
    if ( y < height/2  - 4 )              fill(3,222,255);
    
    // make a mark at this point 
    rect(x,y,1,1);
        
  }
  
  
  // after 20 seconds, rotate the triangle
  // by random angles < 90 degress
  
  if (frameCount > frameRate*20) {
    
    frameRate(4);                 // slow down the speed 
    background(0);
    translate(width/2,width/2);
    pushMatrix();
    rotate(radians(angle));       // rotate
    translate(-width/2,-width/2);
    image(tri,0,0);               // an image of the triangle
    popMatrix();
    
    // increase the angle by less than 90 degrees  
    angle = (random(0,90)+ angle)%360;
  }
 
} 


