
//Simple toggle button for changing catagories... used in the SVM test application

class RGCatToggle extends RGObj {
  int value = 0;

  PFont font;
  ArrayList colorList;
  color[] colors;
  int stateNum=1;

  RGCatToggle(PApplet pAppNew, int xNew, int yNew, int wNew, int hNew, int stateNumNew) {
    super(pAppNew, xNew, yNew, wNew, hNew);
    colorList = new ArrayList();
    font = createFont("Monospace821BT-Roman", 11);

    stateNum = stateNumNew;
    if(stateNum < 1) {stateNum=1;}
  }

  void preChildrenRender() {
  }

  void postChildrenRender() {
    renderImg.textFont(font);
    renderImg.ellipseMode(CENTER);
    renderImg.smooth();    
    
    if(value==0) {renderImg.fill(0,120,120);}
    else if(value==1) {renderImg.fill(120,120,0);}
    else if(value==2) {renderImg.fill(120,0,120);}
    else if(value==3) {renderImg.fill(0,200,200);}
    else if(value==4) {renderImg.fill(200,200,0);}
    else if(value==5) {renderImg.fill(200,0,200);}
    else {renderImg.fill(120,120,120);}
    renderImg.noStroke();
    renderImg.ellipse(w/2,h/2, w-5,h-5);
    
    renderImg.stroke(0);
    renderImg.noFill();
    renderImg.ellipse(w/2,h/2, w-3,h-3);
    renderImg.stroke(0,80);
    renderImg.noFill();
    renderImg.ellipse(w/2,h/2, w-4,h-4);
    
    renderImg.fill(0);
    renderImg.noStroke();
    renderImg.text(Integer.toString(value), w/2-4, h/2+4);
    
  }
  
  int press(int mouseXin, int mouseYin) {
    return 1;
  }

  void release(int mouseXin, int mouseYin) {
    toggle();
    if(mouseXin>0 && mouseXin<w && mouseYin>0 && mouseYin<h) {
      //toggle();
      //println("MOOO");
    }
    /*if(unclickCallback != null) {
     //if you press the mouse on the button, and then drag away and let go it won't do anything
     
     }*/
    //hasChanged = true;
  }

  void toggle() {
    value++;
    if(value>=stateNum) {
      value = 0;  
    }
    hasChanged = true;
  }
}


