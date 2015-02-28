
 /*
ACCD Spring 2013
ID03
6//Parameterized Form
Jinha Kim
*/
 
 
void setup() {
  size(800, 200);
  smooth();
  noLoop();
}
 
void draw() {
  background(230);
   
  for (int i = 20; i < width-10; i = i + 200) {
    for (int j = 20; j < height-10; j = j + 200) {
    
  float sw = random(3);
  float rs = random(0.5, 1.1);
  color c = color( random(255), random(255), 255);
  color st = color(random(255), random(255), random(255));
   
  float pages = random(100,20);
  float cover = random(80, 150);
  float spine = random(10, 30);
  float top = random(10, 30);
   
  book(i, j, pages, cover, c, spine, sw, top);
    }
 }
}
 
 
void book(float x, float y, float pages, float cover, color c, float spine, float sw, float top) {
 //strokeWeight(sw);
  
 pushMatrix();
 translate(x, y);
 //rotate(angle);
 //scale(scaler);
 
  
fill(c, 50);
stroke(c);
//spine
quad(0, 0, 10, 10, 10, cover-10, 0, cover-20);

fill(c, 50);
stroke(c);
//pages
line(0, 0, pages+10, 10);
line(2, 2, pages+12, 12);
line(4, 4, pages+14, 14);
line(6, 6, pages+16, 16);


fill(c, 50);
stroke(c);
//spine
quad(10, 10, pages+20, 20, pages+20, cover-5, 10, cover-10);
text("books", 48, 40, pages, 50);

popMatrix();
}

 
 
void mousePressed() {
 redraw();
  }




