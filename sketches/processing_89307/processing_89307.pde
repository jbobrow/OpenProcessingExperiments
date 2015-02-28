


int red;
int redX = 200;
int redY = 30;
int redSize = 35;
int green;
int greenX = 400;
int greenY = 30;
int greenSize = 35;
int blue;
int blueX = 600;
int blueY = 30;
int blueSize = 35;
color currentColor;
Boolean anEllipse;
int[] myX = {pmouseX} ;



 


void setup() {
  stroke(255);
  size(800,800);
  background(random(200),random(200),random(200));
  frameRate(60);
  red = color(255,0,0);
  green = color(0,255,0);
  blue = color(0,0,255);
  currentColor = color(0);
  anEllipse = true;
  ellipseMode(CENTER);
}

void keyPressed() {
  if (keyCode == '1') {
    anEllipse = false;
    fill(random(360), random(360), random(360),50);
  rect(0,0,width,height);
  stroke(random(177),random(100),random(100));
  for( int i = 0; i < myX.length; i++){
    rect(pmouseX, pmouseY,7,7);
  }  
   
}
}


void draw() {
  fill(red);
  ellipse(redX,redY,redSize,redSize);
  fill(green);
  ellipse(greenX,greenY,greenSize,greenSize);
  fill(blue);
  ellipse(blueX,blueY,blueSize,blueSize);
  if (mousePressed) {
    fill(currentColor);
    if (anEllipse) {
    ellipse(mouseX,mouseY,35,35);
  }
  }
 if (keyCode == '2') {
   fill(random(200),random(200),random(200));
   ellipse(pmouseX, pmouseY, random(30), random(30));
 }
}

void mousePressed () {
  if (mousePressed & mouseButton == LEFT) {
    if ((mouseX > 190) & (mouseX < 275) & (mouseY > 15) & (mouseY < 75)){
    anEllipse = true;
    currentColor = color(red);
    }
    if ((mouseX > 390) & (mouseX < 475) & (mouseY > 15) & (mouseY < 75)){
    anEllipse = true;
    currentColor = color(green);
    }
    if ((mouseX > 590) & (mouseX < 675) & (mouseY > 15) & (mouseY < 75)){
    anEllipse = true;
    currentColor = color(blue);
  }
  }
}




