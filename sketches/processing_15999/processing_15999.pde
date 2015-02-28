
void setup() {
  size(800, 800);
  background(255);  
  smooth();  
  noStroke();
}

void draw() {
  penguin(50, 100, 28, 80, 100, 1.2);
  penguin(250, 100, 29, 50, 70, 0.8);
  penguin(300, 100, 30, 30, 50, 0.5);
}

void penguin(int x, int y, int eye, int foot, int beak, float s ) {

  translate(x, y);
  scale(s);

  // body & face  
  fill(255, 230, 0);  
  arc (110, 340, 65, foot, PI, TWO_PI);  
  arc (190, 340, 65, foot, PI, TWO_PI);  
  fill(0);  
  ellipse ( 150, 105, 145, 150);  
  ellipse ( 150, 215, 200, 200);  
  ellipse ( 150, 240, 170, 180);  

  //eye & mouse  
  fill(255);  
  ellipse ( 150, 240, 150, 150);  
  ellipse ( 120, 80, 22, eye);  
  ellipse ( 180, 80, 22, eye);  
  fill(255, 230, 0);  
  quad (150, 93, 160, beak, 150, 127, 140, beak );   

  fill(0);  
  ellipse ( 120, 80, 10, 15);  
  ellipse ( 180, 80, 10, 15);

}


