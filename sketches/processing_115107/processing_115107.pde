

float a = 100;
float b = 300;
float small = 15;
float med1 = 30;
float med2 = 45;
float large = 60;

void setup() {
  size(400,400);
}

void draw() {
  background(0);
  
  if(mouseX<width/2 && mouseY<height/2) {
  ellipse(b,b,large,large);
  }
  
  
  else if(mouseX>width/2 && mouseY<height/2) {
  ellipse(a,b,small,small);
  }
  
  
  else if(mouseX>width/2 && mouseY>height/2) {
  ellipse(a,a,med1,med1);
  }
  
  
  else {
  ellipse(b,a,med2,med2);
  }

}


