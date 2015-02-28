
import controlP5.*;

ControlP5 mycp;
PFont Arista;
PFont Script;
PFont Hindi;

boolean pressed;
int strokewidth = 10, thickness, mark;
int font = 1;
String fontname;
void setup() {
  size(1024,640);
  smooth();
  Arista = loadFont("arista.vlw"); 
  Hindi = loadFont("hindi.vlw"); 
  Script = loadFont("script.vlw"); 
  
  
  mycp = new ControlP5(this);
  
  mycp.addButton("Arista")
      .setValue(0)
      .setPosition(20,20)
      .setSize(120,19)
      ;
      
  mycp.addButton("Script")
      .setValue(100)
      .setPosition(20,40)
      .setSize(120,19)
      ;
  mycp.addButton("Hindi")
      .setValue(0)
      .setPosition(20,60)
      .setSize(120,19)
      ;
  mycp.addSlider("strokewidth")
     .setPosition(160,20)
     .setSize(120,20)
     .setRange(0,15)
     ;      


}
  
void draw() {
  thickness = strokewidth;
  if(pressed == true){
    fill(#69D2E7);
    strokeWeight(thickness);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
}

/*
int check(mark) {
  mark = 0;
  for (int i = 0, i < pixels.length, i++){
    if(pixels[i] == #FA6900;){
      mark++;
    }
  }
}
      
*/
void keyPressed() {
  if (key == 'W' || key == 'w') {
    pressed = true;
  }
}

void keyReleased() {
  if(key == 'W' || key == 'w'){
    pressed = false;
  }
}

public void Arista(int font){
  if(font != 1){
    //clearscreen();
    fill(#FA6900);
    background(50);
    textFont(Arista, 177); 
    text("Write with me", 20, (height/2+50));
    font = 1;
  }
  
  if(font == 1){
    fontname = "Arista";
  }
  else if(font == 2){
    fontname = "Segoe Script";
  }
  else{
    fontname = "Hindi";
  }
  
  println("Font: "+fontname);
}

public void Script(int font){
  if(font != 2){
   // clearscreen();
   fill(#FA6900);
   background(50);
   textFont(Script,125); 
   text("Write with me", 20, (height/2+50));  
   font = 2;
  }
  
  if(font == 1){
    fontname = "Arista";
  }
  else if(font == 2){
    fontname = "Segoe Script";
  }
  else{
    fontname = "Hindi";
  }
  
  println("Font: "+fontname);
}

public void Hindi(int font){
  if(font != 3){
   // clearscreen();
    fill(#FA6900);
    background(50);
    textFont(Hindi,177); 
    text("मेरे साथ लिखना", 20, (height/2+80)); 
    font = 3;
  }
  
  if(font == 1){
    fontname = "Arista";
  }
  else if(font == 2){
    fontname = "Segoe Script";
  }
  else{
    fontname = "Hindi";
  }
  
  println("Font: "+fontname);
}

