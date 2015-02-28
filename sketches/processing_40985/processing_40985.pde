
//Irina Shumskaya

int num = 1000;                                 // number of paint strokes
PImage cosmos;

Paint [] paintbrush = new Paint [num];         //use an image as data generator

void setup() {
  cosmos = loadImage ("cosmos.jpg");
  size (400, 400);
  background (5,5,40);
  smooth();
  frameRate(10000);

                                                  //seed the array
  for (int a = 0; a<paintbrush.length; a++) {
    paintbrush[a] = new Paint();
  }
}

void draw () {                   
  for (int a = 0; a < paintbrush.length; a++) {
    paintbrush [a] . update();
    paintbrush [a] .display();
  }
}

class Paint {
  int x = int (random(width));                      //paint the strokes at random start point 
  int y = int (random(height));

  Paint () {
  }

  void update() {
    x = x+int (random (-5, 5));                    //paint the stokes with set parameters
    y = y+int (random (-1, 1));
   rotate (360);                                   //rotate the painting gesture 350 degrees from (0,0)
  }

  void display() {
    color Pallette = cosmos.get (x, y);           //use the color strips from an image provided
    stroke (Pallette);
    point (x,y);
  }

  
}



