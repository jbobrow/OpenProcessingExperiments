
//Bryan Williams
//October 2, 2011
//Computational Methods
//Homework 6.2

int num = 200000; //number of 
float [] x = new float[num]; //x array
float [] y = new float[num]; //y array
PImage img; 

//I wanted to create a composition that looked as if someone had just brushed away
//earth and uncovered a fossil of a prehistoric fish.
void setup() {
  size (600,441);
  smooth();
  
  img = loadImage("FISH.jpg"); //embeds the image of a fish fossil
  
  for (int i = 0; i < num; i++) { //this seeds the arrays created above
    x[i] = (600);
    y[i] = (441);
  }
  stroke(255);  // white pixals which act as the debris being swept away
}

void draw() {
  background(12, 43, 67); //background color is a dark blue
  for(int i = 0; i < num; i++) {
    color c = img.get(int(x[i]), int(y[i])); //color from the picture controls the arrays
    float b = brightness (c) / 200.0; 
    float speed = pow(random(b),CENTER) + .000005; //This controls the speed of the pixals in the composition
    x[i] += speed*10;
    
    if (x[i] > 600) {  //This circulates the pixals so that the image is constantly being redrawn
      x[i] = random(600);
      y[i] = random(441);
    } 
    point(x[i], y[i]);
  }
}

