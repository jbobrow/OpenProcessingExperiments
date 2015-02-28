
int Color1 = 255;
int Color2 = 0;

float Teilung = 8;

float WindowWidth;
float WindowHeight;

float ObjectWidth;
float ObjectHeight;


void setup() {
  size(300, 300);
  smooth();

  WindowWidth = width;
  WindowHeight = height;

  ObjectWidth = WindowWidth/Teilung;
  ObjectHeight = WindowHeight/Teilung;

  background(128);
  
  noStroke();
  
}

void draw() {

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


