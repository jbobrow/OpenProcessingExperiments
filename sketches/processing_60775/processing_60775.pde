
int num = 200500; //number of dots
//make arrays
float[] x = new float[num]; 
float[] y = new float[num]; 
//add image
PImage img;
PImage b;

 
void setup() {
  size(640, 960);
  img = loadImage("movies_018_iron-man-2_robert-downey-jr_crop-iphone_web.jpeg");

  //seed of dots
  for (int i = 0; i < num; i++) { 
    x[i] = random(width);
    y[i] = random(height);
  }
  stroke(250,250,250);
}
 
void draw() {
   b = loadImage("tumblr_m3ofs9WNid1qbebtno1_500.jpeg");
  background(b);
  for (int i = 0; i < num; i++) {
    color c = img.get(int(x[i]), int(y[i])); // get the color from the picture
    float b = brightness(c) / 100.0; // finding the brightness of each color
    float speed = pow(b, 2) + .2; // setting the speed of the dots
    x[i] += speed; // moving the paticles
 
    if (x[i] > width) {                      
      x[i] = random(width); // restarting the dots
      y[i] = random(height);
    }
    point(x[i], y[i]);
  }
}


