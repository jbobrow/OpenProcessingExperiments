
void setup() {
  background(255, 255, 255);
  size(1024, 768);
//size(1024, 768);
  smooth();
  noStroke();
}
 
 
void draw() {
 int triDistance = 20;

 for (int x = 10; x<width+20; x=x+triDistance)
 {
   for (int y = 10; y<= height+20; y=y+triDistance) {
     fill(random(256), random(256), random(256));
     triangle(x, y, x+10, y+10, x-10, y+10);
     fill(0, 0, 0);
   triangle(x+10, y+10, x-10, y-10, x+10, y-10);
   }
 }

}
