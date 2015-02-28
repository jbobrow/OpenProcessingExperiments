
//Classwork Sep. 25
//MG Garuz

//////////////// Squares in a line!
//for (int counter = 20; counter < width; counter+=50) {
 //draw stuff.
// rect(counter, 200, 20, 20);
 //};


//Line positions

void setup () {
 size (400, 400);
 }
 
 void draw() {
 background(255, 255, 255, 30);
 fill(255);
 smooth();
 for (int i = 100; i<width; i+=20) {
 //    line(0, 0, 200, i);
 //   line(width, height, 200, i);
 //    line(0, 0, i, 200);
 //    line(width, height, i, 200);
 line(mouseX, mouseY, i, height);
 }
 }
 
 
 
//for (int counter = 20; counter < width; counter+=50) {
 //draw stuff.
 //rect(random(width), random(height), 20, 20);
 //rect(counter, 200, 20, 20);
 //
 //};



