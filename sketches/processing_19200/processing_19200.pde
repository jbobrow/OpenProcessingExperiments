
import controlP5.*;

public ControlP5 control;
public ControlWindow w;


void makeControls() {
  control = new ControlP5(this);

  w = control.addControlWindow("controlWindow", 10, 10, 350, 200);
  w.hideCoordinates();
  w.setTitle("Parameters");

  control.addSlider("day_of_year",0,365,0,20,20,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height
  control.addSlider("latitude",20,60,50.4,20,40,100,10).setWindow(w); // name,min,max,init,Xpos,Ypos,width,height

  control.setAutoInitialization(true);
}


void day_of_year(int t_) {time = t_;}

void latitude(float l_) {lat = l_;}



