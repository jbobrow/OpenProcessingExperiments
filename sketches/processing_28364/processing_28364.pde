
class button
{
  //  fN16 = loadFont("ArialNarrow-16.vlw");

  int xpos,ypos; //upper left corner of the button
  String name;
  boolean pressed = false;//boolean to make sure a press of the button only responds once when clicked

  int nameWidth;  
  int bWidth = 100; //button width
  int bHeight = 20;
  int backGroundColor; //shade of grey for background


  button(String iName, int iX, int iY)
  {
    textFont(fN16);
    name = iName;
    nameWidth = int(textWidth(iName));
    xpos = iX;
    ypos = iY;
  }


  boolean over() 
  {
    if(mouseX > xpos && mouseX < xpos+bWidth &&
      mouseY > ypos && mouseY < ypos+bHeight) {
      return true;
    } 
    else {
      return false;
    }
  }


  void display()
  {
    rectMode(CORNER);
    //determin backgroundcolor
    if(over()) {
      backGroundColor = 180;
    } 
    else {
      backGroundColor = 255;
    }

    fill(backGroundColor);
    stroke(0);
    strokeWeight(1);
    rect(xpos,ypos,bWidth,bHeight);

    textFont(fN16);
    fill(0);
    text(name, xpos+(bWidth/2)-(nameWidth/2), ypos+bHeight/2+6);
  }
}


