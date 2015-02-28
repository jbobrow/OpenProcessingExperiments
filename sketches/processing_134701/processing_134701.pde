
import controlP5.*;

int nbNeurons = 200;
int radNeurons = 40;
float moveX = 0.04;
boolean init = true;
boolean synMove = true;

//huge class just to controll our global values.

class NeuronsControler {
//we can adjust thoses global variables with the controller.


  public ControlP5 controlP5;
  public ControlWindow controlWindow;
  public CheckBox checkbox;

  int lastSceneSelected = 0;

  public NeuronsControler(processing.core.PApplet theParent) {

    controlP5 = new ControlP5(theParent);
  controlWindow = controlP5.addControlWindow("controles",100,100,400,200);
  controlWindow.hideCoordinates();
 

   // Controller number =controlP5.addSlider("number", 5, 600, nbNeurons, 10, 10, 100,10);
    Controller radius =controlP5.addSlider("radius", 40, 100, radNeurons, 10, 30, 100,10);
  // Controller movX =controlP5.addSlider("movX", -0.1,0.1, moveX, 10, 50, 100,10);
  // Controller init =controlP5.addButton("init", 10, 10,70, 20,20);
  // init.setWindow(controlWindow);


  }

  //get the slider named "sliderName" and set its value to "value"
  void getAndSetSlider(String sliderName, int value) {
    Slider slider = (Slider)controlP5.controller(sliderName);
    slider.setValue(value);
    slider.setWindow(controlWindow);
  }

  void setValues(int _nbNeurons, int _radNeurons, int _moveX){//, color _particuleColor, int _particuleDrawAlpha, boolean _drawRepulsionRadius, boolean _clearScreen, int _particuleRepulsionRadius) {

  //  getAndSetSlider("number", _nbNeurons);
    getAndSetSlider("radius", _radNeurons);
  //  getAndSetSlider("movX", _moveX);
    
  }

  //and event = a slider/button/checkbox 's value has changed.
  //determine which one, and change global variable according to its graphical representation.
  public void handleEvent(ControlEvent theEvent) {

    if (theEvent.isGroup()) { //first, handle the events from the checkBox

      
      return; //and return, if it was a groupe, because a group doesn't have the same characteristics.
    }

    String eventName = theEvent.controller().name();

 /*   if (eventName.equals("number")) {
      nbNeurons = (int)theEvent.value();
    }*/
    if (eventName.equals("radius")) {
      radNeurons = (int)theEvent.value();
      updateNeurons();
    }
    /*if (eventName.equals("movX")) {
      moveX = (int)theEvent.value();
      synMove = true;
    }*/
  }
  }


