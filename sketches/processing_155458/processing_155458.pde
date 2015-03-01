
int rows = 100;
int cols = 100;
ArrayList<Agitator> agitators = new ArrayList<Agitator>();
GSlider vSoundSlider;
RadioButtons controlTypes;

Substrate[][] medium = new Substrate[cols][rows];

void setup(){
  size(750,850);
  ArrayList<String> options;
  options = new ArrayList<String>();
  options.add("Continuous Emission");
  options.add("Manual (Mouse Click)");
  color buttonsColor = color(67,125,212);
  controlTypes = new RadioButtons(430,770,200,25,options,buttonsColor);
  color slidersColor = color(106,148,212);
  vSoundSlider = new GSlider("Speed of Sound",116,800,200,10,.5,slidersColor);
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      medium[i][j] = new Substrate(i*10+(j%2)*5,j*10);
    }
  }
}

void draw(){
  if(controlTypes.pressed==0 && mouseY<750){
    Agitator newAg = new Agitator(mouseX,mouseY);
    agitators.add(newAg);
  }
  agitators = CleanUp(agitators);
  print(" ");
  print(agitators.size());
  background(color(220,230,250));
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      medium[i][j].update();
      medium[i][j].display();
    }
  }
  fill(150);
  stroke(110);
  strokeWeight(3);
  rect(-10,750,770,110);
  vSoundSlider.refresh();
  controlTypes.refresh();
}

void mousePressed(){
  if(mouseY<750){
    Agitator newAg = new Agitator(mouseX,mouseY);
    agitators.add(newAg);
  }
}

class Substrate{
  float x,y;
  float r;
  float tuning;
  float bigness = 2;
  Substrate(float x1, float y1){
    x = x1;
    y = y1;
    r = 1;
    tuning = 300;
  }
  void update(){
    bigness = 2+2*controlTypes.pressed;
    r = 0;
    for(int i=0;i<agitators.size();i++){
      Agitator ag = agitators.get(i);
      float xC = ag.x;
      float yC = ag.y;
      float dt = (millis()-ag.initTime)/1000.;
      float dist = sqrt(sq(x-xC)+sq(y-yC))+tuning/50.;
      float pulseLoc = dist-dt*(vSoundSlider.getPos()*500+100);
      if(abs(pulseLoc)<sqrt(tuning)*3){
        float scaling = 1./Gauss(0.,0.,tuning);
        r = r+bigness*scaling*Gauss(pulseLoc,0.,tuning);
      }
    }
  }
  void display(){
    fill(color(100,150-r*5,210-r*5));
    noStroke();
    ellipse(x,y,r,r);
  }
}

class Agitator{
  float x,y;
  int initTime;
  Agitator(float x1, float y1){
    x = x1;
    y = y1;
    initTime = millis();
  }
}

float Gauss(float x, float mean, float variance){
  return 1/sqrt(TWO_PI*variance)*exp(-sq(x-mean)/(2*variance));
}

ArrayList<Agitator> CleanUp(ArrayList<Agitator> ag){
  for(int i=0;i<ag.size();i++){
    float age = (millis() - ag.get(i).initTime)/1000.;
    if(age>(1.5*750)/(100+vSoundSlider.getPos()*500)){
      ag.remove(i);
    }
  }
  return ag;
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


