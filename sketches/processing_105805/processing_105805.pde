
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
