
int n = 100;
 float[] angle = new float[n];
 float[] x = new float[n];
 float[] y = new float[n];
 float[] tx = new float[n];
 float[] ty = new float[n];
 
void setup()
 {
 smooth();
 size(700, 400);

 for (int i=0; i<n; i++)
 {
 angle[i] = random(PI*2);
 x[i] = random(10, width - 10);
 y[i] = random(10, height - 10);
 tx[i] = x[i] + random(0, 4);
 ty[i] = y[i] + random(0, 4);
 }
 }
 

void draw()
 {
 
fill(100, 30);
 rect(0, 0, width, height);
 
for (int i=0; i<n; i++)
 {
 pushMatrix();
 translate(x[i],y[i]);
 rotate(angle[i] - PI/2);
 fill(255,random(210,255),0);

 ellipse(7, 10, random(3,8),random(3,8));
 popMatrix();


 float dx = tx[i] - x[i];
 float dy = ty[i] - y[i];
 float d = dist(tx[i], ty[i], x[i], y[i]);
 
tx[i] = x[i] + (dx / d) * 20 + random(-3, 3);
 ty[i] = y[i] + (dy / d) * 20 + random(-3, 3);
 
follow(i, tx[i], ty[i], 0.04);
 
}
 
for (int i=0; i<n; i++) {
 for (int j=0; j<n; j++) {
 if (i != j) {
 float d = dist(tx[i], ty[i], tx[j], ty[j]);
 if (d <90) 
{
 stroke(255,255,0,90);
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

 if (x[i] < 0) { x[i] = width; }
 if (x[i] > width) { x[i] = 0; }
 if (y[i] < 0) { y[i] = height; }
 if (y[i] > height) { y[i] = 0; }

 }


