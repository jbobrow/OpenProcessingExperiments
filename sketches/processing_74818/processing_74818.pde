
PFont font;
int xPos = 0;
int yPos = 0;
int directionX = 1;
int directionY = 1;
int d = 270;

String txt = "The quick brown fox jumps over the lazy dog";
void setup(){
  size(400, 400); 
  
  font = loadFont("DIN-Regular-30.vlw");
  textFont(font);

}

void draw(){
  background(200);
  
 
  textSize(30);
  textMode(CENTER);
  fill(0);
  textAlign(CENTER);
  textLeading(30);
  text(txt, xPos, yPos, d, d);
  
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  
if(xPos > width - d){
    directionX = -1;
  
  }
  if(yPos > height - 100){
    directionY = -1;
  }
    
  if(xPos < 0){
    directionX = 1;
  }
  if(yPos < 0){
    directionY = 1;
  }


}

