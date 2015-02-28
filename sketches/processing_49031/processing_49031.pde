
void setup () {
  size(640,480);
   frameRate(30);
}

void draw() {
  background(0);
  smooth();
  
  //stuck line(red)
  strokeWeight(1);
  stroke(80);
  line(0,240,mouseX*2,mouseY*2);
  
  //stuck line(aqua)
  strokeWeight(1);
  stroke(80);
  line(0,240,mouseX,mouseY);
  
  //stuck line(far circle)
  strokeWeight(1);
  stroke(80);
  line(0,240,mouseX*3,mouseY*4);
  
  //first line
  strokeWeight(1);
  stroke(80);
  line(mouseX*2,mouseY*2,mouseX/2,mouseY*3);
  
  //second line
  strokeWeight(1);
  stroke(80);
  line(mouseX,mouseY,mouseX/2,mouseY*3);
  
  
  //glowing guide (greyish top)
  noStroke();
  fill(mouseX,mouseX*2,mouseY*3,200);
  ellipse(mouseX/2,mouseY*3,mouseX/10,mouseX/10);
  
  //glowing guide (reddish right)
  noStroke();
  fill(mouseX*4,mouseX/2,mouseY*2,200);
  ellipse(mouseX*2,mouseY*2,mouseX/7,mouseX/7);
  
  // first glowing circle (aqua)
  noStroke();
  fill(0,255,255,200);
  ellipse(mouseX,mouseY,mouseX/8,mouseX/8);
  
  //baby far circle
  noStroke();
  fill(mouseX/2,0,mouseY/2,200);
  ellipse(mouseX*3,mouseY*4,mouseX/2,mouseX/2);
  
  //head
  noFill();
  strokeWeight(2.5);
  stroke(255);
  arc(mouseX,mouseY*1.5,35,35,radians(180),radians(360));
  
  //rect
  rectMode(CENTER);
  rect(mouseX,(mouseY+9)*1.5,35,25);
  
  //line
  line(mouseX,(mouseY+2)*1.5,mouseX,(mouseY+17)*1.5);
  
  //left semicircle
  arc(mouseX-17,(mouseY+17)*1.5,35,35,radians(270),radians(360));
  
  //right semicircle
  arc(mouseX+17,(mouseY+17)*1.5,35,35,radians(180),radians(270));
  
  //legs
  line(mouseX+17,(mouseY+18)*1.5,pmouseX+17,(mouseY+5)*2);
  line(mouseX+12,(mouseY+18)*1.5,pmouseX+12,(mouseY)*2);
  line(mouseX+7,(mouseY+18)*1.5,pmouseX+7,(mouseY+5)*2);
  line(mouseX+2,(mouseY+18)*1.5,pmouseX+2,(mouseY)*2);
  line(mouseX-3,(mouseY+18)*1.5,pmouseX-3,(mouseY+5)*2);
  line(mouseX-8,(mouseY+18)*1.5,pmouseX-8,(mouseY)*2);
  line(mouseX-13,(mouseY+18)*1.5,pmouseX-13,(mouseY+5)*2);
  line(mouseX-18,(mouseY+18)*1.5,pmouseX-18,(mouseY)*2);
  
  //home
  noFill();
  strokeWeight(4);
  stroke(255);
  ellipse(0,240,60,60);
  
}

void mousePressed() {
    background(0,0,0,0);
    fill(255);
    quad((mouseX-6)*3,(mouseY+10)*3,(mouseX+4)*3,(mouseY+20)*3,(mouseX+6)*3,(mouseY+18)*3,(mouseX-4)*3,(mouseY+8)*3);
    quad((mouseX+6)*3,(mouseY+10)*3,(mouseX-4)*3,(mouseY+20)*3,(mouseX-6)*3,(mouseY+18)*3,(mouseX+4)*3,(mouseY+8)*3);
}

void keyPressed() {
    background(0,0,0,0);
    fill(255);
    quad((mouseX-6)*3,(mouseY+10)*3,(mouseX+4)*3,(mouseY+20)*3,(mouseX+6)*3,(mouseY+18)*3,(mouseX-4)*3,(mouseY+8)*3);
    quad((mouseX+6)*3,(mouseY+10)*3,(mouseX-4)*3,(mouseY+20)*3,(mouseX-6)*3,(mouseY+18)*3,(mouseX+4)*3,(mouseY+8)*3);
}


