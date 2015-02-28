
float angle = 0.0;
void setup() {
size(120, 120);
smooth();
}

void draw() {
translate(mouseX, mouseY);
rotate(angle);
rectMode(CENTER);//a:drawing the square from center of mouseposition

/* measures the distance of the mouse from the centre of the window
and withdraw the distance from 90
use abs to get a positive number to use for the size of the square

*/
float z = 90-dist(height/2, width/2, mouseX, mouseY);
/*the maximum distance from the centre of the window is a little less
than 90. Withdraw the distance from 90 to make the square big in the centre
and smaller towards the edge
*/
rect(0, 0, z, z);
angle += 0.1;
println(z); //used println to see the maximum distance to the centre
}


