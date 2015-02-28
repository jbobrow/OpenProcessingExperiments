
int number = 10;
 float[] angle = new float[number];
 float[] x = new float[number];
 float[] y = new float[number];
 float[] tx = new float[number];
 float[] ty = new float[number];
  
void setup()
 {
 smooth();
 size(1000, 700);
 
 for (int i=0; i<number; i++)
 {
 angle[i] = (PI*2);
 x[i] = random(10, width - 10);
 y[i] = 10;
 tx[i] = x[i] + random(0, 10);
 ty[i] = y[i] + random(0, 4);
 }
 }
  
 
void draw()
 {
  //background
 fill(100,10);
 rect(0, 0, width, height);
  
  //moving particles
for (int i=0; i<number; i++)
 {
 pushMatrix();
 translate(x[i],y[i]);
 rotate(angle[i] - PI/2);
 fill(random(0,150),random(0,150),255);
 noStroke();
 ellipse(3, 17, 8,8);
 popMatrix();
 
 //find distance
 float dx = tx[i] - x[i];
 float dy = ty[i] - y[i];
 float d = dist(tx[i], ty[i], x[i], y[i]);
 
  //speed and direction
tx[i] = x[i] + (dx / d) * 20 + random(-2, 2);
 ty[i] = y[i] + (dy / d) * 20 + random(-2, 2);

  //speed
follow(i, tx[i], ty[i],0.1);
  
}
  
for (int i=0; i<number; i++) {
 for (int j=0; j<number; j++) {
 if (i != j) {
 float d = dist(tx[i], ty[i], tx[j], ty[j]);
 //network range
 if (d <130)
{
 stroke(d,-d,random(0,200),200);

 line(tx[i], ty[i], tx[j], ty[j]);
  
}
 }
 }
 }
  
}
  
 
void follow
 (int i, float targetX, float targetY, float ratio)
 {
 float dx = targetX - x[i];
 float dy = targetY - y[i];
 angle[i] = atan2(dy, dx);
 x[i] += dx * ratio;
 y[i] += dy * ratio;
 
 if (x[i] < -10) { x[i] = width; }
 if (x[i] > width) { x[i] = -10; }
 if (y[i] < -10) { y[i] = height; }
 if (y[i] > height) { y[i] = -10; }
 
 }
 //based on sketch by martin lau
//http://www.openprocessing.org/sketch/48576
