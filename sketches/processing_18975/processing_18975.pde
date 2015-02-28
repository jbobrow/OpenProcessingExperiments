
// variables I 


// a variable must be declared before you can use it
// it has a type (int) and a name (zebra)
// optional, you can assign a starting value for it 
int zebra = 40;
int giraffe = 70;
int lion;

//--------------------------------------------------------
void setup() {
  size(400, 100);
  smooth();
  // basic arithmetic using variables  
  lion = zebra + giraffe;
}

//--------------------------------------------------------
void draw() {
  background(128);
  // you can use a variable anywhere you would use a number
  // in your program
  // just pay attention to the type! some functions will ask for
  // specific types (float vs int, for instance) 
  ellipse(100, 50, zebra, zebra);
  ellipse(200, 50, giraffe, giraffe);
  ellipse(300, 50, lion, lion);
}
