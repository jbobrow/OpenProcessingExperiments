
class SimpleBar
{
   int BarLength, BarWidth;    // width and length of Box
  int xpos, ypos;         // x and y position of box top left corner
  float Cpos,Csize;    //position and size of Cursor
  int Transparency;
   String BarText;
  
  SimpleBar (int xp, int yp, int BL, int BW, float StartValue, String BText ){
    xpos = xp;
    ypos = yp;
    BarLength=BL;
    BarWidth=BW;
    Cpos=StartValue*BarLength;
    Csize= 2; //cursor box height
    Transparency=50;
    BarText=BText;
  }

  float updateValue() {
      if(mouseX > xpos && mouseX < xpos+BarLength &&
        mouseY > ypos && mouseY < ypos+BarWidth) {
        Cpos =constrain(mouseX, xpos, xpos + BarLength)-xpos;
        return Cpos/BarLength;
      } 
      else {
        return Cpos/BarLength;
      }
   }



  void display() {
    rectMode(CORNERS);
    colorMode(RGB);
    textAlign(CENTER);
    stroke(100,(Transparency+30)); 
    fill(20,20,100,Transparency);
      rect(xpos, ypos, xpos+BarLength, ypos+BarWidth);// bar
      noStroke();
      fill(20,255, 0,255);
      rect(xpos+Cpos-Csize/3, ypos, xpos+Cpos+Csize/3, ypos+BarWidth);// cursor      
      fill (245,20,20,200);
      text(BarText+nf(Cpos/BarLength,0,2),xpos+BarLength/2,ypos+BarWidth/1.5);
  
  }
}


