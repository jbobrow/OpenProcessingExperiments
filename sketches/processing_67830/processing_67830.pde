
// ANTS TRAIL
//-----------GLOBAL VARIABLES
//call the class

Walker w;
Walker1a w1a;
Walker2 w2;
Walker2a w2a;
Walker3 w3;
Walker3a w3a;

void setup(){
  size(1000,1000);
  background(0);
  
//-----------INITIALIZE
//Question_ problem in adding array to the initialize
//another options, provide classes.


w= new Walker();
w1a= new Walker1a();
w2= new Walker2();
w2a= new Walker2a();
w3= new Walker3();
w3a= new Walker3a();




}

//------------FUNCTIONS


void draw(){
  

  w.step();
  w.display();
  w1a.step();
  w1a.display();
  
  w2.step();
  w2.display();
  w2a.step();
  w2a.display();
  
  w3.step();
  w3.display();
  w3a.step();
  w3a.display();
  
  
}








