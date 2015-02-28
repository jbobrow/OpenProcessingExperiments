
//draw me a picture

int num= 100; //sets set number of manipulated variables
PImage Picture;

Pencil[] myPencil = new Pencil [num]; //set up Pencil

void setup() {
  Picture =  loadImage("Mies.jpg"); //image that sets the basis of the pixel pallette to use
  size(300, 300);
  background(0);
  smooth();

  for (int a=0; a<myPencil.length; a++) { //set up array for pencil
    myPencil[a]= new Pencil();
  }
}

void draw() {
  for (int a=0; a < myPencil.length; a++) {
    myPencil[a].update();
    myPencil[a].display();
  }
}

class Pencil {

  int b= int(random(width)); //creating random Pencil points for drawing paths
  int c= int (random(height));

  Pencil() {
  }

  void update() {
    b = b + int(random (-4, 4));
    c = c + int(random (-4, 4));
  }

  void display() { //set up Pencil
    noStroke();
    color Pallette= Picture.get(b, c); //get color pixels from picture to fill the point
    stroke(Pallette);
    point(b, c);
  }
}



