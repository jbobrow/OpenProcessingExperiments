
PImage pic;

//set up background
void setup() {
  size (300, 300);
  pic = loadImage("lumbee.jpg");
  background (40,86,98);
  smooth();
}
//establish variables that dictate size, shape, and color of arcs
float count = 25;
float arcSize;
float start;
float stop;
 
//draw random arcs based on placement of mouse and clicking of mouse
void draw() {
}
void mousePressed() {
  background(40,86,98);
  
  for (int x=0; x<width; x+=random(5,20)) {
    int a = int(random(0, pic.width));
    int b = int(random(0, pic.width));
   
 
    if (count > 0) {
      arcSize = random (50, 450); //random between 10 and 50
      start = random (0, TWO_PI);
      stop = random (0, TWO_PI);
      strokeWeight (3);
      stroke (93,64,7);
      color cfill = pic.get(a,b);
      
      fill (cfill,90);
      arc (150, 150, arcSize, arcSize, start, stop);
    }
  }
}
 



