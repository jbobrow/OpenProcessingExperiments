
class Shapes { //define class
 int ypos;
 int xpos; 
 int ArraySize;
 color C1;
 color C2;
 color C3;
 int sizeX;
 int sizeY;


  Shapes(color tempColor1, int tempColor2) {
//int TempX, int TempY,
    //println("shapes made");  
    C1 = tempColor1;
    C2 = tempColor2;
//    X = TempX;
//    Y = TempY;

    sizeX = width;
    sizeY = height;
  }


void DrawShape1() {
     
    noStroke();
    fill(C1);
    rect(0,0,100,100);
    fill(C2);
    beginShape();
    vertex(50,0);
    bezierVertex(50,25,25,50,0,50);
    bezierVertex(0,50,0,100,0,100);
    bezierVertex(0,100,0,50,0,100);
    bezierVertex(0,100,50,100,50,100);
    bezierVertex(50,75,75,50,100,50);
    bezierVertex(100,0,100,50,100,0);
    bezierVertex(100,0,50,0,50,0);
    endShape();
 }
  //I pass values directly into the Translate method
  void Translate(int X, int Y) {
  pushMatrix();
  translate(X,Y);
  scale(.5);  
    DrawShape1();//DrawShape is called and drawn according to the translate function
  popMatrix();  
  }
  //I pass values directly into the Rotate method
  void Rotate(int X, int Y) {
  pushMatrix();
  translate(X + 50,Y);
  scale(.5); 
  rotate(radians(90)); 
    DrawShape1();
   rotate(radians(0));
  popMatrix();  
  }
  
  void changeColor() {
   C3 = C1;
   C1 = C2;
   C2 = C3;
   }
   
  void mouseOver() {
    if(mouseX > 0 && mouseX < width){
      //mousePressed();
      changeColor();
      }
    }

      
}
  

  
  
  


