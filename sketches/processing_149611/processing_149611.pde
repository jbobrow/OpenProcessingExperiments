
import controlP5.*;
 
ControlP5 cp5;
 
String url1, url2;
 
void setup() {
  size(700, 400);
  cp5 = new ControlP5(this);
  cp5.addTextfield("textInput_1").setPosition(20, 100).setSize(200, 40).setAutoClear(false);
  cp5.addTextfield("textInput_2").setPosition(20, 170).setSize(200, 40).setAutoClear(false);
  cp5.addBang("Submit").setPosition(240, 170).setSize(80, 40);    
 
}
 
void draw () {
  background(0);
}
 
void Submit() {
  print("the following text was submitted :");
  url1 = cp5.get(Textfield.class,"textInput_1").getText();
  url2 = cp5.get(Textfield.class,"textInput_2").getText();
  print(" textInput 1 = " + url1);
  print(" textInput 2 = " + url2);
  println();
}
