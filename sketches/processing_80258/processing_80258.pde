
/* @pjs preload="sketch01.jpg"; */

PImage img;
PFont ingName;
PFont ingAmount;
Info gingerInfo;
Info garlicInfo;
Info sesameInfo;
Info soyaInfo;
Info gOnionInfo;
Info onionInfo;
Info porkInfo;


void setup(){
  size(500, 375);
  img = loadImage("sketch01.jpg");
  ingName = loadFont("ingName.vlw");
  ingAmount = loadFont("ingAmount.vlw");
  gingerInfo = new Info(150, 100, "Ginger:", "1/2 tsp, minced");
  garlicInfo = new Info(60, 145, "Garlic:", "4 cloves, minced");
  sesameInfo = new Info(60, 50, "Sesame Oil:   ", "2 tsp");
  soyaInfo = new Info(90, 10, "Soya Sauce:   ", "1 tbs");
  gOnionInfo = new Info(240, 185, "Green Onions:     ", "3, chopped");
  onionInfo = new Info(180, 265, "Onion:", "1 medium, sliced");
  porkInfo = new Info(440, 150, "Pork Belly:   ", "600 grams");
  frameRate(40);
}

void draw(){
  image(img, 0, 0);
  gingerInfo.display();
  gingerInfo.hover();
  garlicInfo.display();
  garlicInfo.hover();
  sesameInfo.display();
  sesameInfo.hover();
  soyaInfo.display();
  soyaInfo.hover();
  gOnionInfo.display();
  gOnionInfo.hover();
  onionInfo.display();
  onionInfo.hover();
  porkInfo.display();
  porkInfo.hover();
}


// CLASS FOR INFO CIRCLES
class Info {
  float xpos; //Circle Top Left Corner
  float ypos; //Circle Top Left Corner
  float w; // Circle Width
  float h; // Circle Height
  float sC; // Circle Stroke Color
  float fC; // Circle Fill Color
  float onHoverSpeed; // Speed the lines extend on hover
  float offHoverSpeed; // Speed the lines retract off hover
  float line1; // Line 1 ending x
  float line1b; // Line 1 ending y
  float line2; // Line 2 ending x
  String sName =""; // Ingredient Name String
  String sAmount = ""; // Ingredient Amount String
  float sWidth; // Width of Name text
  float sWidth2; // Width of all text

  Info(float tempXpos, float tempYpos, String tempsName, String tempsAmount) {
    xpos = tempXpos;
    ypos = tempYpos;
    sName = tempsName;
    sAmount = tempsAmount;
    w = 10;
    h = 10;
    sC = 0;
    fC = 255;
    onHoverSpeed = 3;
    offHoverSpeed = 4;
    line1 = 10;
    line1b = 10;
    line2 = 0;
    sWidth = textWidth(sName)+20;
    sWidth2 = sWidth+ textWidth(sAmount)+15;
  }
  
  void display(){
    smooth();
    fill(fC);
    stroke(sC);
    strokeWeight(1);
    ellipseMode(CORNER);
    ellipse(xpos, ypos, w, h);
  }
  
  void hover(){
    if(mouseX > xpos) {
      if (mouseX < xpos+w){
        if (mouseY > ypos) {
          if (mouseY < ypos+h){
            onHover();
          } else {
            offHover();
          }
        } else {
            offHover();
          }
      } else {
            offHover();
          }
    } else {
            offHover();
          }
  }
  
  void onHover(){
    if(sC < 255) {
      sC += 20;
    }
    if(fC > 0){
      fC -= 20;
    }
    if(sC >= 255) { //If stroke is fully white, draw first line
      stroke(255);
      
      if (xpos>400){ // Check to see if the selection is PORK, and adapt because Pork will go off screen
        rectMode(CORNERS);
        fill(0);
        rect(xpos-line1+10, ypos+line1, xpos-line1-line2+10, ypos+line1b-25); // Rectangle for text
    
        line(xpos, ypos+10, xpos-line1+10, ypos+line1b);
        if(line1 < 20){
          line1 += onHoverSpeed;
          line1b += onHoverSpeed;
        }
        if(line1 >= 20){ //If line 1 is fully drawn, draw second line
          line(xpos-line1+10, ypos+line1b, xpos-line1-line2+10, ypos+line1b);
          if(line2 < sWidth2){
            line2 += onHoverSpeed;
          }
          if (line2 >= sWidth2){
            fill(255);
            textFont(ingName); // Set Title
            text(sName, xpos-line1-line2+10+5, ypos+line1b-6);
            textFont(ingAmount); // Set Ingredient Amount
            text(sAmount, xpos-line1-line2+10+5+sWidth, ypos+line1b-6);
          }  
        }
      
      }
      else {
        rectMode(CORNERS);
        fill(0);
        rect(xpos+line1, ypos+line1, xpos+line1+line2, ypos+line1b-25); // Rectangle for text
        
        line(xpos+10, ypos+10, xpos+line1, ypos+line1b);
        if(line1 < 20){
          line1 += onHoverSpeed;
          line1b += onHoverSpeed;
        }
        if(line1 >= 20){ //If line 1 is fully drawn, draw second line
          line(xpos+line1, ypos+line1, xpos+line1+line2, ypos+line1b);
          if(line2 < sWidth2){
            line2 += onHoverSpeed;
          }
          if (line2 >= sWidth2){
            fill(255);
            textFont(ingName); // Set Title
            text(sName, xpos+line1+5, ypos+line1b-6);
            textFont(ingAmount); // Set Ingredient Amount
            text(sAmount, xpos+line1+5+sWidth, ypos+line1b-6);
          }
        
        }
      }
    }
  }

  void offHover(){
      
      if(xpos > 400){
        line(xpos, ypos+10, xpos-line1+10, ypos+line1b);
        line(xpos-line1+10, ypos+line1b, xpos-line1-line2+10, ypos+line1b);
        if(line2 > 0) { // If circle isn't selected, retract second line
          line2 -= offHoverSpeed;
        }
        if(line2 <= 0){
          line2 = 0; // Fix overspill
          if(line1 > 10){ // If second line is gone, retract first line
          line1 -= offHoverSpeed;
          line1b -= offHoverSpeed;
          }
        }
      if(line1 <= 10){ // If all lines are gore, return circle to original stroke and fill
          line1 = 10; // Fix overspill
           if(sC > 0) {
             sC -= 20;
           }
           if(fC < 255){
            fC += 20;
           }
        }
      }
      else {
        line(xpos+10, ypos+10, xpos+line1, ypos+line1b);
        line(xpos+line1, ypos+line1, xpos+line1+line2, ypos+line1b);
        if(line2 > 0) { // If circle isn't selected, retract second line
          line2 -= offHoverSpeed;
        }
        if(line2 <= 0){
          line2 = 0; // Fix overspill
          if(line1 > 10){ // If second line is gone, retract first line
          line1 -= offHoverSpeed;
          line1b -= offHoverSpeed;
          }
        }
      if(line1 <= 10){ // If all lines are gore, return circle to original stroke and fill
          line1 = 10; // Fix overspill
           if(sC > 0) {
             sC -= 20;
           }
           if(fC < 255){
            fC += 20;
           }
      }
      
    }
  }

  
}

