
int counter = 0;
  
PImage [] images = new PImage [10];
  
void setup() {
    size (650,433);
    smooth();
  
    images[0] = loadImage ("start.jpg");
    images[1] = loadImage ("1a.jpg");
    images[2] = loadImage ("2a.jpg");
        images[3] = loadImage ("3a.jpg");
            images[4] = loadImage ("4a.jpg");
            images[5] = loadImage ("5a.jpg");
                images[6] = loadImage ("6a.jpg");
                    images[7] = loadImage ("7a.jpg");
                        images[8] = loadImage ("8a.jpg");
                            images[9] = loadImage ("9a.jpg");
      
    }
  
void mousePressed() {
  if(counter < 9) {
    counter++;
  }
  else {
    counter=0;
  }
}
  
void draw() {


  background(255);
  imageMode(CENTER);
  image(images[counter], 325,216);
   
}

