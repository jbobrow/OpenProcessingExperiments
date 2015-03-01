
int xpos=75;
int ypos=50;
int s=35;
int h=40;
int t=45;
int rectw=185;
void setup() {
  
   
  
  ///back
  noStroke();
  size(800, 600);
  background(255);
  fill(255,228,137);
  rect(0, 0, rectw, 600);
 ///decoration
  fill(255,228,137);
  noStroke();
  ellipse(rectw+20,ypos+h,t,t);
  ellipse(rectw+20,ypos+3*h,t,t);
  ellipse(rectw+20,ypos+5*h,t,t);
  ellipse(rectw+20,ypos+7*h,t,t);
  ellipse(rectw+20,ypos+9*h,t,t);
  ellipse(rectw+20,ypos+11*h,t,t); 
///button

  fill(236, 208, 120);
  rect(xpos, ypos, s, s);
  fill(217, 91, 67);
  rect(xpos, ypos+h, s, s);
  fill(192, 41, 66);
  rect(xpos, ypos+2*h, s, s);
  fill(84, 36, 55);
  rect(xpos, ypos+3*h, s, s);
  fill(83, 119, 122);
  rect(xpos, ypos+4*h, s, s);
  fill(85, 98, 112);
  rect(xpos, ypos+5*h, s, s);
  fill(78, 205, 196);
  rect(xpos, ypos+6*h, s, s);
  fill(100, 244, 100);
  rect(xpos, ypos+7*h, s, s);
  fill(255, 107, 107);
  rect(xpos, ypos+8*h, s, s);
  fill(255);
  ///eraseButton
  stroke(247,164,100);
  strokeWeight(2);
  rect(57.5, ypos+10*h, s*2, s*2);
  textAlign(CENTER);
  fill(247,164,100);
  text("DELETE", rectw/2, ypos+10*h+s);
  
}
void draw() {
  ///Drawing
  if (mousePressed) {
    if (mouseX>rectw+40 && mouseX<width && mouseY>0 && mouseY<height) {
      strokeWeight(4);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }

    if (mouseX>xpos && mouseX<xpos+s && mouseY>ypos && mouseY<ypos+s) {
      stroke(236, 208, 120);
    }
    if (mouseX>xpos && mouseX<xpos+s && mouseY>ypos+h && mouseY<ypos+h+s) {
      stroke(217, 91, 67);
    } 
    if (mouseX>xpos && mouseX<xpos+s && mouseY>ypos+2*h && mouseY<ypos+2*h+s) {
      stroke(192, 41, 66);
    }  
    if (mouseX>xpos && mouseX<xpos+s && mouseY>ypos+3*h && mouseY<ypos+3*h+s) {
      stroke(84, 36, 55);
    }
    if (mouseX>xpos && mouseX<xpos+s && mouseY>ypos+4*h && mouseY<ypos+4*h+s) {
      stroke(83, 119, 122);
    }
    if (mouseX>xpos && mouseX<xpos+s && mouseY>ypos+5*h && mouseY<ypos+5*h+s) {
      stroke(85, 98, 112);
    }
    if (mouseX>xpos && mouseX<xpos+s && mouseY>ypos+6*h && mouseY<ypos+6*h+s) {
      stroke(78, 205, 196);
    }
    if (mouseX>xpos && mouseX<xpos+s && mouseY>ypos+7*h && mouseY<ypos+7*h+s) {
      stroke(100, 244, 100);
    }
    if (mouseX>xpos && mouseX<xpos+s && mouseY>ypos+8*h && mouseY<ypos+8*h+s) {
      stroke(255, 107, 107);
    }
    if (mouseX>57.5 && mouseX<57.5+s*2 && mouseY>ypos+10*h && mouseY<ypos+10*h+s*2) {
      noStroke();
      fill(255);
      rect(185, 0, 615, 600);
  ///decoration
  fill(255,228,137);
  noStroke();
  ellipse(rectw+20,ypos+h,t,t);
  ellipse(rectw+20,ypos+3*h,t,t);
  ellipse(rectw+20,ypos+5*h,t,t);
  ellipse(rectw+20,ypos+7*h,t,t);
  ellipse(rectw+20,ypos+9*h,t,t);
  ellipse(rectw+20,ypos+11*h,t,t); 
    }
   }  
}


