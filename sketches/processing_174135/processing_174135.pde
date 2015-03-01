
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;


Button[] pianoKeys;
char[] keyboardKeys = {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\''};
String[] noteNames = {"A2", "B2", "C3", "D3", "E3", "F3", "G3", "A3", "B3", "C4", "D4"};




void setup(){
 size(800, 800, P3D);
 smooth();
 pianoKeys = new Button[0];
 minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
 out = minim.getLineOut();
  
  
 for(int i = 0; i < 11; i++){
   pianoKeys = (Button[]) append(pianoKeys, new Button(90 + 60 * i, 3*height/4, 0, 58, 300, 30, false));
 } 
 
}

void draw(){
  background(0);
  fill(255);
  pushMatrix();
  ambientLight(255, 249, 211);
  for(int i = 0; i < 11; i++){
    pianoKeys[i].display();
  }
  popMatrix();  

}


class Button{
 
 float cenX, cenY, cenZ;
 float buttonWidth, buttonHeight, buttonDepth;
 boolean isOn;
 
 Button(float cenX_, float cenY_, float cenZ_, float buttonWidth_, float buttonHeight_, float buttonDepth_, boolean isOn_){
   cenX = cenX_;
   cenY = cenY_;
   cenZ = cenZ_;
   buttonWidth = buttonWidth_;
   buttonHeight = buttonHeight_;
   buttonDepth = buttonDepth_;
   isOn = isOn_;
 }
 
 void display(){
   pushMatrix();
   translate(cenX, cenY, cenZ);
   if(isOn){
     translate(0, 0, -10);
   }
   rotateX(0.6);
   fill(255);
   stroke(220);
   box(buttonWidth, buttonHeight, buttonDepth);
   popMatrix();
 }
  
 void setZ(float cenZ_){
  cenZ = cenZ_;
 }

 void setState(boolean isOn_){
   isOn = isOn_;
 }
}

void keyPressed(){
  for(int i = 0; i < keyboardKeys.length; i++){
    if(key == keyboardKeys[i]){
      pianoKeys[i].setState(true);
      out.playNote(0.0, 1, noteNames[i]);
    }
  }
}

void keyReleased(){
  for(int i = 0; i < keyboardKeys.length; i++){
    if(key == keyboardKeys[i]){
      pianoKeys[i].setState(false);
    }
  }
}


