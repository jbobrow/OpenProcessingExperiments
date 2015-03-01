
int last = 0;
float barWidth = 50;
float barRatio = 1;
float footLength = 100;
float feetX = 0;
GSlider barWidthSlider;
GSlider speedSlider;
GSlider footSizeSlider;
GSlider footHeightSlider;
color foot1col;
color foot2col;
GSlider footColSlider1;
GSlider footColSlider2;
GSlider barRatioSlider;
GSlider barContrastSlider;
float foot1Y = 310;
float foot2Y = 390;

void setup(){
  size(750,850);
  barWidthSlider = new GSlider("Bar Width",10,775,150,10,1,100,15,color(63,125,176),true,true,"pixels");
  footSizeSlider = new GSlider("Foot Length",10,825,150,10,1,12,4,color(63,125,176),true,true,"bars");
  speedSlider = new GSlider("Velocity",198,775,150,10,0,500,55,color(125,63,176),true,true,"pixels per second");
  footHeightSlider = new GSlider("Foot Thickness",198,825,150,10,2,200,30,color(125,63,176),true,true,"pixels");
  footColSlider1 = new GSlider("Top Foot Color",392,775,150,10,0,1,0,color(150,150,55),false,false,"");
  footColSlider2 = new GSlider("Bottom Foot Color",392,825,150,10,0,1,1,color(150,150,55),false,false,"");
  barRatioSlider = new GSlider("Bar Ratio",590,775,150,10,0,2,1,color(80,180,130),true,false,"");
  barContrastSlider = new GSlider("Bar Contrast",590,825,150,10,0,1,1,color(80,180,130),true,false,"");
}

void draw(){
  makeStripes();
  drawFeet();
  fill(128);
  noStroke();
  rect(-5,750,760,110);
  barWidthSlider.refresh();
  speedSlider.refresh();
  footHeightSlider.refresh();
  footSizeSlider.refresh();
  footColSlider1.refresh();
  footColSlider2.refresh();
  barRatioSlider.refresh();
  barContrastSlider.refresh();
  fill(color(255,0,0));
  ellipse(375,100,6,6);
}

void makeStripes(){
  barWidth = barWidthSlider.getVal();
  barRatio = barRatioSlider.getVal();
  float barContrast = barContrastSlider.getVal();
  background(127+barContrast*128.);
  noStroke();
  fill(128-barContrast*128.);
  for(int i=0;i<760/(2*barWidth);i=i+1){
    rect(i*2*barWidth-(barWidth*barRatio/2),0,barWidth*barRatio,1000);
  }
}

void drawFeet(){
  footLength = footSizeSlider.getVal()*barWidth;
  float colInd1 = footColSlider1.getVal();
  float colInd2 = footColSlider2.getVal();
  float footThick = footHeightSlider.getVal();
  foot1col = color(colInd1*255,colInd1*255,80);
  foot2col = color(colInd2*255,colInd2*255,80);
  feetX = feetX + (millis()-last)/1000.*speedSlider.getVal();
  last = millis();
  if(feetX>750){
    feetX = 0;
  }
  noStroke();
  fill(foot1col);
  rect(feetX,foot1Y-footThick,footLength,footThick);
  rect(feetX-750,foot1Y-footThick,footLength,footThick);
  fill(foot2col);
  rect(feetX,foot2Y,footLength,footThick);
  rect(feetX-750,foot2Y,footLength,footThick);
  fill(color(255,0,0));
  ellipse(feetX+footLength/2,650,6,6);
  ellipse(feetX+footLength/2-750,650,6,6);
}



class GSwitch {
  int size;  //size of switch
  float xpos, ypos;     //location of switch
  boolean flipped;
  boolean whoathere;
  color col;
  String label;
  
  GSwitch (float xp, float yp, int sz, color c, String lab,Boolean startsOn){
    size = sz;
    xpos = xp;
    ypos = yp;
    col = c;
    label = lab;
    flipped = startsOn;
  }
  
  void refresh(){
    this.update();
    this.display();
  }
  
  void update(){
    if(overEvent()){
      if(mousePressed){
        if(!whoathere){
          flipped = !flipped;
        }
        whoathere = true;
      }else{
        whoathere = false;
      }
    }
  }
  
  boolean overEvent(){
    if(mouseX>xpos && mouseX<xpos+size && mouseY>ypos && mouseY<ypos+size){
      return true;
    }else{
      return false;
    }
  }
  
  boolean isOn(){
    return flipped;
  }
  
  void display(){
    noStroke();
    color plate = col;
    float dy;
    if(overEvent()){
      plate = blendColor(col,color(50),DODGE);
    }
    if(flipped){
      dy = -size/4.;
    }else{
      dy = size/.8;
    }
    fill(plate);
    rect(xpos,ypos,size,size);
    strokeWeight(size/5);
    stroke(blendColor(col,color(80),BURN));//darker stick
    line(xpos+size/2.2,ypos+size/2.,xpos+size/1.3,ypos+dy);
    noStroke();
    fill(blendColor(col,color(50),DODGE));//lighter knob
    ellipse(xpos+size/1.3,ypos+dy,size/2,size/2);
    fill(plate);//cover the bottom of the stick
    rect(xpos,ypos,size/2.1,size);
    fill(blendColor(col,color(30),BURN));    
    textSize(12);
    textAlign(LEFT, BOTTOM);
    text(label,xpos+1.3*size,ypos+size);
  }
}
  
class GSlider {
  int swidth, sheight;  //width and height of slider
  float xpos, ypos;     //slider position
  float spos, newspos;  //indicator position
  float smin, smax;     //min and max positions of indicator
  float vmin, vmax;     //min and max values of the slider
  int loose;            //control tightness
  boolean over;         //mouse hovering
  boolean locked;
  color col;
  float ratio;
  int vanityEdge;       //extra width so that indicator won't go off of slider
  String label;
  Boolean showVal;
  Boolean floored;
  Boolean isActive;
  String units;
  
  GSlider (String l, float xp, float yp, int sw, int sh, float theMin, float theMax, float initPos, color c,boolean showv,boolean floord,String unts){
    label = l;
    swidth = sw;
    sheight = sh;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + ((initPos-theMin)/(theMax-theMin))*swidth;
    smin = xpos;
    smax = xpos+swidth;
    spos = max(min(spos,smax),smin);
    vmin = theMin;
    vmax = theMax;
    col = c;
    vanityEdge = 5;
    showVal = showv;
    floored = floord;
    isActive = true;
    units = unts;
  }
  
  void refresh(){
    this.update();
    this.display();
  }
  
  void update(){
    if(isActive){
      if(overEvent()){
        over = true;
      }else{
        over = false;
      }
      if(mousePressed && over){
        locked = true;
      }
      if(!mousePressed){
        locked = false;
      }
      if(locked){
        spos = min(max(mouseX,smin),smax);
      }
    }
  }
  
  void setVal(float val){
    spos = smin + ((val-vmin)/(vmax-vmin))*swidth;
  }
  
  void setActive(boolean active){
    isActive = active;
  }
  
  boolean overEvent(){
    if(mouseX>xpos && mouseX<xpos+swidth && mouseY>ypos && mouseY<ypos+sheight){
      return true;
    }else{
      return false;
    }
  }
  
  void display(){
    color colour;
    if(isActive){
      colour = col;
    }else{
      colour = color(0);
    }
    fill(blendColor(colour,color(80),BURN));
    textSize(12);
    textAlign(CENTER, BOTTOM);
    text(label,xpos+swidth/2,ypos-1);
    textSize(11);
    fill(50);
    if(showVal){
      if(floored){
        text(int(this.getVal())+" "+units,xpos+swidth/2,ypos+sheight*2.5);
      }else{
        text(this.getVal()+" "+units,xpos+swidth/2,ypos+sheight*2.5);
      }
    }
    noStroke();
    fill(colour);
    rect(xpos-vanityEdge,ypos,swidth+2*vanityEdge,sheight);
    if(over || locked){
      fill(blendColor(colour,color(90),DODGE));
    }else{
      fill(blendColor(colour,color(50),DODGE));
    }
    rect(spos-sheight/2,ypos-1,sheight,sheight+2);
  }
  
  float getVal(){
    if(isActive){
      if(floored){
        return floor(vmin+((spos-xpos)/swidth)*(vmax-vmin));
      }else{
        return vmin+((spos-xpos)/swidth)*(vmax-vmin);
      }
    }else{
      return 0;
    }
  }
}


