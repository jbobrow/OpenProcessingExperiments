
int num = 20000; //ratio of dots fade in the background
//arrays
float[] x = new float[num]; 
float[] y = new float[num]; 
//image option
PImage img;
 
void setup() {
  size(300, 300);
  img = loadImage("PeterZ.jpg");
 
  
  for (int i = 0; i < num; i++) { 
    x[i] = random(height);
    y[i] = random(width);//speed across screen
  }
  stroke(150, 0,0);//blood red
}
 
void draw() {
  background(200);
  for (int i = 0; i < num; i++) {
    color c = img.get(int(x[i]), int(y[i]));
    // color from stroke and picture
    float b = brightness(c) / 100.0; 
    // set brightness with picture brightness
    float speed = pow(b, 2) + .2; 
    // setting speed
    x[i] += speed; // moving fro mnegative to positive space
 
    if (x[i] > height) {                      
      x[i] = random(height);
      y[i] = random(width);
      //repeating the speed and dots
    }
    point(x[i], y[i]);
  }
}


