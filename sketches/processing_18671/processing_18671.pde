
Bulba bulba1, bulba2;

int fillColor = 255;
int bStroke = 0;
float sStroke = .75;
int mStroke = 1;
float lStroke = 1.75;
int coloR = 255;
int coloG = 255;
int coloB = 255;


void setup() {
  size(400,400);
  smooth();
  
  //bulba  = new Bulba(0,175,158,1,104,90,1,175,158);
  bulba1  = new Bulba(200,200);
  bulba2  = new Bulba(400,400);
}


void draw() {
  background(237,211,168);
  
  bulba1.display();
  bulba2.display();
  pokeball();
  razor();
  
}

