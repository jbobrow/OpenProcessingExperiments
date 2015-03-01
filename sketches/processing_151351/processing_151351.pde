
float i = 0;
float j = 0;
float k = 0;
float num = 1;

void setup() {
  size(600, 600);
  background(0);
  smooth();
  strokeWeight(1);
  frameRate(20); 
}
  void draw() {
  fill(0,7);   //for overlapping rectangle
  noStroke();
  rect(0, 0, width, height);
  
  i = i + .01; //changes path of oscillation
  j = j + .05; //changes path of oscillation
  k = k + num; //changes color increment
  if ((k > 255)||(k < 0)) {
   num = num *-1;
   }
  stroke(50,k,200); //changes color range
  float a = map(cos(i+PI/2), -2, 2, 0, width);
  float b = map(sin(i), -2, 2, 0, height);
  float c = map(cos(j), -2, 2, 0, width);
  float d = map(sin(j+PI/2), -2, 2, 0, height);
 
  line(a, b, c, d);
  
  translate(width/2,height/2-425);
  rotate(radians(45));
  line(a, b, c, d);
  
  translate(width/2,height/2-425);
  rotate(radians(45));
  line(a, b, c, d);
  
  translate(width/2,height/2-425);
  rotate(radians(45));
  line(a, b, c, d);
  
  translate(width/2,height/2-425);
  rotate(radians(45));
  line(a, b, c, d);
  
  translate(width/2,height/2-425);
  rotate(radians(45));
  line(a, b, c, d);
  
  translate(width/2,height/2-425);
  rotate(radians(45));
  line(a, b, c, d);
  
  translate(width/2,height/2-425);
  rotate(radians(45));
  line(a, b, c, d);
}


