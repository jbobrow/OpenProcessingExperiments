
float x1, x2, y1, y2; //sets up coordinates for composition
PImage pic;


void setup() {
  size(300, 300);
  background(255);
  smooth();
  pic = loadImage("pastel.jpg");
  frameRate(10);  //sets speed of the composition
}

void draw() {
  for (int y=0; y <= width; y+=height/2) {  //controls the random color selection
    for (int x=0; x <= width; x+=height) {

      int a = int(random(0, pic.width));   
      int b = int(random(0, pic.height));  

      color c = pic.get(a, b);   //randomly selects colors
      strokeWeight(random(0, 50));  //creates random thickness among triangles  
      stroke(c, 125);

      x1 = x1 + random(-10, 10); //randomly places triangles between set integers
      y1 = y1 + random(-10, 10);

      noFill();
      triangle(x1, y1, 10, 10, a, b);


      if (a > width) {        //sets up the composition to repeat the strokes              
        x1 = 0;                              
        y1 = random(width);

        if (b > height) {                     
          x1 = random(height);                             
          y1 = 0;
        }
      }
    }
  }
}


