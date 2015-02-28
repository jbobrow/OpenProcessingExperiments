
float bb = 100;
String message = "Touch the screen";

void setup()
{
  size(640,480);
  background(0);
  rectMode(CENTER);
  textSize(15);
}

void draw()
{
  noStroke();
  bb = bb + (int)random(-50,50);
  if (bb<0) {
    bb = 0;
  } else if (bb>128) {
    bb = 128;
  }
  fill(bb, 10);
  rect(width/2, height/2, width, height);
  fill(0, 255, 0);
  text(message, width/3, height/3);
  noFill();
}

void mouseDragged()
{
  float red = 255;
  float blue = map(mouseX, 0, width, 0, 255);
  float green = map(mouseY, 0, height, 0, 255);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);  
  
  float eT = 0.1; // edgeTolerance
  
  if(mouseX > width*(1-eT) && mouseY > height*(1-eT)) { // lower right corner
    brushBlood(mouseX, mouseY,speed, speed,lineWidth);
    message = "\nAGH!";
  } else if(mouseX < width*(eT) && mouseY > height*(1-eT)){ // lower left corner
    brushBlood(mouseX, mouseY,speed, speed,lineWidth);
    message = "\nMwahaha!";
  } else if(mouseX > width*(1-eT) && mouseY < height*(eT)) { // upper right corner
    brushBlood(mouseX, mouseY,speed, speed,lineWidth);
    message = "\nGun shots!";
  } else if(mouseX < width*(eT) && mouseY < height*(eT)) { // upper left corner
    brushBlood(mouseX, mouseY,speed, speed,lineWidth);
    message = "\nWhaaaa!";
  } else {
    stroke(0, green, blue);
    strokeWeight(lineWidth);
    line(pmouseX, pmouseY,mouseX, mouseY);
    brush1(mouseX, mouseY,speed, speed,lineWidth);
    brush2(mouseX, mouseY,speed, speed,lineWidth);
    message = "Check the corners...";
  }
}

void mouseReleased()
{
  //println("rel");
  //player2.ramp(0.,1000);
}

void brush1(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  ellipse(x,y,px*2,py*2);
  ellipse(width-x,height-y,px*2,py*2);
  return;
}


void brush2(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  ellipse(0+random(50),0+random(50),10,10); 
  popMatrix();
  pushMatrix();
  translate(width-x,height-y);
  rotate(random(px));
  ellipse(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}

void brushBlood(float x,float y, float px, float py, float lineWidth) {
  fill(255,0,0);
  stroke(255,0,0);
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  float radius1 = random(5);
  float radius2 = random(10);
  float radius3 = random(25);
  ellipse(0+random(80),0+random(80),radius1,radius1); 
  ellipse(0+random(40),0+random(40),radius2,radius2); 
  ellipse(0+random(30),0+random(30),radius3,radius3); 
  popMatrix();
  noFill();
  noStroke();
  return;
}
