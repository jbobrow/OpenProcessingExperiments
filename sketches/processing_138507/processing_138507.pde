
// abstract composition in blue
// can be re-created by clicking on the canvas

float[] rs = new float[6];
float m,t;

void setup() {
  size(500, 500);
  noStroke();
  background(0);
  m=min(width,height);
  for (int i=0; i < 6; i++) { 
    rs[i]=random(10,m/2);
  }
  t=random(8000,16000)+millis(); // timeout
}

void draw() {
  if (millis()<t) {
    noStroke();
    translate(random(0,width),random(0,height));   
    rotate(random(0,TWO_PI));  
    fill(0,0,128,60);
    triangle(rs[0],rs[1],rs[2],rs[3],rs[4],rs[5]);
    translate(random(0,width),random(0,height));   
    rotate(random(0,TWO_PI));
    fill(255,255,255,80);
    triangle(rs[0],rs[1],rs[2],rs[3],rs[4],rs[5]);  
  
}

}

void mousePressed() {
  setup();
}
