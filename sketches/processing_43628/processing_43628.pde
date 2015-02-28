
//this code is based off of the code that was given to us for the 7.l homework and it has been adpted from my own work
//I have also use the Ant code as reference.




PImage turtle;//this sketch is based off of two images, with one croped to get a smaller color range
PImage flower;
PImage flowers;

Form[] spot = new Form[5];//these set up the arrays for each of the classes
Form2[] spot2 = new Form2[5];
Form3[] spot3= new Form3[1];


void setup() {// within this setup I have seeded the array and loaded the images to be used
  size(500, 500);
  turtle= loadImage("turtle.jpg");
  flower= loadImage("flowers2.jpg");
  flowers= loadImage("flowers.jpg");
  frameRate(10);//this slows the drawing down so you can see whats happening
  smooth();

  background(25);


  for (int i=0; i<spot.length;i++) {
    spot[i]= new Form(random(50, 450), random(50, 450));//this sets the conditions for the first set of points within the array
  }
  for (int j=0; j<spot2.length;j++) {
    spot2[j]= new Form2(random(50, 450), random(50, 450));//sets conditions for the second set of pionts within the array
  }
  for (int k=0; k<spot3.length;k++) {
    spot3[k]= new Form3(random(50, 450), random(50, 450));//sets conditions for the third set of pionts within the array
  }
}




void draw() {//within the draw area the classes are being drawn using the .move and .display


  for (int i=0; i<spot.length; i++) {
    spot[i].move();
    spot[i].display();
  }

  for (int j=0; j<spot2.length; j++) {
    spot2[j].move();
    spot2[j].display();
  }
  for (int k=0; k<spot3.length; k++) {
    spot3[k].move();
    spot3[k].display();
  }
}






class Form {  //this sets up the first set of points that move across the screen

  float x1;
  float y1;

  Form(float x1_, float y1_) {

    x1= x1_;
    y1= y1_;
  }

  void display() {
    int a=int(random(0, flower.width));
    int b=int(random(0, flower.height));

    color newColor= flower.get(a, b);//this is what gives the color from the image

    noStroke();
    fill(newColor);
    ellipse(x1, y1, 20, 20);
  }

  void move() {//this is the range of movement that is seen
    x1=x1+random(-5, 5);
    y1= y1+ random(-5, 5);
  }
}



class Form2 extends Form {  //this sets up the second points that move across the screen, and its code is based off of the first class

  Form2(float x1, float y1) {
    super(x1, y1);
  }

  void display() {
    int a=int(random(0, turtle.width));
    int b=int(random(0, turtle.height));

    color newColor= turtle.get(a, b);//this brings the color from the image selected
    float g=random (10, 30);//g gives a random diameter for the ellipse

    noStroke();
    fill(newColor);
    ellipse(x1, y1, g, g);
  }
}



class Form3 extends Form {  //this sets up the second points that move across the screen

  Form3(float x1, float y1) {
    super(x1, y1);
  }

  void display() {
    int a=int(random(0, flowers.width));
    int b=int(random(0, flowers.height));

    color newColor= flowers.get(a, b);//this brings the color from the image selected
    float g=random (10, 30);//g gives a random diameter for the ellipse

    noStroke();
    fill(newColor);
    ellipse(x1, y1, g, g);
  }
}


