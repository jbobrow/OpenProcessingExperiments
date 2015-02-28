
 void setup() {
  size(600, 600);
  smooth();
  background(0);
}

float x=1.00;
float y=1.00;
float a= 1.00;
float b= 1.00;

boolean edgeLines = true;

void draw() {
  float xx= noise(x);
  float yy= noise(y);
  float aa= noise(a);
  float bb= noise(b);
  
  float x2= map(xx, 0, 1, 0, width);
  float y2= map(yy, 0, 1, 0, height);
  float a2= map(aa, 0, 1, 0, width);
  float b2= map(bb, 0, 1, 0, width);


if (edgeLines == true){

  stroke(250, 3, 3, 5); //red
  
  line(a2, 0, x2, y2);
  line(b2, height, y2, x2);
  
  stroke(9, 3, 250, 5); //blue
  
   line (0, x2, b2, y2);
  line(width, y2, a2, x2);
}
  
  stroke(250, 3, 3, 15); //red
  
  line (a2, b2, x2, y2);
  line (b2, a2, x2, y2);
  line (a2, b2, y2, x2);
  line (b2, a2, y2, x2);
  
  stroke(9, 3, 250, 15); //blue
    
  line (a2, x2, b2, y2);
  line (x2, a2, y2, b2);
  line (y2, x2, x2, y2);
  line (b2, a2, a2, b2);
  
  x=x+random(0.0, 0.009);
  y=y+random(0.0, 0.009);
  a=a+random(0.0, 0.009);
  b= b+random(0.0, 0.009);
}

void mousePressed() {
  background(0);
}

void keyPressed(){
  if(key == ' '){
    edgeLines =! edgeLines;
  }
  
  if(key== 's'|| key=='S'){
    saveFrame("PerlinLine-###.jpg");
  }

}

