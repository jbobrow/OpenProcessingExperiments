
/**WetLook 2011/11/05 by Peter Bosshard Schneider<br />
*This sketch reads a textfile with a short title on each line.<br />
*It scrolls each line from bottom to top.<br />
*A mouseclick enables and disables mousecontrol.<br />
*If enabled the cursor changes to a cross else to a hand.<br />
*Horizontal movement controls the opacity of the text.<br />
*Vertical movement controls the opacity of the background pattern.<br />
*The background pattern is inspired by a the book of Clifford A. Pickover: "Computers and the Imagination"
*/

String datei_name = "titles.txt";
String[] lines;
int num_lines;
int curr_line = 0;
float max_scroll, min_scroll, scroll_speed;
float scroll_pos;
String theTitle = "";
PFont schrift;

float alfa_raster = 20;  //0=transparent 255=opaque
float alfa_text = 20;    //0=transparent 255=opaque
color txt_clr = color(255, 160, 100, alfa_text);
float min_wert = 796;
float max_wert = 967;

float increment = 1;
float startWert = min_wert;
boolean use_mouse = false;

void setup() {
  size(512, 512);
  lines = loadStrings(datei_name);
  num_lines = lines.length;
  schrift = loadFont("AkzidenzGroteskBE-Bold-100.vlw");
  textFont(schrift);
  textAlign(CENTER);
  background(255);
  noFill();
  smooth();
  max_scroll = height+80;
  min_scroll = -10;
  scroll_pos = max_scroll;
  scroll_speed = 3.3;
}

void draw() {
  background(255);

  // mouse control
  if (use_mouse) {
    cursor(CROSS);
    alfa_text = map(mouseX, 0, width, 0, 255);
    txt_clr = color(255, 160, 100, alfa_text);
    alfa_raster = map(mouseY, 0, width, 0, 255);
  }
  else {
    cursor(HAND);
  }
  // update scroll position and current title
  scroll_pos -= scroll_speed;
  if (scroll_pos < min_scroll) {
    scroll_pos = max_scroll;
    curr_line++;
    if (curr_line > lines.length-1) curr_line = 0;
  }
  theTitle = lines[curr_line];

  //Background Pattern
  float y=0;
  float x=0;
  float z=0;
  float f=0;
  int c=0;
  int k=0;

  loadPixels();
  // create background pattern
  for (int i = 0; i < width; i++) {
    x = startWert * i / width;
    for (int j = 0; j < height; j++) {
      y = startWert * j / height;
      z = ((x * x) + (y * y));
      f = ((z % 2) / 2);
      c = (int) constrain(f*255, 0, 255);
      k = abs(c);
      pixels[(j+(i*height))] = color(k%200, k%220, k, alfa_raster);
    } // end for
  } // end for

    // increment or decrement startWert
  startWert += increment;
  if ((startWert >= max_wert)&&(increment == 1)) {
    increment = -1;
  }
  else if ((startWert<=min_wert)&&(increment == -1)) {
    increment = 1;
  }
  updatePixels();

  // render Text
  fill(txt_clr);
  text(theTitle, width/2, scroll_pos);
}   

void mouseReleased() {
  use_mouse = !use_mouse;
}

//void  keyReleased(){
//  if(key == 's') saveFrame("WetLook_##.jpg");
//}

