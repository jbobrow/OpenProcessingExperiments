
PImage b;
int num_airplanes = 150;
float easing[] = new float[num_airplanes];
float x_h[] = new float[num_airplanes];
float y_h[] = new float[num_airplanes];
float vx[] = new float[num_airplanes];
float vy[] = new float[num_airplanes];
float ang[] = new float[num_airplanes];

void setup() {  //setup function called initially, only once
  size(800, 600);

  b = loadImage("http://i.imgur.com/ye2tqNM.png");
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  
  for(int i = 0; i < num_airplanes; ++i) {
      x_h[i] = random()*800;
      y_h[i] = random()*600;
      vx[i] = random()*5;
      vy[i] = random()*5;
      easing[i] = random()*0.1;
      ang[i] = random()*360;
  }
}

void draw() {  //draw function loops 
  float dx;
  float dy;
  
  background(0);
 
  for (int i = 0; i < num_airplanes; ++i) {
      dx = mouseX - x_h[i] - vx[i];
      dy = mouseY - y_h[i] - vy[i];

          x_h[i] += dx*easing[i] + vx[i];
          if (x_h[i] > 800 || x_h[i] < 0) {
              vx[i] *= -1;
          } 
          

          y_h[i] += dy*easing[i] + vy[i];
          if (y_h[i] > 600 || y_h[i] < 0) {
              vy[i] *= -1;
          }
          
      pushMatrix();
      translate(x_h[i], y_h[i]);
      rotate(ang[i]);
      image(b, 0, 0);
      popMatrix();
      
      if (abs(x_h[i] - mouseX) < 10) {
          vx[i] = -1*vx[i] + random()*5;
      }
      if (abs(y_h[i] - mouseY) < 10 ) {
              vy[i] = -1*vy[i] + random()*5;
      }
  }
} 
