
/*

Random and Perlin Noise
May 2009

*/
float rot = 0;//rot is rotation
float rad = 200;//rad is radius
float speed = 0.01;//the speed of the lines moving
float circleSize = 9;//size of the ellipse at the end of the line

float seed = 0;
float seed2 = 0;


void setup() {
  size(500,500);
  background(0);
  smooth();
  
 
  
};

void draw()  {
  
 
  rad = noise(seed) * 200;
  seed = seed + 0.006;
  
  circleSize = noise(seed2) * 18;
  seed2 = seed2 + 0.06;
  
  translate(250,250);//have to have translate in the draw when we want it to go over and over again
  rotate(rot);
  stroke(255,255,255,25);
  line(0,0,rad,0);
  fill(255,255,255,50);
  ellipse(rad,0,circleSize,circleSize);
  
  rot = rot + speed;
};

void keyPressed() {
  save("circle" + key + ".png");//press any key and it will save it in your folder
  
};

