
//Mady Dean 03/13/14 Creative Computing: Section B//

int x = 0;
size(600, 600);
background(153, 51, 255);
 
noStroke();

while (x <= 600) {
  int z = 0;
  while (z <= 600) {
    fill(0, 102, 102);
    ellipse(x, z, 25, 25);
    z= z+25;
  }
  x=x+25;
}



