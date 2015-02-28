
int numLines=500;
MovingLine[] lines= new MovingLine[numLines];
int currentLine=0;


void setup(){
  size(500, 500);
  smooth();
  frameRate(30);
  for (int i=0; i< numLines; i++){
    lines[i]=new MovingLine();
  }
}

void draw(){
  float a=0;
  background(255);
  for (int i=0; i< currentLine; i++){
    lines[i].display();
   // println(lines[i].getX());
  }
}
/*
float prendiX(){
  float a;
   for (int i=0; i< currentLine; i++){
    a=lines[i].getX();
    
   }
   a;
}  */


void mouseDragged(){
  lines[currentLine].setPosition(mouseX, mouseY, pmouseX, pmouseY);
  if (currentLine< numLines-1){
    currentLine++;
  }
}
/* to do : quando passo sopra il mouse le linee subiscono una perturbazione random

void mouseOver(){
  //if ((mouseX - lines[i].getX())=0){
 // && (mouseY= lines[currentLine].getY())){
    
    println("ok!");
  }
//}
  */
class MovingLine {
  float x1, y1, x2, y2;

  void setPosition(int x, int y, int px, int py) {
    x1=x;
    y1=y;
    x2=px;
    y2=py;
  }
 /* float getX(){
    return x1;
  }*/
  
 /* void getY(){
    return y1;
  }*/

  void display() {
    x1 +=random(-10, 10);
    y1 +=random(-10, 10);
    x2 +=random(-0.5, 0.5);
    y2 +=random(-5, 5);
    
   /* x1 +=0;
    y1 +=0;
    x2 +=0;
    y2 +=0;*/
    line(x1, y1, x2, y2);
  }
}


