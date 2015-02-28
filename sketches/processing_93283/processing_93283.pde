
boolean whiteBGColour;

void setup(){
size(500,500);
background(255);
smooth();
}

void draw(){
stroke(0);
strokeWeight(abs(mouseX - pmouseX));
line(pmouseX,pmouseX,mouseX,mouseY);
}

void mousePressed () {
  if (whiteBGColour) {
    background(0);
  } else {
    background(255);
  }
  whiteBGColour = !whiteBGColour;
}


