
int lastT;
int phase = 1;
float heigh = 750;
float widt = 750;
float circC;
GSlider periodSlider;
GSlider nCircSlider;
GSlider blurSlider;
GSlider sizeSlider;
GSlider distSlider;
GSlider relSSlider;
GSlider graySlider;
GSlider gray2Slider;

void setup(){
  size(750,900);
  lastT = millis();
  circC = 128;
  color col1 = color(115,125,189);
  sizeSlider = new GSlider("Circle Size",30,800,150,10,0,500,130,col1,false,false,"");
  distSlider = new GSlider("Eccentricity",30,850,150,10,0,500,150,col1,false,false,"");
  
  color col2 = color(189,179,115);
  periodSlider = new GSlider("Frequency",210,800,150,10,0,10,3,col2,true,false,"Hertz");
  nCircSlider = new GSlider("Number of Circles",210,850,150,10,0,20,6,col2,true,true,"");
    
  color col3 = color(115,189,181);
  graySlider = new GSlider("Circle Value 1",390,800,150,10,0,255,70,col3,true,true,"");
  gray2Slider = new GSlider("Circle Value 2",390,850,150,10,0,255,70,col3,true,true,"");
  
  color col4 = color(181,115,176);
  relSSlider = new GSlider("Relative Circle Size",570,800,150,10,-.5,.5,-.05,col4,true,false,"");
  blurSlider = new GSlider("Circle 2 Blur",570,850,150,10,.05,.9,.2,col4,false,false,"");
}

void draw(){
  if(millis()-lastT > 1000/periodSlider.getVal()){
    phase = -phase;
    lastT = millis();
  }
  background(#FFFFFF);
  stroke(180);
  strokeWeight(1);
  line(heigh/2-5,widt/2,heigh/2+5,widt/2);
  line(heigh/2,widt/2-5,heigh/2,widt/2+5);
  drawCircles(int(nCircSlider.getVal()));
  fill(128);
  stroke(80);
  strokeWeight(3);
  rect(-10,750,770,160);
  periodSlider.refresh();
  nCircSlider.refresh();
  blurSlider.refresh();
  sizeSlider.refresh();
  distSlider.refresh();
  relSSlider.refresh();
  graySlider.refresh();
  gray2Slider.refresh();
  circC = graySlider.getVal();
}

void drawCircles(int nCircs){
  float angle = (2*PI)/nCircs;
  for(int i=0;i<nCircs;i++){
    float xPos = cos(i*angle)*distSlider.getVal()+widt/2;
    float yPos = sin(i*angle)*distSlider.getVal()+heigh/2;
    drawCircle(xPos,yPos);
  }
}

void drawCircle(float x, float y){
  if(phase==-1){
    stroke(circC);
    strokeWeight(5);
    fill(255);
    ellipse(x,y,sizeSlider.getVal(),sizeSlider.getVal());
  }else{
    drawGradient(x,y,sizeSlider.getVal()*(1+relSSlider.getVal()));
  }
}
    
void drawGradient(float x, float y, float rad) {
  int radius = int(rad);
  float h = gray2Slider.getVal();
  float h2 = h;
  for (int r = 0; r < radius; r++){
    fill(h);
    stroke(h);
    ellipse(x, y, rad-r, rad-r);
    if(h<255){
      h = h+(255-h2)/(rad*blurSlider.getVal());
    }else{
      h=255;
    }
  }
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
  String units;
  
  GSlider (String l, float xp, float yp, int sw, int sh, float minv, float maxv, float initPos, color c,boolean showv,boolean floord,String unts){
    label = l;
    swidth = sw;
    sheight = sh;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + ((initPos-minv)/(maxv-minv))*swidth;
    smin = xpos;
    smax = xpos+swidth;
    spos = max(min(spos,smax),smin);
    vmin = minv;
    vmax = maxv;
    col = c;
    vanityEdge = 5;
    showVal = showv;
    floored = floord;
    units = unts;
  }
  
  void refresh(){
    this.update();
    this.display();
  }
  
  void update(){
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
  
  void setVal(float val){
    spos = smin + ((val-vmin)/(vmax-vmin))*swidth;
  }
  
  boolean overEvent(){
    if(mouseX>xpos && mouseX<xpos+swidth && mouseY>ypos && mouseY<ypos+sheight){
      return true;
    }else{
      return false;
    }
  }
  
  void display(){
    fill(blendColor(col,color(30),BURN));    
    textSize(12);
    textAlign(CENTER, BOTTOM);
    text(label,xpos+swidth/2,ypos-1);
    if(showVal){
      fill(blendColor(col,color(90),BURN));  
      if(floored){
        text(int(this.getVal())+" "+units,xpos+swidth/2,ypos+sheight*2.5);
      }else{
        text(floor(this.getVal()*1000)/1000.+" "+units,xpos+swidth/2,ypos+sheight*2.5);
      }
    }
    noStroke();
    fill(col);
    rect(xpos-vanityEdge,ypos,swidth+2*vanityEdge,sheight);
    if(over || locked){
      fill(blendColor(col,color(90),DODGE));
    }else{
      fill(blendColor(col,color(50),DODGE));
    }
    rect(spos-sheight/2,ypos-1,sheight,sheight+2);
  }
  
  float getVal(){
    if(floored){
      return floor(vmin+((spos-xpos)/swidth)*(vmax-vmin));
    }else{
      return vmin+((spos-xpos)/swidth)*(vmax-vmin);
    }
  }
}
  


