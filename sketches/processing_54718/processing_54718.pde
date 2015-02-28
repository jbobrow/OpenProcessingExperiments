
PFont font;
String salestring = "FOR SALE";
String soldstring = "SOLD";
float x = 255;
float y = 0;

void setup(){
  size(600,600);
  font = loadFont ("font.vlw");
}

void draw(){  
    //sets background
    background(255,255,255);
    
    //text settings
    textFont(font);
    textSize(103);
    
    //rectangle frame
    fill(0,0,0);
    rect(0,0,600,200);
    rect(0,400,600,200);
  
  //for sale string action
  textAlign(CENTER);
  fill (227,111,83,x);
  text(salestring,300,330);

  //sold string action
  fill (103,196,193,y);
  textAlign(CENTER);
  text(soldstring,300,330);
}
  
    
    
    
void keyPressed(){
  //defines equations
  y = y + 3;
  x = x - 3;
}

