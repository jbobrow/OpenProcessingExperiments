
//Snow Globe 

//snow variable 
int value = 255;
int snow = 100;
  
float[] snowX = new float[snow];
float[] snowY = new float[snow];

//color of snow  
color[] callColor = new color[snow];

//to make the snow float
float gravity;
 
void setup() {
  size(412, 412);
  smooth();
  noStroke();
   
  colorMode(HSB);
  gravity = .1;
 
  for (int i = 0; i < snowX.length; i ++) { //for (int i = 0; i < numBall; i ++)
 
     snowX[i] = 50;
     snowY[i] = 80;
     
  }
}
 
void draw() {
 
  PImage myImage = loadImage("nycity.jpg");
  imageMode(CENTER);
  image(myImage, width/2, height/2);
  color getColor = myImage.get(mouseX, mouseY);
  noStroke();
   
   //to draw/make the snow
  for(int i =0; i < snowX.length; i++){
    
    snowX[i] += gravity;
    snowY[i] += gravity;
  }
  
  //to drop the snow   
  for(int i = 0; i < snowX.length; i++) {
    fill(value); //(callColor[i]);
    ellipse(snowX[i], snowY[i], 5, 5);
  }
}

// to make the snow fall  
void mouseReleased() {
  for(int i = 0; i < snowX.length; i++) {
     
    snowX[i] = mouseX;
    snowY[i] = mouseY;
     
    snowX[i] = random(width);
    snowY[i] = random(height);
     
   
  }
}
// want to make the snow settle at the bottom but not sure how that's done. 
// I think I need to add some sort gravity and mouseRelease.
// so that when you mouseClick and snow is made then when release it falls to the bottom.
// Ugh!



