
import processing.opengl.*;

import procontroll.*;
import net.java.games.input.*;

ControllIO controllIO;
ControllDevice joypad;
ControllCoolieHat cooliehat;
ControllStick leftStick;
ControllStick rightStick;

ControllButton buttonA;
ControllButton buttonB;
ControllButton buttonX;
ControllButton buttonY;
ControllSlider sliderZ;

int boxSizeX = 200;
int boxSizeY = 200;
int boxSizeZ = 200;

float boxRotateX = 0.0;
float boxRotateY = 0.0;

float transX;
float transY;
float transZ;

void setup(){
  size(600,600,OPENGL);

  transX = width/2;
  transY = height/2;
  transZ = 0;

  controllIO = ControllIO.getInstance(this);

  joypad = controllIO.getDevice("Controller (XBOX 360 For Windows)");
  joypad.printButtons();

  buttonA = joypad.getButton("Button 0");
  buttonB = joypad.getButton("Button 1");
  buttonX = joypad.getButton("Button 2");
  buttonY = joypad.getButton("Button 3");
  
  ControllSlider sliderX = joypad.getSlider(0);
  ControllSlider sliderY = joypad.getSlider(1);
  
  leftStick = new ControllStick(sliderX,sliderY);  

  ControllSlider sliderX2 = joypad.getSlider(2);
  ControllSlider sliderY2 = joypad.getSlider(3);
  rightStick = new ControllStick(sliderX2,sliderY2);
  rightStick.setTolerance(0.5);

  sliderZ = joypad.getSlider(4);
  cooliehat = joypad.getCoolieHat(10);
  cooliehat.setMultiplier(4);
}

void draw(){
  transX += cooliehat.getX();
  transY += cooliehat.getY();
  
  if (buttonA.pressed())
    fill(0,200,0);
  else if (buttonB.pressed())
    fill(200,0,0);
  else if (buttonX.pressed())
    fill(0,0,200);
  else if (buttonY.pressed())
    fill(200,150,0);
  else
    fill(200);
  
  boxSizeX = boxSizeX + int(leftStick.getY()*5);
  boxSizeY = boxSizeY + int(leftStick.getX()*5);
  boxSizeZ = boxSizeZ + int(sliderZ.getValue()*5);
  
  boxRotateX = boxRotateX + rightStick.getY()/10;
  boxRotateY = boxRotateY + rightStick.getX()/10;
    
  background(0);
  lights();
  translate(transX,transY,transZ);
  rotateX(boxRotateX);
  rotateY(boxRotateY);
  box(boxSizeX, boxSizeY, boxSizeZ);
}

