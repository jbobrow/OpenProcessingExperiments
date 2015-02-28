
Bulba bulba;
Pokeball [] pokeball = new Pokeball[1];

////////////////////////////////////////// global variables
int fillColor = 255;
int bStroke = 0;
float sStroke = .75;
int mStroke = 1;
float lStroke = 1.75;
int coloR = 255;
int coloG = 255;
int coloB = 255;
int leaf = 10;


//////////////////////////////////////////
void setup() {
  size(400,400);
  smooth();
  
  bulba  = new Bulba(300,300);
  for (int j = 0; j < pokeball.length; j++) {
   pokeball[j] = new Pokeball(random(width),random(height));
}
}


//////////////////////////////////////////
void draw() {
  background(205,211,168);
  
  bulba.display();
  for (int j = 0; j < pokeball.length; j++) {
     pokeball[j].show();
  }
}

//////////////////////////////////////////
void mousePressed() {
  if (mouseButton == LEFT) {
    Pokeball b = new Pokeball (mouseX,mouseY);
    pokeball = (Pokeball[]) append(pokeball,b);
 } else if (mouseButton == RIGHT) {
    noStroke();
    fill(random(0),random(25,255),random(45,100));

    ellipse(random(mouseX),random(mouseY),leaf,leaf);
    ellipse(random(mouseX+75),random(mouseY+75),leaf+7,leaf);
    ellipse(random(mouseX+100),random(mouseY+100),leaf,leaf+7);
    ellipse(random(mouseX+100),random(mouseY+100),leaf+5,leaf);
   
  }
    
  }



