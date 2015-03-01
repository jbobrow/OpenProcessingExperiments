
//global values
float _barWidth=300.0;    //slider-bar width;
float _sliderPos=150.0;  //initial slider position
float _hueVal=map(_sliderPos,0.0,_barWidth,0.0,255.0);;  //initial hueValue
//float _satVal=map(_sliderPos,0.0,_barWidth,0.0,255.0);;  //initial brightValue
//float _brightVal=map(_sliderPos,0.0,_barWidth,0.0,255.0);;  //initial satValue
 int rectState=1;
  boolean _btnActive=false;
  boolean _btnHover=false;
    
  
void setup(){
  background(100);
  size(600,650);
  colorMode(HSB);
  stroke(0,0,0);
  println(_hueVal);
}
  
void draw(){
  _hueVal= drawSlider(20.0,500.0,_barWidth,30.0,_hueVal); //where the bar is located
}
  
float drawSlider(float xPos, float yPos, float sWidth, float sHeight,float hueVal){
  fill(255);
  noStroke();
  rect(xPos-5,yPos-10,sWidth+10,sHeight+20);  //draw white background behind slider
    
  float sliderPos=map(hueVal,0.0,255.0,0.0,sWidth); //find the current sliderPosition from hueVal
    
  for(int i=0;i<sWidth;i++){  //draw 1 line for each hueValue from 0-255
      hueVal=map(i,0.0,sWidth,0.0,255.0);  //get hueVal for each position in the bar
      stroke(hueVal,255,255);
      line(xPos+i,yPos,xPos+i,yPos+sHeight);
  }
  if(mousePressed && mouseX>xPos && mouseX<(xPos+sWidth) && mouseY>yPos && mouseY <yPos+sHeight){
     sliderPos=mouseX-xPos;
  }
  stroke(100);
  hueVal=map(sliderPos,0.0,sWidth,0.0,255.0);
  fill(hueVal,255,255);
  rect(sliderPos+xPos-3,yPos-5,6,sHeight+10);
  rect(sWidth+200, yPos, sHeight,sHeight); //where the small square is located
  return hueVal;
}
// _satVal= drawSlider(20.0,550.0,_barWidth,30.0,_satVal); //where the bar is located
//}
  
//float drawSlider(float xPos, float yPos, float sWidth, float sHeight,float satVal){
  //fill(255);
  //noStroke();
  //rect(xPos-5,yPos-10,sWidth+10,sHeight+20);  //draw white background behind slider
    
  //float sliderPos=map(satVal,0.0,255.0,0.0,sWidth); //find the current sliderPosition from hueVal
    
  //for(int h=0;h<sWidth;h++){  //draw 1 line for each hueValue from 0-255
     // hueVal=map(h,0.0,sWidth,0.0,255.0);  //get hueVal for each position in the bar
      //stroke(255,satVal,255);
      //line(xPos+h,yPos,xPos+h,yPos+sHeight);
 // }
  //if(mousePressed && mouseX>xPos && mouseX<(xPos+sWidth) && mouseY>yPos && mouseY <yPos+sHeight){
    // sliderPos=mouseX-xPos;
  //}
  //stroke(100);
  //satVal=map(sliderPos,0.0,sWidth,0.0,255.0);
  //fill(255,satVal,255);
  //rect(sliderPos+xPos-3,yPos-5,6,sHeight+10);
  //rect(sWidth+200, yPos, sHeight,sHeight); //where the small square is located
  //return satVal;
//}


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

