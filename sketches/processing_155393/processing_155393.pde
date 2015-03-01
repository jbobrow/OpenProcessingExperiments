
float sqw = 50.;
float sqh = 50.;
float groutWidth = 1.;
float MouseX;
float MouseY;
GSlider bgSlider;
GSlider checkSlider1;
GSlider checkSlider2;
GSlider tileWidthSlider;
GSlider tileHeightSlider;
GSlider groutSlider;
GSlider tileSlider;
RadioButtons slideTypes;

void setup(){
  size(750,850);
  background(#888888);
  ArrayList<String> options;
  options = new ArrayList<String>();
  options.add("Every Row");
  options.add("Alternating");
  options.add("Zig-zag");
  color buttonsColor = color(67,125,212);
  color slidersColor = color(106,148,212);
  slideTypes = new RadioButtons(350,760,70,20,options,buttonsColor);
  bgSlider = new GSlider("Grout Value",10,780,150,10,.5,slidersColor);
  checkSlider1 = new GSlider("Tile Value A",10,810,150,10,0,slidersColor);
  checkSlider2 = new GSlider("Tile Value B",10,840,150,10,1,slidersColor);
  tileWidthSlider = new GSlider("Tile Width",180,785,150,10,.25,slidersColor);
  tileHeightSlider = new GSlider("Tile Height",180,820,150,10,.25,slidersColor);
  groutSlider = new GSlider("Grout Width",440,785,300,10,1,slidersColor);
  tileSlider = new GSlider("Tile Displacement",440,820,300,10,1,slidersColor);
}

void draw(){
  if(mouseY<750){
    MouseX = mouseX;
    MouseY = mouseY;
    groutSlider.setVal(mouseY/750.);
    tileSlider.setVal(mouseX/750.);
  }
  sqw = tileWidthSlider.getPos()*200;
  sqh = tileHeightSlider.getPos()*200;
  groutWidth = floor(groutSlider.getPos()*40);
  background(color(bgSlider.getPos()*255));
  int numRows = ceil(750/(sqh+groutWidth))+1;
  for(int i=0;i<numRows;i=i+1){
    drawRow(i);
  }
  stroke(100);
  strokeWeight(5);
  fill(200);
  rect(-10,750,770,110);
  bgSlider.refresh();
  checkSlider1.refresh();
  checkSlider2.refresh();
  tileWidthSlider.refresh();
  tileHeightSlider.refresh();
  groutSlider.refresh();
  tileSlider.refresh();
  slideTypes.refresh();
}

void drawRow(int row){
  float yPos = row*(sqh+groutWidth);
  int numSq = ceil(750/sqw)+3;
  float dTiles = tileSlider.getPos()*200;
  for(int i = 0;i<numSq;i=i+1){
    if(i%2==0){
      fill(color(checkSlider1.getPos()*255));
    }else{
      fill(color(checkSlider2.getPos()*255));
    }
    noStroke();
    if(slideTypes.pressed==2){
      int rowd = row%4;
      if(rowd==3){
        rowd=1;
      }
      rect(i*(sqw+groutWidth)-((rowd)*dTiles)%(2*(sqw+groutWidth)),yPos,sqw,sqh);
    }else if(slideTypes.pressed==1){
      rect(i*(sqw+groutWidth)-((row%2)*dTiles)%(2*(sqw+groutWidth)),yPos,sqw,sqh);
    }else if(slideTypes.pressed==0){
      rect(i*(sqw+groutWidth)-(row*dTiles)%(2*(sqw+groutWidth)),yPos,sqw,sqh);
    }
  }
}

class GSlider {
  int swidth, sheight;  //width and height of slider
  float xpos, ypos;     //slider position
  float spos, newspos;  //indicator position
  float smin, smax;     //min and max values of slider
  int loose;            //control tightness
  boolean over;         //mouse hovering
  boolean locked;
  color col;
  float ratio;
  int vanityEdge;       //extra width so that indicator won't go off of slider
  String label;
  
  GSlider (String l, float xp, float yp, int sw, int sh, float initPos, color c){
    label = l;
    swidth = sw;
    sheight = sh;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + initPos*swidth;
    smin = xpos;
    smax = xpos+swidth;
    col = c;
    vanityEdge = 5;
  }
  
  void refresh(){
    update();
    display();
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
      if(!mousePressed){
        locked = false;
      }
    }
  }
  
  void setVal(float val){
    spos = smin+val*swidth;
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
  
  float getPos(){
    return (spos-xpos)/swidth;
  }
}

class RadioButtons{
  int nButtons;
  float w;
  float h;
  float x;
  float y;
  ArrayList<String> labels;
  int currSelection;
  color colour;
  int pressed;
  float depth;
  float ySpacing = 1.25;
  float xD = .6;
  
  RadioButtons(float xp, float yp, float widths, float heights, ArrayList<String> labls,color col){
    x = xp;
    y = yp;
    w = widths;
    h = heights;
    labels = labls;
    nButtons = labels.size();
    colour = col;
    pressed = 0;
    depth = .2*h;
  }
  void refresh(){
    update();
    display();
  }
  void update(){
    if(overEvent() && mousePressed){
      for(int i=0;i<nButtons;i++){
        if(mouseY>y+ySpacing*i*h && mouseY<y+ySpacing*i*h+h+depth){
          pressed = i;
        }
      }
    }
  }
  void display(){
    for(int i=0;i<nButtons;i++){
      float ypos = y+ySpacing*i*h;
      if(i==pressed){
        drawPressed(ypos,i);
      }else{
        drawUnpressed(ypos,i);
      }
    }
  }
  void drawUnpressed(float yp, int id){
    float ypos = yp;
    int i = id;
    fill(blendColor(colour,color(80),HARD_LIGHT));
    noStroke();
    beginShape();
    vertex(x,ypos+h);
    vertex(x+w,ypos+h);
    vertex(x+w+xD*depth,ypos+h+depth);
    vertex(x+xD*depth,ypos+h+depth);
    endShape(CLOSE);
    
    fill(blendColor(colour,color(100),HARD_LIGHT));
    beginShape();
    vertex(x+w,ypos);
    vertex(x+w+xD*depth,ypos+depth);
    vertex(x+w+xD*depth,ypos+h+depth);
    vertex(x+w,ypos+h);
    endShape(CLOSE);
    
    fill(colour);
    rect(x,ypos,w,h);
    fill(blendColor(colour,color(170),DODGE));
    textSize(.6*h);
    textAlign(LEFT,TOP);
    text(labels.get(i),x+.15*h,ypos+.05*h);
  }
  void drawPressed(float yp, int id){
    int i = id;
    float ypos = yp;
    fill(blendColor(colour,color(80),HARD_LIGHT));
    noStroke();
    beginShape();
    vertex(x+xD*depth,ypos+depth);
    vertex(x+w+xD*depth,ypos+depth);
    vertex(x+w+xD*depth,ypos+2*depth);
    vertex(x+xD*2*depth,ypos+2*depth);
    endShape(CLOSE);
    
    fill(blendColor(colour,color(100),HARD_LIGHT));
    beginShape();
    vertex(x+xD*depth,ypos+depth);
    vertex(x+xD*2*depth,ypos+2*depth);
    vertex(x+xD*2*depth,ypos+h+depth);
    vertex(x+xD*depth,ypos+h+depth);
    endShape(CLOSE);
    
    fill(blendColor(colour,color(100),HARD_LIGHT));
    rect(x+xD*1.1*depth,ypos+1.1*depth,w-.05*xD*depth,h-.05*depth);
    fill(blendColor(colour,color(170),DODGE));
    textSize(.6*h);
    textAlign(LEFT,TOP);
    text(labels.get(i),x+.15*h+xD*1.1*depth,ypos+.05*h+1.1*depth);
  }
  boolean overEvent(){
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h*ySpacing*nButtons){
      return true;
    }else{
      return false;
    }
  }
}


