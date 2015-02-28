
/*frame rate independent oscillator!
 This only works at frequencies that are lower than the frame rate
 remember sin(angle in radians) = something between -1 and 1, depending on angle
 we can take the product of sin() and multiply it to be the right scale for our animation!
 Jack Perkins, 2009, jackaperkins BATS! gmail.com */

/*Extended by Prodical to create an interactive virtual version of Tom Wilkinson's 'Light Wave' 
 sculpture seen at the Kinetics Art Fair Feb 2009 */

float wave; // our variable for keeping track of current wave position (goes from 0-2PI)
float freq; // desired frequency, used to figure out how much to increment wave by

float wavelength; // wavelength over a set number of lines
float amplitude; // amount of 'swing' per line - though does also lengthen line somewhat
int lines; // no of lines
int space; // the space between them
int thickness; // their thickness
int slices; // no of slices per line
float twist; // their amount of twist - horizontal or verticle

int textflag = 0;

//controlling the camera - do gey some unwanted 'lines' in the sketch at close quarter 
int keyval = 20; // muliplies the keypress value to give larger/smaller deviations
float ctrl0X = 0;
float ctrl1Y = -200;
float ctrl2Z = -30;


void setup(){
  size(800,400, P3D);
  wave=0;
  freq=0.23;
  frameRate(30); //my favorite is 9997

  wavelength=.1;
  amplitude=1;
  lines=80;
  space=10;
  thickness=8;
  slices=40;
  twist=0;
}


void draw(){
  background(200); // hurrrr durrrr

  if (textflag == 1){
    PFont font;
    font = loadFont("LucidaGrande-14.vlw"); 
    textFont(font, 14);
    textMode(SCREEN);
    text("frequency: q + - a", 10, 20);
    text("wavelength: w + - s", 10, 35);
    text("amplitude: e + - d", 10, 50);
    text("line thickness: r + - f", 10, 65);
    text("line length: t + - g", 10, 80);
    text("line twist: y + - h", 10, 95);
    text("line spacing: u + - j", 10, 110);
    text("camera: x axis LEFT + - RIGHT; y axis UP + - DOWN; z axis < + - > ", 10, 125);
  }

  //incrementing wave
  if (wave+hz(freq)>2*PI) { //if the new wave will be over 2PI ...
    wave=(wave+hz(freq)-2*PI); //then roll it over 
  } 
  else {
    wave+=hz(freq); //otherwise just add the increment to wave
  }

  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*60.0 / 360.0)+ctrl2Z, (width/2.0)+ctrl0X, (height/2.0)+ctrl1Y, 0, 0, 1, 0);

  // Begin loop
  for (int i = 0; i < lines;i++) {
    for (int j = 0; j <slices;j++) {
      int x = i * space;
      float y = i * wavelength;

      //draw our moving line based on the sin() of wave
      //multiply the product of sin() by how many pixels we want it to sway
      line(x,-j*sin(wave-y)*amplitude,-j-twist,x+thickness,-j*sin(wave-y)*amplitude,-j);
      line(x,+j*sin(wave-y)*amplitude,+j-twist,x+thickness,+j*sin(wave-y)*amplitude,+j);
    }
  }
}

//figuring out our increment value per frame
float hz(float x) { //take in our desired freq as X
  return((2*PI*x)/frameRate); //2PI is one complete cycle, so multiply by freq and divide by frame
}


void keyPressed() {
  // increase or decrese frequency, bugs out if you go over 1hz per frame!
  if (keyCode == 81){ // q
    freq=freq*1.3;
  }
  if (keyCode == 65){ // a
    freq=freq/1.3;
  }
  if (keyCode == 87){ // w
    wavelength = constrain(wavelength+.01, .01, 0.4);
  }
  if (keyCode == 83){ // s
    wavelength = constrain(wavelength-.01, .01, 0.4);
  }
  // increase or decrease amplitude
  if (keyCode == 69){ // e
    amplitude = constrain(amplitude+.1, 0, 4);
  }
  if (keyCode == 68){ // d
    amplitude = constrain(amplitude-.1, 0, 4);
  }
  if (keyCode == 82){ // r
    thickness = constrain(thickness+1, 1, 30);
  }
  if (keyCode == 70){ // f
    thickness = constrain(thickness-1, 1, 30);
  }
  if (keyCode == 84){ // t
    slices = constrain(slices+5, 5, 80);
  }
  if (keyCode == 71){ // g
    slices = constrain(slices-5, 5, 80);
  }
  if (keyCode == 89){ // y
    twist = constrain(twist+1, 0, 20);
  }
  if (keyCode == 72){ // h
    twist = constrain(twist-1, 0, 20);
  }
  if (keyCode == 85){ // u
    space = constrain(space+1, 1, 25);
  }
  if (keyCode == 74){ // j
    space = constrain(space-1, 1, 25);
  }
  if (keyCode == UP){ // moves camera up
    ctrl1Y = ctrl1Y-keyval;
  }
  if (keyCode == DOWN){ // moves camera down
    ctrl1Y = ctrl1Y+keyval;
  }
  if (keyCode == LEFT){ // moves camera left
    ctrl0X = ctrl0X+keyval;
  }
  if (keyCode == RIGHT){ // moves camera right
    ctrl0X = ctrl0X-keyval;
  }
  //if ((keyCode == 18) && (keyCode == UP)){ // moves camera in Z axis
  if (keyCode == 44){
    ctrl2Z = ctrl2Z+keyval;
  }
  //if ((keyCode == 18) && (keyCode == DOWN)){ // moves camera out Z axis
  if (keyCode == 46){
    ctrl2Z = ctrl2Z-keyval;
  }
  //if ((keyCode == 16) && (keyCode == 47)){ // ?
  if (keyCode == 47){ // ?
    textflag = 1;
  }
}

void keyReleased (){
  textflag = 0;
}

