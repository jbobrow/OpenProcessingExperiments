
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/62901*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int Color1 = 255;
int Color2 = 0;

float max_Teilung = 50;
float min_Teilung = 5;
float Teilung = min_Teilung;

float WindowWidth;
float WindowHeight;

float ObjectWidth;
float ObjectHeight;

PGraphics imgbuffer;

boolean is_growing = true;


void setup() {
  size(500, 500);
  background(128);
  noStroke();
  imgbuffer = createGraphics(width, height, JAVA2D);
  frameRate(10);
}

void draw() {
  if ((Teilung < max_Teilung)&&(is_growing)) {
    Teilung+=1;
  }
  else {
    is_growing = false;
  }
  if ((Teilung > min_Teilung)&&(!is_growing)) {
    Teilung-=1;
  }
  else {
    is_growing = true;
  }

  WindowWidth = width;
  WindowHeight = height;

  ObjectWidth = WindowWidth/Teilung;
  ObjectHeight = WindowHeight/Teilung;
  imgbuffer.beginDraw();
  for ( int i = 0; i <= Teilung; i++) {
    int ColorSwitch = 1;
    if ( (i % 2) == 0 ) {
      ColorSwitch = -1;
    }
    for ( int j = 0; j <= Teilung; j++) {
      ColorSwitch = -ColorSwitch;
      if (ColorSwitch > 0) {
        imgbuffer.fill(Color1);
      }
      else {
        imgbuffer.fill(Color2);
      } 
      imgbuffer.rect(ObjectWidth*i, ObjectHeight*j, ObjectWidth, ObjectHeight);
    }
  }
  imgbuffer.endDraw();
  image(imgbuffer, 0, 0);
}


