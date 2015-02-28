
float num = 6;
int s = 3;

int center_x = 250;
int center_y = 250;
 
 
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
}
 
void draw() {
  background(0);
 
  for (int i = s;i>=3;i-=2) {
    fill(360,map(mouseX,0,width,0,255));
    strokeWeight(3);
    pushMatrix();
    translate(center_x, center_y);
    stroke(360 * i / s, 50, 100,map(mouseY,0,height,0,255));
    flower(0,0, i);
    popMatrix();
    
    pushMatrix();
    translate(center_x, center_y);
    rotate(radians(90));
    stroke(360 * i / s,30,100,map(mouseY,0,height,0,255));
    flower(0,0, i-1);
    popMatrix(); 
    
  }
  
}
void flower(float x, float y, float s) {
  for (int j = 0 ; j < num; j++) {
    pushMatrix();
    translate(x, y);
    rotate(radians((360/ num) * j));
 
    for (float i = 5; i > 0;i--) { // 10
      ellipse(0, i*1.2*s, (s*i+3)*0.8, (s*i+3)*0.8);//1.2
    }
    popMatrix();
  }
}
 
 
void mousePressed() {
  if (mouseButton == LEFT) {
    s++;
    
  }
  else {
    num++;
  }
}
 
void keyPressed () {
  num = 6;
  s = 3;
}

