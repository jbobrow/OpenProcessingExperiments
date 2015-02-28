
Pen bob = new Pen ();
Pen brody = new Pen ();
void setup() {
size(350,600);
brody.y = 240;
brody.x = 100;
}


void draw () {
//draw the pen
bob.display();
brody.display();
}

class Pen {
  //attributes, a template for an object
  float inkAmount;
  int x;
  int y;
  int w;
  int h; 
  boolean isClicked; // boolean is true or false cannot be anything else


  //constructor statement has the same name parenthesis and brackets; defines attributes
  Pen(){
    x= 20;
    y= 140;
    w = 100;
    h = 10;
    inkAmount=300;
    isClicked=false;
  } 
  //methods (functions)
  void display() {
    fill(0);
    rect (x,y,w,h);
  }
  
  void drawStuff(){}
  
}
