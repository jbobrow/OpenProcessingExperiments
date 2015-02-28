
void setup()
{
  size(600, 680);
  background(0);
  rectMode(CENTER);
}


void myBrush4(float speed) {
  ellipse(mouseX, mouseY, 30, mouseY);  
  line(mouseX, mouseY, 0, 0);  
  line(mouseX, mouseY, 0, height);
  line(mouseX, mouseY, width, 0);  
  line(mouseX, mouseY, width, height);
  return;
}

void myBrush3(float speed) {
  ellipse(mouseX, mouseY, speed, speed);
  translate(20, 20);
  ellipse(mouseX, mouseY, speed/2, speed/2);
  translate(-20, 20);
  ellipse(mouseX, mouseY, speed/2, speed/2);
  translate(-20, -20);
  ellipse(mouseX, mouseY, speed/2, speed/2);
  translate(0,0);
  ellipse(mouseX, mouseY-40, speed/2, speed/2);
  ellipse(mouseX+20, mouseY-60, speed/2, speed/2);
  ellipse(mouseX+40, mouseY-40, speed/2, speed/2);
  return;
}

void myBrush2(float x, float y, float px, float py, float speed) {
  //strokeWeight(lineWidth);
  ellipse(x, height/2, speed, speed);
  ellipse(x, height/2, px, py);
  
  ellipse(width/2, (height/2)-((width/2)- mouseX), speed, speed);
  ellipse(width/2, (height/2)-((width/2)- mouseX), px, py);
  
  ellipse(width/2, (height/2)+((width/2)- mouseX), speed, speed);
  ellipse(width/2, (height/2)+((width/2)- mouseX), px, py);
  
  ellipse((width)-x, (height/2), speed, speed);
  ellipse((width)-x, (height/2), px, py);
  return;
}

void mouseDragged()
{

  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX, mouseY, width/2, height/2);

  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = 200;
  //float alpha = map(speed, 0, 20, 0, 200);
  //println("Unbelivable");
  // float lineWidth = map(speed, 0, 10, 10, 1);
  //lineWidth = constrain(lineWidth, 0, 20);
  float lineWidth = 5;
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);

  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);

  //rect(mouseX, mouseY, speed, speed);
  //line(pmouseX, pmouseY,mouseX, mouseY);
  //line(width/2+((width/2)-pmouseX), pmouseX, width/2+((width/2)-mouseX), mouseY);
  //myBrush1(mouseX, mouseY, 60.0, 60.0, speed);  
  myBrush2(mouseX, mouseY, 40.0, 40.0, speed);
 // myBrush3(speed);
  //circleBrush(speed);
  //myBrush4(speed);
  //brush1(mouseX, mouseY,speed, speed,lineWidth);
  //brush2(mouseX, mouseY,speed, speed,lineWidth);
  //brush3(mouseX, mouseY,speed, speed,lineWidth);
  //brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

  //brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  //brush6(mouseX, mouseY,speed, speed,lineWidth);
  //brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
}
