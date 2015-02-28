
Perfume red;
Perfume green;
Perfume blue;
 
void setup() {
  size(00, 400);
  smooth();
  red = new Perfume(150, 100, 1.2, 100, 255, 0, 0);
  green = new Perfume(390, 150, 0.5, 50, 0, 255, 0);
  blue = new Perfume(280, -130, 1.8, 200, 0, 0, 255);

}
 
void draw() {
  background(255);
 
  red.display();
   
  green.display();
   
  blue.display();
}



class Perfume {
  //data
  float x, y;
  float a, b;
  float c, d, e;
 

 
  //constructor
  Perfume(float xpos, float ypos, float r, float fv, float re, float gr, float bl) {
    x = xpos;
    y = ypos;
    r = re;



  }
 
  //function
  void display() {
  pushMatrix();
  translate(x, y);
  rotate(b);
  fill(random(250), random(50), random(250));

  quad(80, 118, 110, 120, 95, 125, 65, 123);
  quad(110, 120, 110, 145, 95, 155, 95, 125);
  quad(65, 123, 95, 125, 95, 155, 65, 150);
  quad(65, 155, 130, 162, 115, 175, 43, 165);
  quad(43, 165, 115, 175, 115, 275, 43, 258);
  quad(115, 175, 130, 162, 115, 275, 130, 255);
  ellipse(88, 165, 32, 7);
  line(72, 153, 72, 165);
  line(105, 150, 105, 165);
  popMatrix();
  }
 

 
}



