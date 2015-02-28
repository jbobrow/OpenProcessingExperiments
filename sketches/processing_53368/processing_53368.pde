
// objects
PFont font;

PVector textLoc;

int x = 10;
 

 
void setup() {
  size(500, 500);
  smooth();
  font = loadFont("DINPro-Bold-48.vlw");
  textLoc = new PVector(width/2, height/2, 0);
  background(0);
}
 
void draw() {

    //textFont(font, 48);
  //textAlign(CENTER, BASELINE);
 //text("ILLUMINATE", width/2, height/2);
  
if (mousePressed == true) 
    {
      x = x + 1;
        fill(x);
        textFont(font);
        textAlign(CENTER, BASELINE);
        text("ILLUMINATE", width/2, height/2); 
    }
    
   ;
 
  
  
}


