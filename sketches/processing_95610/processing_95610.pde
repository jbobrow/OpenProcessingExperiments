
int number= 25; //iteration variable

void setup(){
  size(500,500);    //size of the page
  background(185,119,219); //light purple
  frameRate(15); //how fast the color changes
  stroke(0); //there are no lines
  }

void draw() {
  fill(214,164,197); //pink
  rect(mouseX,mouseY,mouseX,mouseY); //rectangle
}

void mouseMoved() {
  number=number+15; 
  if (number>70) {
    number=20;
  }
}



