
//Watch the triangles for each unit (hours, minutes, and seconds). As each
//increases, the color gets more intense, from black to blue, red, and green
//respectively.


PFont font;

void setup() 
{ 
  background(207, 242, 15);
  size(750, 250); 
  PFont font= loadFont("Apple-Chancery-48.vlw");
  textFont(font);
  smooth();
} 

void draw() 
{ 

  h(); 
  m(); 
  s(); 
} 

void h()
{ 
  int h = hour();
  fill(0, 0, h*9); 

  stroke(300, 0, 0);
  strokeWeight(3);
  triangle(150, 0, 0, 250, 250, 250);


  fill(0, 300, 0); 
  textSize(30);
  text(hour(), 160, 230);
} 

void m()
{ 
  int m = minute();  
  fill(m*3, 0, 0); 
  stroke(0, 300, 0);
  strokeWeight(3);
  triangle(350, 0, 250, 250, 500, 250);


  fill(0, 0, 300); 
  textSize(30);
  text(minute(), 410, 230);
} 

void s()
{ 
  int s = second();
  fill(0, s*3, 0); 
  stroke(0, 0, 300);
  strokeWeight(3);
  triangle(600, 0, 500, 250, 750, 250);


  fill(300, 0, 0); 
  textSize(30);
  text(second(), 660, 230);

} 








