
/* Redefining "butterfly" pattern with colorful circle
Code is derived from image walkers by Prof Nick Senske
Butterfly image created by me
*/

PImage img;
int num = 69; //number of circles
Circ [] Circs = new Circ [num]; //array to get the new number of circles
color myblack=color(0,0,0);
color mywhite=color(255,255,255);

void setup() {
  size(400, 400);
  img = loadImage("butterfly.jpg");//load the picture processing
  /*background(img); //hide the background*/
  background(myblack);
  img.loadPixels();

  for (int i=0;i<num;i++) {
    float x = random(width);
    float y = random(height);
    if (img.get(int(x), int(y)) == color(myblack)) {//get pixel data from image
    i--;//slower the movement of circles inside blackcolor
    }
    else {
      Circs[i] = new Circ(x, y);
    }
  }
}

void draw() {
  for (int i=0; i<num; i++) {
    Circs[i].walk();
    //Circs[i].trail();
    //draw and move ellipse with stroke
  }
}

class Circ {
  float x;
  float y;
  float xv = random(1);
  float yv = random(1);

  Circ(float x_, float y_) { //set constructor of circle
    x=x_;
    y=y_;
  }

  void walk() {
    x+=xv;
    y+=yv;

    if (x>width) x = 0;
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(mywhite)) {//send comment to black pixel
      /*if (random(2)>1) { //if this random is turned on, it will make stroke inside the black pixel*/     
        yv = yv;
        strokeWeight(3);//make stroke bigger inside the butterfly/ black pixel
        stroke(random(y),random(x),y-x);//walker random color inside black and loop so the butterfly will stay dynamic
        point(x,y);
      }
      else {//send command to white pixel
        xv = -xv;//make move down outside the butterfly/ white pixel
        strokeWeight(1);
        stroke(x,y,0);//walker colour
        point(x,y);
      }
    }
  }
//}


