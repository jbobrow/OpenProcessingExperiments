
int count = 20000; //number of pixels
float[] x = new float[count];  //store coordinates
float[] y = new float[count];
PImage img;

void setup() {
  size(300, 300);
  smooth();
  img = loadImage("RedBus.jpg"); //my image load

  for (int w=0; w < count; w++) { //random pixels
    x[w] = random(width);
    y[w] = random(height);
  }
}

void draw() {
  background(100);
  strokeWeight(3); //make the pixels larger

  for (int w = 0; w < count; w++) {
    color c = img.get(int(x[w]), int(y[w])); //pulls the color from image
    float b = brightness(c) / 300.0; 
    stroke(c);       //fills in color [to pull out the red]
    float speed = pow(b, 2) + 0.1; //speed
    y[w] += speed; //vertical pixels

    if (y[w] > height) {      //repeat the pixels                
      x[w] = random(width);                              
      y[w] = 0;
    }


    point(x[w], y[w]);
  }
}


