
void setup() {
  size(950,250);
}

void draw() {
  background(0);
  
  if (mouseY < 55) {
    changeToFar(mouseX-100);
  } else if(mouseY > 180) {
    changeToCel(mouseX-100);
  } else {
    text("Hover mouse over each number line for conversion...", 50,125);
  }
  drawReference(100,50);
  drawReference(100,200);
  text("Fahrenheit to Celsius", 50, 30);
  text("Celsius to Fahrenheit", 50, 230);
}

void drawReference(int xpos, int ypos) {
  stroke(200);
  line(xpos-50, ypos, 900, ypos);
  for(int i = 0; i<800; i+=50) {
    text(i, xpos+i-5, ypos-3);
    //line(xpos+i,ypos+i,xpos+i,ypos+3+i);
  }
}

float changeToFar(float value) {
  value = (value-32)*5/9;
  background(0);
  text("Fahrenheit value = " + int(mouseX-100), 50, 120);
  text("Celsius value = " + int(value), 50, 150);
  return value;
}

float changeToCel(float value) {
  value = value*9/5+32;
  background(0);
  text("Celsius value = " + int(mouseX-100), 50, 120);
  text("Fahrenheit value = " + int(value), 50, 150);
  return value;
}


