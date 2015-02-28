
void setup() {
  size ( 800, 800);
  background (156, 139, 107);
}


void draw() {
  
float x = random( 0, 800);
float y = random (0, 800);
float rotar = random( 0.0 , 3.14);
 
pushMatrix();
translate( x++, y++);
rotate(rotar);
line (20, 10, 25, 20);
line (25, 10, 25, 20);
line ( 30, 10, 25, 20);
line(25, 20, 25, 30);

line (30, 20, 35, 30);
line (35, 20, 35, 30);
line ( 40, 20, 35, 30);
line(35, 30, 35, 40);
popMatrix();

}
