
//global values
float _barWidth=300.0;    //slider-bar width;
float _sliderPos=100.0;  //initial slider position
float _hueVal=map(_sliderPos,0.0,_barWidth,0.0,255.0);;  //initial hueValue
   
 
void setup(){
  background(255);
  size(400,75);
  colorMode(HSB);
  stroke(0,0,0);
  println(_hueVal);
}
 
void draw(){
  _hueVal= drawSlider(20.0,20.0,_barWidth,30.0,_hueVal);
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
  rect(sWidth+40, yPos, sHeight,sHeight);
  return hueVal;
}

