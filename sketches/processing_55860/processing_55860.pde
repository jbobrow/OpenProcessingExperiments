
float x = 276;
float y = 257;
int z = 100;
int bodyHeight = 60;
int neckHeight = 157;
int radius = 45;

float easing = 0.3;

void setup () {
  size(720, 480); 
  smooth();  
  ellipseMode(RADIUS); 
}
void draw() {
  
  int targetX= mouseX;
  x += (targetX - x) * easing;
  
  
//Background
background(#0F0F0F);
fill(#F5F5D7);
ellipse(x+200, y-200, 50, 50);
fill(#BEBFA2);
ellipse(x +189, y -198, 6, 6);
ellipse(x + 210, y - 220, 10, 10);
ellipse(x + 178, y - 189, 9, 9);
ellipse(x + 230, y - 180, 9, 9);

// Neck 
stroke(#0C3BF0); 
strokeWeight(10);
line(x, y, x, z);
// Arms
strokeWeight(10);
stroke(#0C3BF0);
line(x, y, neckHeight-7, neckHeight + 7);        // Left arm
line(x, y, z *4, neckHeight + 7);                 // Right arm
noStroke();
fill(#0C3BF0);
ellipse(neckHeight -7, neckHeight +7, 20, 20);   // left hand
ellipse(z *4, neckHeight +7, 20, 20);  //right hand
//Legs
strokeWeight(10);
stroke(#05165A);
line(x +10, y + 53, z *3, y + 193);
line(x - 10, y +53, z *2, y + 193);
// Antennae
strokeWeight(20);
stroke(#ED1A1A);
line(x, z, x, bodyHeight);    //antenna
// Body 

// Head 
noStroke(); 
fill(255); 
ellipse(x + 15, z +40, 14, 14);    //Large eye right
ellipse(x -15, z + 40, 14, 14);
fill(0);
ellipse(x + 12, z + 50, 3, 3);      //Pupil
ellipse(x - 12, z + 30, 3, 3);      //pupil left

if (mousePressed) {
  fill(#ED1A1A);
 neckHeight = 200;
} else {
  
  fill(#0C3BF0);
  neckHeight= 157;
  }
  ellipse(x, y, 33, 33);
  ellipse(x, 310, bodyHeight, bodyHeight);
}



