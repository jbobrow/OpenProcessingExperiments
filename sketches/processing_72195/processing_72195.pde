
//Tchunoo Rhee Kahng, andrewID: tkahng
//Hw_4, Tuesday 4 Sep 2012, 48-257 Processing for the Arts
//All materials and images on this code Copyright (c) Tchunoo Rhee Kahng, 2012.

int linenum = 1;

void setup(){
  size(400,400);
  smooth();
  background(171,176,203);

}

void draw(){
  background(171,176,203);
  int liner = 89;
  int lineg = 88;
  int lineb = 255;
  int linea = 200;
  stroke(liner,lineg,lineb,linea);
  
  for(int i = 0; i < 400; i = i + linenum){
    line(i,0,mouseX,mouseY);
    line(0,i,mouseX,mouseY);
    line(i,400,mouseX,mouseY);
    line(400,i,mouseX,mouseY);
  }
  
  if (keyPressed) {
    if (key == CODED) {
    if (keyCode == UP) {
      linenum = linenum + 2;
    }
    }
  }

  if (keyPressed) {
    if (key == CODED) {
    if (keyCode == DOWN) {
      linenum = linenum - 2;
    }
    }
  }
  if (linenum < 0){
    linenum = 1;
  }




//saveFrame("hw4.jpg");
}
