


int num = 15000;  //number of points
float[] x = new float[num];  // array for x coordinates
float[] y = new float[num];  // array for y coordinates
PImage img;

void setup(){
  size(290,290);

  img = loadImage("Bob.jpg");
 
  for (int i = 0; i < num; i++){  
    y[i] = random(height);
    x[i] = random(width);
    
  
}
}

void draw(){
  background(0);
  for (int i = 0; i < num; i++){
    color c = img.get(int(x[i]), int(y[i]));  // this gets the color from the image at points x[i] and y[i]
    float b = brightness(c) / 255.0;          // b equals a fraction of the brightness of "c"
    float speed = pow(b,2) + 0.5;            // speed is equal to b squared plus 0.5
    x[i] += speed;                           //defines movement of points based on the speed
    stroke(c); 
    strokeWeight(.75);
    if (x[i] > height) {                       // if the particles leave the window
      x[i] = 0;                               // starts the points over at the top
                      
    }
      
     point(y[i], x[i]);      
  
}
}


//Based on Lab 6 code ImgSpeed by Nick Senske
    

