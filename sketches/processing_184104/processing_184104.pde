
 int rectState=1;
  boolean _btnActive=false;
  boolean _btnHover=false;
  
  void setup(){
    size(250,130);
  }

  void draw(){
      background(255);
      switch(rectState){
        case 0: 
           fill(0,0,255);  //bright blue when button is active
           break;
        case 1: 
          fill(150, 150,250);  //light blue when button is off
          break;
      default:
        fill(100);  // if neither state, have a gray rectangle
        break;
    }
    stroke(20);
    rect(10,10,100,100);  // draw rectangle which will be controlled by button
    drawButton(150,40,50,50);
  }
   

void drawButton(float xPos, float yPos, float bWidth, float bHeight){
      fill(100);
      stroke(20);
      strokeWeight(3);
      rect(xPos,yPos,bWidth,bHeight);
      fill(255,0,0);
      
      _btnHover=isMouseOver(xPos,yPos,bWidth,bHeight);
      if(_btnHover){
        stroke(255);  //white outline
        if(mousePressed){
          fill(160,180,0); //dull green
        }
       }
       if(_btnActive){
          fill(100,200,0);  //green
          stroke(255);
       }
      ellipse(xPos+25,yPos+25,bWidth-5,bHeight-5);
 }
       
boolean isMouseOver(float xPos, float yPos, float bWidth, float bHeight){
       if(mouseX> xPos && mouseX < xPos + bWidth && mouseY > yPos && mouseY < yPos+bHeight){
        return true;
    }
    return false;
}

void mouseClicked(){
  if(_btnHover){  //only change btnState if the user is over the button when clicking
      if(_btnActive){
          _btnActive=false;
          rectState=1;
      }
      else {
          _btnActive=true;
          rectState=0;
      }
  }
}

