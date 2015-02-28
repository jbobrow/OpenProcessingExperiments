
void setup() {
  frameRate(1);
  size(450, 700);
colorMode(HSB, width, height, 100);
noStroke();
}

void draw() {
   size(450, 700);
  door(0, 0, 225, 700);
  door(225, 0, 450, 700);
  door(25, 30, 170, 500);
  door(255, 30, 170, 500);
  door(198, 315, 23, 70);
  door(229, 315, 23, 70);
  window(209, 350, 20, 20);
  window(241, 350, 20, 20);
  door(235, 420, 10, 100);
  door(205, 420, 10, 100);
  door(25, 580, 170, 70);
  door(255, 580, 170, 70);
  fill(mouseX, mouseY, random(255));
  textSize(50);
  text("721", 75, 255);
  textSize(12);
  text("BROADWAY", 80, 280);
  textSize(50);
  text("721", 300, 255);
  textSize(12);
  text("BROADWAY", 305, 280);
  if(mouseX >25 && mouseX<25+170 && mouseY>  30 && mouseY< 30+ 500){
    fill(mouseX,random(255), mouseY);
     textSize(50);
  text("721", 75, 255);
  textSize(12);
  text("BROADWAY", 80, 280);
  textSize(50);
  text("721", 300, 255);
  textSize(12);
  text("BROADWAY", 305, 280);
  }
   if(mouseX >255 && mouseX<255+170 && mouseY>  30 && mouseY< 30+ 500){
   fill(random(255),mouseX, mouseY);
    textSize(50);
  text("721", 75, 255);
  textSize(12);
  text("BROADWAY", 80, 280);
  textSize(50);
  text("721", 300, 255);
  textSize(12);
  text("BROADWAY", 305, 280);
   }
}

void door(float doorX, float doorY, float doorW, float doorH) {
  noStroke();
  fill(mouseX, mouseY, random(255));
  rect(doorX, doorY, doorW, doorH);
  if(mouseX >25 && mouseX<25+170 && mouseY>  30 && mouseY< 30+ 500){
    fill(mouseX,random(255), mouseY);
  rect(doorX, doorY, doorW, doorH);
  }
  if(mouseX >255 && mouseX<255+170 && mouseY>  30 && mouseY< 30+ 500){
   fill(random(255),mouseX, mouseY);
  rect(doorX, doorY, doorW, doorH);
  }
    
}
void window( float windowX, float windowY, float windowW, float windowH) {
  noStroke();
  fill(mouseX, mouseY, random(255));
  ellipse(windowX, windowY, windowW, windowH);
    if(mouseX >25 && mouseX<25+170 && mouseY>  30 && mouseY< 30+ 500){
    fill(mouseX,random(255), mouseY);
  ellipse(windowX, windowY, windowW, windowH);
  }
  if(mouseX >255 && mouseX<255+170 && mouseY>  30 && mouseY< 30+ 500){
   fill(random(255),mouseX, mouseY);
  ellipse(windowX, windowY, windowW, windowH);
  }

}



