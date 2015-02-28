
PImage img;
int num = 30; //number of Cubes in composition
Cube [] Cubes = new Cube[num]; //array gets the new number of Cubes
color myblack=color(0,0,0);
color mywhite=color(255,255,255);

void setup() {
  size(500, 308);
  img = loadImage("Landscape.jpg"); //Stricktly B&W image to easier and more cleanly facilitate the coloring of the image. 
  background(myblack);
  img.loadPixels();

  for (int i=0;i<num;i++) {
    float x = random(width);
    float y = random(height);
    if (img.get(int(x), int(y)) == color(myblack)) { //gets black pixel data from the image
      i--; //Slows down the rectangles when they hit white
    }
    else {
      Cubes[i] = new Cube(x, y); //When the cubes hit black space they bounce around within it, when in white space they move horizontally
    }
  }
}

void draw() {
  for (int i=0; i<num; i++) {
    Cubes[i].walk();
    
  }
}

class Cube {
  float x;
  float y;
  
  float xv = random(15);//Speads up the cubes in the objects
  float yv = random(5); //Slows down the cubes in the void space

  Cube(float x_, float y_) { //Sets up how the cubes are constructed
    x=x_;
    y=y_;
  }

  void walk() { //determines the way that the cubes move across the screen
    x+=yv;
    y+=xv;
    //sets the limits for the cubes. Start over after they go off the screen
    if (x>width) x = 0;
    if (x<0) x = width; 
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(mywhite)) { //Gets the White Pixels from the image   
        yv = yv;
        strokeWeight(.5); //Stroke weight for the cubes within the image, the black portion
        stroke(44,44,44); //Sets the grey stroke color
        noFill();
        rect(x,y,.5,.5); //Creates randomly placed rectangles with a size of.5 X .5
      }
      else {
        xv = -xv;
        strokeWeight(1); //Stroke weight for the cubes within the image, the white portion
        stroke(255,231,8); //Sets the yellow stroke color
        noFill();
        rect(x,y,.5,.5); //Creates randomly placed rectangles with a size of.5 X .5
      }
    }
  }
//Studied code image walkers by Prof Nick Senske, as well as Project 2 butterfly by Alexander Suryandono, Dian Luo and Yashika Gulati.
      //I liked the way that the walkers code behaved and wanted it to do the same thing to a picture that I chose.
          //I saw the butterfly code and wanted mine to be similar to it. The format is still similar at some parts, but the operations and outcome is completely different
          //I wanted squares to represent teh pixels rather than points, and I wanted them moving in the horizontal direction
          //I woudl have liked for the squares to be more trail-like but I kept having problems with the code when I tried to accomplish this. 

