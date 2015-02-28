
/* "leicht-schwer" - Susanne Appelhanz,
HTW Berlin, Sommersemester 2011 */

int x = 400;
int y = 400;
int z = 400;
 
void setup() {
 size(400, 400);
 smooth();
}

void draw() {
background(255);
if(mousePressed){
   fill(0);
   ellipse(40, y, 10, 10);
   ellipse(80, x, 10, 10);
   ellipse(120, z+30, 30, 30);
   ellipse(120, x-300, 20, 20);
   ellipse(180, x+20, 50, 50);
   ellipse(250, z, 20, 20);
   ellipse(250, x-300, 10, 10);
   ellipse(350, y+20, 10, 10);
x = x + 5;
y = y + 6;
z = z + 7;
}else{
   fill(255);
   ellipse(40, y, 10, 10);
   ellipse(80, x, 10, 10);
   ellipse(120, z+30, 30, 30);
   ellipse(120, x-300, 20, 20);
   ellipse(180, x+20, 50, 50);
   ellipse(250, z, 20, 20);
   ellipse(250, x-300, 10, 10);
   ellipse(350, y+20, 10, 10);
x = x - 1;
y = y - 2;
z = z - 3;
}}

