
Blueberry grey;
Blueberry black;

void setup(){
  grey= new Blueberry(150,50,150);
  black = new Blueberry(40,60,90);
}
void draw(){
  background(0);
  grey.move();
  grey.display();
  black.move();
  black.display();
}


    
  

