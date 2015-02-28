
import controlP5.*;

//we can adjust thoses global variables with the controller.
public int nbParticules = 100;
public Particule[] particules;

public int particuleDrawSize = 80;
public color particuleColor = color(255, 100, 255);
public int particuleDrawAlpha = 100;

public boolean drawRepulsionRadius = true;
public boolean clearScreen = true;
public int particuleRepulsionRadius = 50;



//huge class just to controll our global values.
//you don't want to read that, the core algorithm is inside Main and boids ;)
class BoidControler {

  public ControlP5 controlP5;
  public CheckBox checkbox;
  int lastSceneSelected = 0;

  public BoidControler(processing.core.PApplet theParent) {

    controlP5 = new ControlP5(theParent);
    controlP5.addButton("randomize", -1f, 680, h + 10, 100, 20);
    controlP5.addButton("preselected", -1f, 680, h + 35, 100, 20);

    controlP5.addSlider("alpha", 0, 255, particuleDrawAlpha, 10, h+20, 255, 15  );
    controlP5.addSlider("red", 0, 255, red(particuleColor), 10, h+40, 255, 15  );
    controlP5.addSlider("green", 0, 255, green(particuleColor), 10, h+60, 255, 15 );
    controlP5.addSlider("blue", 0, 255, blue(particuleColor), 10, h+80, 255, 15 );

    controlP5.addSlider("number", 0, 1000, nbParticules, 320, h+20, 255, 15 );
    controlP5.addSlider("repulsion", 0, 200, particuleRepulsionRadius, 320, h+40, 255, 15 );
    controlP5.addSlider("draw", 0, 300, particuleDrawSize, 320, h+60, 255, 15 );

    checkbox = controlP5.addCheckBox("checkBox", 680, h + 60);  
    // make adjustments to the layout of a checkbox.
    checkbox.setColorLabel(color(255));
    checkbox.setItemsPerRow(1);
    checkbox.setSpacingRow(10);
    // add items to a checkbox.
    checkbox.addItem("show repulsion", 0);
    checkbox.addItem("clear background", 10);

  }

  //get the slider named "sliderName" and set its value to "value"
  void getAndSetSlider(String sliderName, int value) {
    Slider slider = (Slider)controlP5.controller(sliderName);
    slider.setValue(value);
  }

  void setValues(int _nbParticules, int _particuleDrawSize, color _particuleColor, int _particuleDrawAlpha, boolean _drawRepulsionRadius, boolean _clearScreen, int _particuleRepulsionRadius) {

    getAndSetSlider("number", _nbParticules);
    getAndSetSlider("draw", _particuleDrawSize);
    getAndSetSlider("red", (int)red(_particuleColor));
    getAndSetSlider ("green", (int)green(_particuleColor));
    getAndSetSlider("blue", (int)blue(_particuleColor));
    getAndSetSlider("alpha", _particuleDrawAlpha);
    getAndSetSlider("repulsion", _particuleRepulsionRadius);

    checkbox.deactivateAll();
    if (_drawRepulsionRadius)
      checkbox.toggle(0);
    if (_clearScreen)
      checkbox.toggle(1);
  }

  public void cycleTroughtPreselected() {

    int maxS = 5;
    lastSceneSelected++;
    lastSceneSelected%=maxS;

    switch(lastSceneSelected) {
    case 0:
      setValues(500, 20, color(100, 148, 176), 135, true, false, 35);
      break;

    case 1:
      setValues(150, 115, color(255, 0, 0), 135, false, true, 59);
      break;

    case 2:
      setValues(800, 8, color(190, 67, 65), 41, false, false, 33);
      break;

    case 3:
      setValues(11, 190, color(173, 71, 255), 2, true, false, 113);
      break;

    case 4:
      setValues(100, 80, color(100, 255, 100), 100, true, true, 50);
      break;

    default:
      lastSceneSelected=0;
      print("fail");
    }

    initBoid();

    //if you go to a scene which do not clear the background, you will see the previous scene.
    fill(255);
    rect(0, 0, w, h);
  }



  //and event = a slider/button/checkbox 's value has changed.
  //determine which one, and change global variable according to its graphical representation.
  public void handleEvent(ControlEvent theEvent) {


    if (theEvent.isGroup()) { //first, handle the events from the checkBox

      // checkbox uses arrayValue to store the state of 
      // individual checkbox-items.
      for (int i=0;i<theEvent.group().arrayValue().length;i++) {
        int n = (int)theEvent.group().arrayValue()[i];

        if (i==0) {//show repulsion
          if (n==1) {
            drawRepulsionRadius = true;
          }
          else {
            drawRepulsionRadius = false;
          }
        }
        else if (i==1) {//clear background
          if (n==1) {
            clearScreen = true;
          }
          else {
            clearScreen = false;
          }
        }
      }
      return; //and return, if it was a groupe, because a group doesn't have the same characteristics.
    }

    String eventName = theEvent.controller().name();

    if (eventName.equals("randomize")) {
      initBoid();
    }
    if (eventName.equals("preselected")) {
      cycleTroughtPreselected();
    }
    if (eventName.equals("alpha")) {
      particuleDrawAlpha = (int)theEvent.value();
    }
    if (eventName.equals("red")) {
      particuleColor = color ( theEvent.value(), green(particuleColor), blue(particuleColor));
    }
    if (eventName.equals("green")) {
      particuleColor = color ( red(particuleColor), theEvent.value(), blue(particuleColor));
    }
    if (eventName.equals("blue")) {
      particuleColor = color ( red(particuleColor), green(particuleColor), theEvent.value() );
    }
    if (eventName.equals("number")) {
      nbParticules = (int)theEvent.value();
      initBoid();
    }
    if (eventName.equals("repulsion")) {
      particuleRepulsionRadius = (int)theEvent.value();
    }
    if (eventName.equals("draw")) {
      particuleDrawSize = (int)theEvent.value();
    }
  }
}


