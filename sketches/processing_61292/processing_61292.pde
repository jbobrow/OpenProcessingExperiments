
ControlP5 controlP5;
ControlWindow controlWindow;
Slider crossFadeControl;
Slider speed1Control, speed2Control;
DropdownList video1Menu, video2Menu;
Toggle blendControl;

Textfield sessionTitle;
Button recordButton;

float crossFade = 50.0;
float speed1 = 1.0;
float speed2 = 1.0;
float maxSpeed = 10.0;
PFont p = createFont("Arial", 10);

String video1, video2;
String sessionTitleTxt = timeStamp();

boolean recordSwitch = false;


void setupControlP5() {

  controlP5 = new ControlP5(this);
  controlP5.setControlFont(p);
  controlWindow = controlP5.addControlWindow("SimpleVideoMixer", controlLocationX, controlLocationY, 320, 200);
  controlWindow.hideCoordinates();
  controlWindow.setBackground(color(40));

  crossFadeControl = controlP5.addSlider("crossFade", 0, 100, crossFade, 85, 135, 150, 25);
  crossFadeControl.setWindow(controlWindow);

  speed1Control = controlP5.addSlider("speed1", -(maxSpeed), (maxSpeed), speed1, 30, 40, 20, 60);
  speed1Control.moveTo(controlWindow);
  speed2Control = controlP5.addSlider("speed2", -(maxSpeed), (maxSpeed), speed2, 270, 40, 20, 60);
  speed2Control.moveTo(controlWindow);

  blendControl = controlP5.addToggle("difference", false, 200, 170, 10, 10);
  blendControl.moveTo(controlWindow);

  sessionTitle = controlP5.addTextfield("session", 90, 75, 150, 25);
  sessionTitle.moveTo(controlWindow);
  sessionTitle.setText(timeStamp());
  sessionTitle.setFocus(false);
  sessionTitle.setAutoClear(false);

  recordButton = controlP5.addButton("rec", 0, 15, 160, 30, 30);
  recordButton.moveTo(controlWindow);
  recordButton.setSwitch(recordSwitch);
  recordButton.setColorBackground(color(80, 0, 0, 255));

  video1Menu = controlP5.addDropdownList("video1", 5, 30, 150, 200);
  video1Menu.moveTo(controlWindow);
  video1Menu.setBarHeight(18);
  video1Menu.setItemHeight(23);
  video1Menu.setValue(videoFileValue1);

  video2Menu = controlP5.addDropdownList("video2", 165, 30, 150, 190);
  video2Menu.moveTo(controlWindow);
  video2Menu.setBarHeight(18);
  video2Menu.setItemHeight(23);
  video2Menu.setValue(videoFileValue2);

  loadVideoFileList();
  buildVideoMenu1();
  buildVideoMenu2();
}


void buildVideoMenu1() {

  for (int i=0; i< videoFileList.length; i++) {

    video1Menu.addItem(videoFileList[i], i);
  }
}


void buildVideoMenu2() {

  for (int i=0; i< videoFileList.length; i++) {

    video2Menu.addItem(videoFileList[i], i);
  }
}


void controlEvent(ControlEvent theEvent) {

  if (theEvent.isGroup()) {

    if (theEvent.getGroup().equals(video1Menu)) {
      videoFileValue1 = (int)theEvent.getGroup().getValue();
      loadVideoFile1(videoFileList[videoFileValue1]); 

      println(videoFileValue1);
    }

    if (theEvent.getGroup().equals(video2Menu)) {
      videoFileValue2 = (int)theEvent.getGroup().getValue();
      loadVideoFile2(videoFileList[videoFileValue2]);
    }
  }

  else if (theEvent.isController()) {

    if (theEvent.controller().equals(recordButton)) {

      recordSwitch = !recordSwitch;

      if (recordSwitch == true) {

        startRecording();

        recordButton.setColorBackground(color(255, 0, 0, 255));
      }

      if (recordSwitch == false) {

        stopRecording();

        recordButton.setColorBackground(color(80, 0, 0, 255));
      }
    }
  }
}


