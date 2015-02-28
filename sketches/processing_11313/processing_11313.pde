
void setup()   {
  size(715, 715);
  background(235);
  smooth();
  frameRate(20);
}

void draw()   {
  if (mousePressed == true)   {
    float speedScale = abs(pmouseX-mouseX);
    //background(255);
    float r = random(10, 60);
    color lineColor1 = color(50+random(0, 50), 75+random(0, 50), 150+random(0, 100));
    color lineColor2 = color(random(-20, 20), 150+random(0, 100), random(-20, 20));
    stroke(0, random(0, 255));
    strokeWeight(0.75);
    line(0, mouseX, mouseX, mouseY);
    line(mouseX, mouseY, width, mouseX);
    line(mouseY, 0, mouseX, mouseY);
    line(mouseX, mouseY, mouseX, height);
    line(mouseX, mouseY, mouseY, width);
        stroke(0);
    strokeWeight(speedScale/16);
    line(pmouseX, pmouseY, mouseX, mouseY);
    noStroke();
    fill(lineColor1);
    ellipse(mouseX, mouseY, speedScale/2, speedScale/2);
  }
}

void keyPressed()   {
    if (key == 'z')  {
       background(235);
    }
    
  }

