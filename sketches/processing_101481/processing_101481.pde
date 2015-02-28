
import com.noisepages.nettoyeur.processing.*;
PureDataP5Jack pd;

void setup(){
 size(400,400); 
 smooth();
 colorMode(HSB, 100, 100, 100);
 pd = new PureDataP5Jack(this,1  ,2,"system","system");
 pd.openPatch(dataFile("TestProcessing.pd"));
 pd.subscribe("timeSymbol");
 pd.start();
}


void draw(){
  
    BackColor();
}

void mousePressed() {
  pd.sendBang("play");
  dispatchPad();
}

void mouseReleased() {
  pd.sendBang("release");
  
}

void mouseDragged() {
 dispatchPad();
}

void dispatchPad() {
   float mY = constrain(mouseY,0,height);
    float frequency = map(mY, height, 0, 0, 800);
    pd.sendFloat("freq", frequency);
    
    float mX = constrain(mouseX,0,width);
    float frequency2 = map(mX, width, 0, 0, 800);
    pd.sendFloat("freq2", frequency2);
}

void BackColor() {
  float backColor1=map(mouseX+mouseY,0,width+height,0,200);
  float backColor2=map(mouseX+mouseY,0,width+height,0,200);
  background(backColor1,backColor2,200);
}




