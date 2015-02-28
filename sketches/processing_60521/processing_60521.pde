

import toxi.geom.*;
import controlP5.*;

int nPar = 1500;
Vec2D[][] pos;
ControlP5 controlP5;
int t = 0;

void setup(){
  size(600,400);
  
  controlP5 = new ControlP5(this);
  Textfield textField = controlP5.addTextfield("text");
  textField.setCaptionLabel("Write your text now");
  textField.setSize(200,20);
  textField.setPosition(0.5*width-100,0.5*height-10);
  textField.setFocus(true);
  controlP5.hide();
  
  pos = calculateTrajectories("This is not a LOVE story",nPar);
  smooth();
  noStroke();
  background(0);
}

void draw() {
  if(t < pos[0].length){
    fill(0,80);
    rect(0,0,width,height);
  
    fill(0,155 + 100*noise(t*0.03),205 + 50*noise(t*0.03+300),40);
    for(int i = 0; i < pos.length; i++){
      ellipse(pos[i][t].x,pos[i][t].y,5,5);
    }
  }
  if(t > pos[0].length+20){
    controlP5.show();
  }
  t++;
}

void controlEvent(ControlEvent theControlEvent){
  if(theControlEvent.isFrom("text")){
    String txt = theControlEvent.getController().getStringValue();
    pos = calculateTrajectories(txt,nPar);
    controlP5.hide();
    smooth();
    noStroke();
    background(0);
    t = 0;
  }
}

//void mousePressed() {
//  save("pic.tiff");
//}


