
//Project Two
//Danielle Scesney

//created from proxDemo code.

PImage img;
int num = 500; //number of Points. higher the number, the clearer the image will be.
Thing things [] = new Thing[num];

void setup() {
  size(500,500);
  background(20);
  smooth();
  frameRate(2); 
  
  img = loadImage("DSC_0011.JPG"); //load image
  img.loadPixels();
  
  for(int i = 0; i<num; i++) {
   things[i] = new Thing(random(width), random(height)); //start circles at a random x and y coordinate.
   if (random(2) > 1) {
     things[i].flip = true;
   }
  }
  noStroke();
}

void draw() {
  
  
  for (int i=0; i<num; i++) {
    things[i].check(things,i);
    
    things[i].display();
    things[i].move();

  }
}


class Thing {
  float x;
  float y;
  boolean flip;
  float r = 5;
  
  Thing(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void move() {
    //controls how the objects move. A random point is selected and added to the current x and y position.
    y+=random(-1,1);
    x+=random(-15,15);
  }
  
  void check(Thing[] a, int num) {
    
    //check to see if a circle is close to another circle. 
    //If the circle is the radius + a number away the boolean is true.
    
    for (int i=0; i<a.length; i++) {
      if (i !=num){
        if (dist(x,y, a[i].x, a[i].y) < r+5 ) {
          flip = true;
          break;
        }
        else {
          flip = false;
        }
      }
    }
  }
  
  void display() {
    
    //draw circles that are white when the boolean flip is false and image color based when the boolean is true.
    
    if (flip == true) {
      //gets color data from image.
      fill(img.get(int(x),int(y)));
    }
    else{
      fill(20);
    }
    ellipse(x,y,r,r);
  }
}
    
 

