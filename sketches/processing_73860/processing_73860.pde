
boolean start;
int timeClicked;
int r = 140;
int g = 244;
int b = 80;
float a = 255;
float centerX = 250;
float centerY = 200;

void setup(){
  size(500, 500); 
  start = false;
  cocoon(r, g, b, a);
}

void draw(){
  smooth();
  background(218, 254, 245);
  stem();
  butterfly();
  if (start == false){
      cocoon(r, g, b, a);
  }
  if (start == true){
   if (millis()- timeClicked < 5000){
    r -= 1;
    g -= 1;
    b -= 1;
    a -= .7;  
    cocoon(r, g, b, a);
      } else {
        centerX = .95*centerX + .05*mouseX;
        centerY = .95*centerY + .05*mouseY;
        brokenCocoon(r, g, b, a);
        }
  }
}

void mousePressed(){
    start = true;
    final int timeClicked = millis();
}

void stem(){
  stroke(93, 55, 20);
  noFill();
  beginShape();
  curveVertex(250, 0);
  curveVertex(250, 0);
  curveVertex(253, 30);
  curveVertex(240, 60);
  curveVertex(243, 100);
  curveVertex(243, 100);
  endShape();
}

void cocoon(int r, int g, int b, float a){
  fill(r, g, b, a);
  noStroke();
  beginShape();
  curveVertex(250, 300); // bottom tip
  curveVertex(250, 300);
  curveVertex(200, 250); // bottom left bulge
  curveVertex(190, 150); // top left bulge 
  curveVertex(250, 100); // top rounded bit
  curveVertex(310, 150); 
  curveVertex(300, 250);
  curveVertex(250, 300);
  curveVertex(250, 300);
  endShape();
}

void brokenCocoon(int r, int g, int b, float a){
  fill(r, g, b, a);
  noStroke();
  beginShape();
  curveVertex(250, 300); // bottom tip
  curveVertex(250, 150);
  curveVertex(240, 300); // bottom left dip
  curveVertex(200, 250); // bottom leftside  bulge
  curveVertex(190, 150); // top left bulge 
  curveVertex(250, 100); // top rounded bit
  curveVertex(310, 150); 
  curveVertex(300, 250);
  curveVertex(260, 300);
  curveVertex(250, 150);
  curveVertex(250, 300);
  endShape();
}

void butterfly(){
  fill(235, 106, 19);
  noStroke();
  // right upper wing
  beginShape();
  curveVertex(centerX, centerY);
  curveVertex(centerX, centerY);
  curveVertex(centerX+50, centerY-40);
  curveVertex(centerX+40, centerY+10);
  curveVertex(centerX, centerY);
  curveVertex(centerX, centerY);
  endShape();
  
  //left upper wing
  beginShape();
  curveVertex(centerX, centerY);
  curveVertex(centerX, centerY);
  curveVertex(centerX-50, centerY-40);
  curveVertex(centerX-40, centerY+10);
  curveVertex(centerX, centerY);
  curveVertex(centerX, centerY);
  endShape();
  
  //right lower wing
  beginShape();
  curveVertex(centerX, centerY); 
  curveVertex(centerX, centerY);
  curveVertex(centerX+30, centerY+30);
  curveVertex(centerX+10, centerY+55);
  curveVertex(centerX, centerY); 
  curveVertex(centerX, centerY);
  endShape();
  
  //left lower wing
  beginShape();
  curveVertex(centerX, centerY); 
  curveVertex(centerX, centerY);
  curveVertex(centerX-30, centerY+30);
  curveVertex(centerX-10, centerY+55);
  curveVertex(centerX, centerY); 
  curveVertex(centerX, centerY);
  endShape();
  
}
