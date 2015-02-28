


void setup() {
  size(715, 402);
  frameRate(12);
  smooth();
  background(241, 241, 251);
  stroke(127);
  strokeWeight(0);
  fill(127, 127, 127, 01);
}


void draw()  {  
  
  if (mousePressed == true)  {

  
  rect(mouseX, mouseY, 50 + abs(pmouseX - mouseX), 100 + abs(pmouseX - mouseX)); 
  
}

  }
  
  void keyPressed()   {
    if (key == 'a')  {
       stroke(127);
      strokeWeight(1);
      fill(0, 90, 255, 10);
    }
    if (key == 's')   {
       stroke(127);
      strokeWeight(1);
      fill(77, 187, 223, 10);
    }
    if (key == 'd')   {
      stroke(127);
      strokeWeight(1);
      fill(255, 0, 240, 10);
    }
    if (key == 'z')  {
       background(241, 241, 241);
       stroke(127);
      strokeWeight(0);
      fill(127, 127, 127, 01);
    }
    if (key == 'f')  {
       noFill();
       stroke(68);
       strokeWeight(1.5);
    }
    
  }

