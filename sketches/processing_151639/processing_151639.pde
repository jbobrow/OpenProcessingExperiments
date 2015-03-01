
float red;
float green;
float blue;
float r=0, g=0, b=0;

void setup() {
  size(500, 500);

  // initialise the colour variables
  red = 0;
  blue = 0;
  green = 0;
  textAlign(LEFT);
  textSize(20);
}


void draw() {
  background(red, green, blue);

  if (mousePressed) {
    if (mouseY > height/4*1-40 && mouseY < height/4*1+30) {
      red = constrain(map(mouseX, 0, width, 0, 255), 0, 255);
      r = red;
    } else if (mouseY > height/4*2-40 && mouseY < height/4*2+30) {
      green = constrain(map(mouseX, 0, width, 0, 255), 0, 255);
      g = green;
    } else if (mouseY > height/4*3-40 && mouseY < height/4*3+30) {
      blue = constrain(map(mouseX, 0, width, 0, 255), 0, 255);
      b = blue;
    } else if (mouseY < height/4*1-40) {
      red = green = blue = constrain(map(mouseX, 0, width, 0, 255), 0, 255);
    } else if (mouseY > height/4*3+30) {
      float c = lerp(-255, 255, mouseX/float(width));
      red = constrain(r + c, 0, 255);
      green = constrain(g + c, 0, 255);
      blue = constrain(b + c, 0, 255);
    }
  }
  
  fill(255-red, 255-green, 255-blue);
  text("Grayscale", width/2-50, (height/4*1-40)/2);
  text("Red "+int(red), width/2-50, height/4);
  text("Green "+int(green), width/2-50, 2*height/4);
  text("Blue "+int(blue), width/2-50, 3*height/4);
  text("Relative Shift", width/2-50, (height + height/4*3+30)/2);
  for ( int i=1; i<=3; i++) {
    line(0, height/4*i - 40, width, height/4*i - 40);
    line(0, height/4*i + 30, width, height/4*i + 30);
  }
}

