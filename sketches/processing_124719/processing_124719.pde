
int STATE = 0;
PImage photo;
PImage frontPallete;
PImage marker;
PFont womp;
PFont womps;
color R46 = color(221,84,106);//Strong Red
color R89 = color(129, 43, 67);//Dark Red
color YR68 = color(243, 111, 46);//Orange
color YR15 = color(248, 186, 43); //Pumpkin Yellow
color B95 = color(100, 152, 178);//Light Grayish Cobalt
color B28 = color(33, 114, 184);//Royal Blue
color G46 = color(86, 157, 117);//Mistletoe
color YG06 = color(196, 221, 140);//Yellowish Green 
color BG07 = color(42, 171, 194);//Petroleum Blue
color BV13 = color(133, 142, 198);//Hydrangea Blue
color BV25 = color(127, 130, 164);//Grayish Violet
color RV95 = color(175, 128 ,151);//Baby Blossoms
color Y32 = color(244, 220, 197);//Cashmere
color R81 = color(231, 185, 201);//Rose Pink
color RV55 = color(231, 168, 204);//Hollyhock
color R85 = color(211, 105, 143);//Rose Red
color Y28 = color(210, 164, 105);//Lionet Gold
color E47 = color(140, 118, 97);//Dark Brown
color B100 = color(0);//Black
color E50 = color(242, 233, 235);//Eggshell White

Dibujo ConPlumon;
void setup() {
  size(900, 400);
  smooth();  
  photo = loadImage("spaper.jpg");
  marker = loadImage("COPICMARKA.png");
  frontPallete = loadImage("frontcopic.png");
  womp = loadFont("SketchetikLight-170.vlw"); 
  ConPlumon = new Dibujo();
  womps = loadFont("AlphaMackAOE-90.vlw");  
}
void draw(){
  if (STATE == 0){
  image(photo,0,0);
  image(marker, 145, 210);
  textFont(womp, 170);
  text("COPIC", 180, 185);  
  textFont(womps, 50);
  text("press enter to create", 210, 330);
  fill(mouseX, mouseY, 255);
}
  else if (STATE == 1) {
   }
}
void keyPressed() {
  if (keyCode == ENTER) {
    STATE = 1;
    image(photo, 0, 0);
    image(frontPallete, 0,0);
    noStroke();

  }
  if (key == 'b' || key == 'B') {
    ConPlumon.switchState(1);
    
  }
  if (key == 'a' || key == 'A') {
    ConPlumon.switchState(0);
  }
  if(key == 'c' || key == 'C'){
    ConPlumon.switchState(2);
  }
}
void mousePressed(){
  if (STATE == 1) {
    ConPlumon.drawStuff(mouseX, mouseY);
    image(frontPallete, 0, 0);    
  }
}
void mouseDragged(){
  if (STATE == 1) {
    ConPlumon.drawStuff(mouseX, mouseY);
    smooth();
    image(frontPallete, 0, 0);
 }
}



class Dibujo {
  int drawState = 0;
  Boolean isStrokeOn = true;
  Dibujo() {}
  void drawStuff (int x, int y) {
    if (isStrokeOn == false) {
      stroke(0);
    }else{
      noStroke();
    }
    
    if (drawState == 0) {
      fill(mouseX, mouseY, 70, 40);
      ellipse(x, y, 17, 25);
    } 
    else if (drawState == 1) {
      fill(mouseX, mouseY, 70, 50);
      rect(x, y, 12, 25);
    }
    else if (drawState == 2) {      
      fill(mouseX, mouseY, 70, 50);
      ellipse(x, y, 5, 5);
  }
  }
  void switchState(int newState) {
    drawState = newState; 
  }
  void switchStroke() {
    if (isStrokeOn == false) {
      isStrokeOn = true;
    }else{
      isStrokeOn = false;
    }
  }
}
    


