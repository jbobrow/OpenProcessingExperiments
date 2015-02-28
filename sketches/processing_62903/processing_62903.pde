
color Color1 = color(255,200,128,20);
color Color2 = color(0,128,100,20);

float Teilung = 8;

float WindowWidth;
float WindowHeight;

float ObjectWidth;
float ObjectHeight;


void setup() {
  size(300, 300);
  smooth();


  background(128);
  
  noStroke();
  
}

void draw() {
  
  Teilung = mouseX/4;
  
  WindowWidth = width;
  WindowHeight = height;

  ObjectWidth = WindowWidth/Teilung;
  ObjectHeight = WindowHeight/Teilung;
  
  for ( int i = 0; i <= Teilung; i = i + 1) {

    int ColorSwitch = 1;
    if ( (i % 2) == 0 ) {
      ColorSwitch = -1;
    }


    for ( int j = 0; j <= Teilung; j = j + 1) {

      ColorSwitch = -ColorSwitch;

      if (ColorSwitch > 0) {
        fill(Color1);
      }
      else {
        fill(Color2);
      } 

      rect(ObjectWidth*i, ObjectHeight*j, ObjectWidth, ObjectHeight);
    }
  }
}


