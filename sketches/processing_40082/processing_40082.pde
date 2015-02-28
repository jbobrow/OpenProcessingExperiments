

int num = 10000;  //number of particles
float[] x = new float[num];  // x coordinate arrays
float[] y = new float[num];  // y coordinate arrays
PImage img;

void setup(){
  size(300,300);
  img = loadImage("Pyramid.jpg");
  
  
  //seed the arrays
  for (int i = 0; i < num; i++){  
    x[i] = random(width);
    y[i] = random(height);
  }
  stroke(185,131,99); //sand color
}

void draw(){
  background(0);
 
//code borrowed from Nick's Lab 6 Code  
  for (int i = 0; i < num; i++){
    color c = img.get(int(x[i]), int(y[i]));  //gets the color from the image
    float b = brightness(c) / 255.0;         
    float speed = pow(b,2) + 0.05;            
    y[i] += speed;                            //makes the particles fall from top to bottom
    
    point(x[i], y[i]);                        //places the points on the screen
  }
}

