
//Variables: primitives, only store data.
//Objects: complex data types,
//they store different information: data + functionality

//declare the object - It is a variable too!
Flower myFlower;

void setup(){
size (400,400);
noStroke();

//initialize the object - create a new one from our cookie cutter...
//by using the operator 'new', not by default value 
myFlower = new Flower();
}

void draw(){
  background(220);
  translate(width/3, height/2);
  //use it - call methods, you have access by using . (point)
  myFlower.petal(mouseX/2, mouseX/2);
}
//DATA - Variables, now hidden here in teh class...
//CONSTRUCTOR - Initialization, like the setup... 
//FUNCTIONALITY - like the draw...

//CLASS NAME //////////////////////////////////////
class Flower {

  //DATA //////////////////////////////////////
  color petalCol_a;
  color petalCol_b;
  int petalWidth;

  color centerCol_a;
  int centerWidth_a;

  int vel;

  //CONSTRUCTOR //////////////////////////////////////
  Flower() {
    petalCol_a = color(200, 0, 0);
    petalCol_b = color(0, 200, 0);
    petalWidth = 100;

    centerCol_a = color(0, 0, 200);
    centerWidth_a = 30;
  }


  //FUNCTIONALITY //////////////////////////////////////
  // functions, called methods...
  void petal(int _col, int _rot) {
    //Petals rect angle
    pushMatrix();
    rotate(radians(45 + _rot));
    fill(petalCol_a + _col);
    ellipse(0, 0, 20, petalWidth);
    ellipse(0, 0, petalWidth, 20);
    popMatrix();

    //Petals rect angle
    fill(petalCol_b);
    ellipse(0, 0, 20, petalWidth);
    ellipse(0, 0, petalWidth, 20);

    //center of the flower 
    fill(centerCol_a);
    ellipse(0, 0, centerWidth_a, centerWidth_a);
  }

  //CLOSING CLASS //////////////////////////////////////
}


