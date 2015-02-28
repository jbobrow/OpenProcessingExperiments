
Barcode myBarcode;
Barcode myBarcode2;
Barcode myBarcode3;


void setup () {
  
  // xpos, ypos, xpos end, ypos end, line end, restart, color  rgb
  // restart = xpos!!!!!
  myBarcode = new Barcode(100,200,100,120,200,100,255,0,0);
   myBarcode2 = new Barcode(400,200,400,120,500,400,0,255,0);
   
     myBarcode3 = new Barcode(70,400,450,500,530,70,0,0,255);
    
    
   
  size (600, 600);
  background (255);
  stroke (255);

}

void draw () {
  
  myBarcode.changelinecolor();
  myBarcode.display();
  
    myBarcode2.changelinecolor();
  myBarcode2.display();
  
    myBarcode3.changelinecolor();
  myBarcode3.display();
  
  

  
     
    
  }


class Barcode {

//Lines get Coordinates and Sizes
  
 int xpos;
 int xposend;
 int ypos;
 int yposend;
 int lineend;
 int restart;

// ColorCODE

int r;
int g;
int b;

Barcode (int xpos_, int ypos_, int xposend_, int yposend_, int lineend_, int restart_, int r_, int g_, int b_) {
xpos = xpos_;
ypos = ypos_;
xposend = xposend_;
yposend = yposend_;
lineend= lineend_;
restart = restart_;
r = r_;
g = g_;
b = b_;


}


void display () {
  
  line(xpos, ypos, xpos, yposend);
  if (random(100) > 75) {
    changelinecolor();
  }
  xpos = xpos + 1;
 

    if (xpos > lineend) { 
      xpos = restart;
    }
}


  
  void changelinecolor() {
    
  stroke (175);
  line(xpos, ypos, xpos, yposend);
  
  if (random(100) > 50) {
    stroke (r,g,b);
  } 
  else {
    stroke(255);
  }
}

}



