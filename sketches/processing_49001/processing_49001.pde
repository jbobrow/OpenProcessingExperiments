
import java.util.ArrayList;

int APP_WIDTH;
int APP_HEIGHT;
ArrayList<CRect> cRects;

void setup(){
  APP_WIDTH = 600;
  APP_HEIGHT = 600;
  size(600, 600);
  smooth();  
  noLoop();
  generateCRectArrayList();
}


void generateCRectArrayList(){
  cRects = new ArrayList<CRect>();
  for (int i = 0; i < APP_WIDTH; i+=20){
    for (int j = 0; j < APP_HEIGHT; j+=20){
      cRects.add(new CRect(new PVector(i,j)));
    }
  }
}


void draw(){
  background(220);
  for (CRect cR : cRects){
    cR.display();
  }
}


// second tab


class CRect{
  PVector pos;
  color CRectColor;  
    
  CRect(PVector pos){
    this.pos = pos; 
    color col1 = color(255, 34, 140);
    color col2 = color(23, 34 , 170);
    float amt = random(1);
    CRectColor = lerpColor(col1, col2, amt);
  }
        
  void display(){
    fill(CRectColor);
    noStroke();
    rect(pos.x, pos.y, 20.0, 20.0);
  }
}

