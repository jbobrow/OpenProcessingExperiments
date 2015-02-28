
// abstract composition in blue
// can be re-created by clicking on the canvas

float[] rs = new float[6];
float m,t;

void setup() {
  size(500, 500);
  noStroke();
  background(89);
  m=min(width,height);
  for (int i=0; i < 6; i++) { 
    rs[i]=random(10,m/2);
  }
  t=random(800,1800)+millis(); // timeout
}

void draw() {
  if (millis()<t) {
    noStroke();
    translate(random(0,width),random(0,height));   
    rotate(random(0,TWO_PI));  
    fill(86,93,128,60);
    triangle(rs[0],rs[1],rs[2],rs[3],rs[4],rs[5]);
    translate(random(0,width),random(0,height));   
    rotate(random(0,TWO_PI));
    fill(215,235,259,88);
    triangle(rs[0],rs[1],rs[2],rs[3],rs[4],rs[5]);  
  
}

}

void mousePressed() {
  setup();
}
