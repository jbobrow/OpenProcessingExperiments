
float amount = 15, num;
 
void setup() {
  size(800, 600);
  background(#2a2a2a);

  stroke(#4bd7a1, 100);

}
 
void draw() {

  fill(#2a2a2a);

  
  pushMatrix();
  rect(-1, -2, width+1, height+1);
 
  float maxX = map(800, 10, width, 10, 350);
 
  translate(200, height/2);
  for (int i = 0; i < 240; i+=amount) {
    float x = sin(radians(i+num)) * maxX;
    float y = cos(radians(i+num)) * maxX;
 
    float x2 = cos(radians(i+amount-num)) * maxX;
    float y2 = cos(radians(i+amount-num)) * maxX;
    noFill();
    bezier(x, y, x-x2, y-y2, x2-x, y2-y, x2, y2);
    bezier(x, y, x+x2, y+y2, x2+x, y2+y, x2, y2);
    fill(#ffe776);
    ellipse(x, y, 10, 10);
    ellipse(x2, y2, 5, 5);
  }
   translate(400, 50);
  for (int ii = 0; ii < 180; ii+=amount) {
    float x3 = sin(radians(ii+num)) * maxX;
    float y3 = sin(radians(ii+num)) * maxX;
 
    float x4 = cos(radians(ii+amount-num)) * maxX;
    float y4 = sin(radians(ii+amount-num)) * maxX;
    noFill();
    bezier(x3, y3, x3-x4, y3-y4, x4-x3, y4-y3, x4, y4);
    bezier(x3, y3, x3+x4, y3+y4, x4+x3, y4+y3, x4, y4);
    fill(#ffe776);
    ellipse(x3, y3, 5, 5);
    ellipse(x4, y4, 1, 1);
  }
 
 
  num += 0.5;
  
  popMatrix();
}
