
import controlP5.*;
ControlP5 cp5;

import processing.serial.*;
Serial porta;

String com = "COM4";


PImage image[]= {loadImage("on.png"),loadImage("off.png")};

void setup() {
  size(350,250);
  cp5 = new ControlP5(this);
 
  cp5.addButton("LED_1_on").setSize(50,50).setPosition(50,50).setValue(1).setImages(image[0]).updateSize();
  cp5.addButton("LED_2_on").setSize(50,50).setPosition(150,50).setValue(1).setImages(image[0]).updateSize();
  cp5.addButton("LED_3_on").setSize(50,50).setPosition(250,50).setValue(1).setImages(image[0]).updateSize();
  
  cp5.addButton("LED_1_off").setSize(50,50).setPosition(50,150).setValue(0).setImages(image[1]).updateSize();  
  cp5.addButton("LED_2_off").setSize(50,50).setPosition(150,150).setValue(0).setImages(image[1]).updateSize();
  cp5.addButton("LED_3_off").setSize(50,50).setPosition(250,150).setValue(0).setImages(image[1]).updateSize();
     
  porta = new Serial(this,com,19200);

}

void draw() {
}


public void LED_1_on(int led_a_1 ) { 
  porta.write('A');
}
public void LED_1_off(int led_a_0 ){
  porta.write('B');
}
public void LED_2_on(int led_b_1 ){
  porta.write('C');
}
public void LED_2_off(int led_b_0 ){
  porta.write('D');
}
public void LED_3_on(int led_c_1 ){
  porta.write('E');
}
public void LED_3_off(int led_c_0 ){
  porta.write('F');
}



