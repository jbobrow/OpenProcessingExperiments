

int numCircles;
int stripes;
float dmeter;
float pmeter;
String [] files = {"kiddo.png", "da_vinci.png","mcqueen.png", "girl_with_pearl.png", "courbet.png"};
PImage [] images = new PImage[files.length];

void setup() {
  size(1000, 750);
  noLoop();
 

 for (int i=0;i<files.length;i++) {
      images[i] = loadImage(files[i]);
    }

 
}

void draw() {
  background(0);
  

  for (int i=0;i<int(random(1,100));i++) {
    
        stripes(int(random(3, 7)), 1, 3);

    
int xmin = int( random(-200, width));
int xmax = int( xmin+height* random(.5,0.75));
int ymin = int( random(-100, height));
int ymax = int( ymin+height* random(.5,0.75));

  circles(int( random(25, 100)), xmin, xmax, ymin, ymax);
     drawImage (images[int(random(0,files.length))], random(0, width), random(0, height), random(0.5, 2), random(0, TWO_PI));
      //drawImage (images[i], random(0, width), random(0, height), random(0.5, 2), random(0, TWO_PI));
  }
    
    
}



// every time the mouse is pressed
void mousePressed() {
  redraw();
  // mouse click function to show how this works with different characters
  }


void drawImage(PImage img, float x, float y, float s, float r) {
 println("here");
 imageMode(CENTER);
 pushMatrix();
 translate(x, y);
 scale(s);
 rotate(r);
 image (img, 0, 0);
 popMatrix();
 } 


void circles(int numCircles, int xmin, int xmax, int ymin, int ymax) {
  for (int l = 0; l < numCircles; l++) {
    fill(255, 255, 255, 50);
    smooth();
    noStroke();
    float x = random(xmin, xmax);
    float y = random(ymin, ymax);
    dmeter = random(20, 75);
    ellipse(x, y, dmeter, dmeter);
    
  }
}

void stripes(int stripes, int minWeight, int maxWeight) {
  stroke(139, 50, 17); 
  for (int i = 0; i < stripes; i++) {
  strokeWeight(random(minWeight, maxWeight));
  line(0, random(height), 1000, random(height));
  }
}

 
void keyPressed() {
  //println("pressed");

}


