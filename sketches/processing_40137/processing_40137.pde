
int num = 30000;  //Variable number
float[] x = new float[num];  // x coordinate
float[] y = new float[num];  // y coordinates
PImage img;

void setup() {
  size(300, 300);
  smooth();
  stroke(0, 255);     //Default sand Color
  img = loadImage("zebra.jpg"); 


  
  for (int i = 0; i < num; i++) { 
    x[i] = random(width);
    y[i] = random(height);
  }
}

void draw() {
  background(200);

  for (int i = 0; i < num; i++) {
    color c = img.get(int(x[i]), int(y[i]));
    float b = brightness(c) / 255.0;        
    float speed = pow(b, 2) + 0.25; 
    x[i] += speed;
    y[i] += speed;     //Makes rthe coordinates go downward to the right corner

    point(x[i], y[i]);       

    if (mousePressed) { 
      stroke(255);       //Changes the stroke to white, the other color of the zebra
    }
  }
}




