
float x = 60;          // X-coordinate
float y = 440;         // Y-coordinate
int radius = 60;       // Head Radius
int bodyHeight = 160;  // Body Height
int neckHeight = 70;   // Neck Height

void setup() {
  size(360, 480);
  smooth();
  strokeWeight(12);
    
    ellipseMode(RADIUS);
}
void draw() {
    
  int targetX = mouseX;

      
  if (mousePressed) {
    neckHeight = 10;
    bodyHeight = 70;
  } else {
    neckHeight = 70;
    bodyHeight = 160;
  }
    
  float ny = y - bodyHeight - neckHeight - radius;
    
  background(300);
  
// Neck
stroke(255, 0, 179);               //set colour pink
line(x+2, y-bodyHeight, x+2, ny);
line(x+22, y-bodyHeight, x+22, ny);

  
//body
noStroke();                //disable stroke
fill(17, 234, 229);                  //set fill to aqua
ellipse(x+16, y-33, 33, 33); //antigraviety orb
fill(17, 234, 229);                   //set fil to aqua
rect(x-45, y-bodyHeight, 120, bodyHeight-33);   //main body
fill(234, 234, 17);                 //set fill to lime
rect(x-45, y-bodyHeight+17,120, 6);     //stripe
rect(x-45, y-bodyHeight+7,120, 6);    //stripe
rect(x-45, y-bodyHeight-3,120, 6);    //stripe
 
  
//head
fill(17, 234, 105);                   //set fill to green
ellipse(x+15, ny, radius, radius); //head
fill (255);                //set fill to white
ellipse(x+32, ny-6, 20, 20); //large eye
ellipse(x+0, ny-6, 20, 20); //2nd eyed
ellipse(x+24, ny-6, 3, 3);   //pupil1
ellipse(x+1, ny-6, 3, 3);   //pupil2
fill (0);
fill (255);                //set fill to white
ellipse( x+24, ny-6, 12, 14); //large eye
fill(110);                   // set fill to black
ellipse(x+24, ny-6, 3, 3);   //pupil
ellipse(x+1, ny-6, 3, 3);   //pupil
fill (0);
 
}


