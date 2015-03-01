
// Import 'Minim' library files
import ddf.minim.*; // Used to integrate sounds

// Declare global variables
Minim minim; // Sound library

// Define number of keys on the virtual keyboard
int Nkeys = 41;

// Declare audio samples as an array
AudioSample[] soundsamples = new AudioSample[Nkeys]; 

// Declare images
PImage background; // Background image edited in GIMP : broken piano in front of starry sky
PImage updated; // Used later, once graphical color keys are added in Processing

// Define Color Palette (whole white light spectrum)
color[] palette_spectrum = {
  color(97,0,97), color(121,0,141), color(131,0,181), color(126,0,219), color(106,0,255), color(61,0,255), color(0,0,255), color(0,70,255),
  color(0,123,255), color(0,169,255), color(0,213,255), color(0,255,255), color(0,255,146), color(0,255,0), color(54,255,0), color(94,255,0),
  color(129,255,0), color(163,255,0), color(195,255,0), color(225,255,0), color(255,255,0), color(255,223,0), color(255,193,0), color(255,155,0),
  color(255,119,0), color(255,79,0), color(255,33,0), color(255,0,0), color(255,0,0), color(255,0,0), color(255,0,0), color(255,0,0),
  color(255,0,0), color(237,0,0), color(219,0,0), color(200,0,0), color(181,0,0), color(161,0,0), color(141,0,0), color(119,0,0),
  color(97,0,0)};

// Declare constants for keys creation and positioning
float low, high, ul, ur, ll, lr, hw, lw, kh;
// low is the ordinate of the lower part of the top of the keys
// high is the ordinate of the upper part of the top of the keys
// ul is the abscissa of the upper left part of the top of the first key on the left
// ur is the abscissa of the upper right part of top of the the last key on the right
// ll is the abscissa of the lower left part of top of the the first key on the left
// lr is the abscissa of the lower right part of the top of the last key on the right
// hw is the width of the upper part of the top of each key
// lw is the width of the lower part of the top of each key
// kh is the height of the front part of the keys

// Setup code block 
void setup() {
      // Load audio files from HDD
  minim = new Minim(this);
  
  for (int i = 0; i < soundsamples.length; i++) {
    soundsamples[i] = minim.loadSample("snd" + nf(i+1, 2) + ".wav"); // nf() allows to generate 01, 02, etc.
  } // The audio frequencies correspond to the frequencies found in the visible spectrum (direct transposition from nanometers to hertz).

     // Size of the original image
  size(1153, 717);
  
     // Load base image
  background = loadImage("Celestial Piano v2.png");
  
     // Define the constants used for the keys 
  low = 463;
  high = 443;
  ul = 115;
  ur = 622;
  ll = 97;
  lr = 635;
  hw = (ur - ul) / Nkeys;
  lw = (lr - ll) / Nkeys;
  kh = 6.8;
}

// Draw code block 
void draw() {
      // The background is displayed
  image(background, 0, 0);
  
      // The colored keys as quadrangles 
      /*(Side note : there is a possibility to code this huge block in a more elegant and short way using Pshapes for quads and rects,
      and a loop, but then another rendering mode is needed (P2D). Unfortunately, as it uses OpenGL-compatible graphics hardware, 
      this renderer does not work well in web browsers, which makes it impossible to export a functional applet.)*/
      // Key 1
  fill(palette_spectrum[0]);
  quad(ul+0*hw, high, ul+(0+1)*hw, high, ll+(0+1)*lw, low, ll+0*lw, low); // Top part of the key
  rect(ll+0*lw, low, lw, kh); // Front part of the key
      // Key 2
  fill(palette_spectrum[1]);
  quad(ul+1*hw, high, ul+(1+1)*hw, high, ll+(1+1)*lw, low, ll+1*lw, low);
  rect(ll+1*lw, low, lw, kh);
      // Key 3
  fill(palette_spectrum[2]);
  quad(ul+2*hw, high, ul+(2+1)*hw, high, ll+(2+1)*lw, low, ll+2*lw, low);
  rect(ll+2*lw, low, lw, kh);
      // Key 4
  fill(palette_spectrum[3]);
  quad(ul+3*hw, high, ul+(3+1)*hw, high, ll+(3+1)*lw, low, ll+3*lw, low);
  rect(ll+3*lw, low, lw, kh);
      // Key 5
  fill(palette_spectrum[4]);
  quad(ul+4*hw, high, ul+(4+1)*hw, high, ll+(4+1)*lw, low, ll+4*lw, low);
  rect(ll+4*lw, low, lw, kh);
      // Key 6
  fill(palette_spectrum[5]);
  quad(ul+5*hw, high, ul+(5+1)*hw, high, ll+(5+1)*lw, low, ll+5*lw, low);
  rect(ll+5*lw, low, lw, kh);
      // Key 7
  fill(palette_spectrum[6]);
  quad(ul+6*hw, high, ul+(6+1)*hw, high, ll+(6+1)*lw, low, ll+6*lw, low);
  rect(ll+6*lw, low, lw, kh);
      // Key 8
  fill(palette_spectrum[7]);
  quad(ul+7*hw, high, ul+(7+1)*hw, high, ll+(7+1)*lw, low, ll+7*lw, low);
  rect(ll+7*lw, low, lw, kh);
      // Key 9
  fill(palette_spectrum[8]);
  quad(ul+8*hw, high, ul+(8+1)*hw, high, ll+(8+1)*lw, low, ll+8*lw, low);
  rect(ll+8*lw, low, lw, kh);
      // Key 10
  fill(palette_spectrum[9]);
  quad(ul+9*hw, high, ul+(9+1)*hw, high, ll+(9+1)*lw, low, ll+9*lw, low);
  rect(ll+9*lw, low, lw, kh);
      // Key 11
  fill(palette_spectrum[10]);
  quad(ul+10*hw, high, ul+(10+1)*hw, high, ll+(10+1)*lw, low, ll+10*lw, low);
  rect(ll+10*lw, low, lw, kh);
      // Key 12
  fill(palette_spectrum[11]);
  quad(ul+11*hw, high, ul+(11+1)*hw, high, ll+(11+1)*lw, low, ll+11*lw, low);
  rect(ll+11*lw, low, lw, kh);
      // Key 13
  fill(palette_spectrum[12]);
  quad(ul+12*hw, high, ul+(12+1)*hw, high, ll+(12+1)*lw, low, ll+12*lw, low);
  rect(ll+12*lw, low, lw, kh);
      // Key 14
  fill(palette_spectrum[13]);
  quad(ul+13*hw, high, ul+(13+1)*hw, high, ll+(13+1)*lw, low, ll+13*lw, low);
  rect(ll+13*lw, low, lw, kh);
      // Key 15
  fill(palette_spectrum[14]);
  quad(ul+14*hw, high, ul+(14+1)*hw, high, ll+(14+1)*lw, low, ll+14*lw, low);
  rect(ll+14*lw, low, lw, kh);
      // Key 16
  fill(palette_spectrum[15]);
  quad(ul+15*hw, high, ul+(15+1)*hw, high, ll+(15+1)*lw, low, ll+15*lw, low);
  rect(ll+15*lw, low, lw, kh);
      // Key 17
  fill(palette_spectrum[16]);
  quad(ul+16*hw, high, ul+(16+1)*hw, high, ll+(16+1)*lw, low, ll+16*lw, low);
  rect(ll+16*lw, low, lw, kh);
      // Key 18
  fill(palette_spectrum[17]);
  quad(ul+17*hw, high, ul+(17+1)*hw, high, ll+(17+1)*lw, low, ll+17*lw, low);
  rect(ll+17*lw, low, lw, kh);
      // Key 19
  fill(palette_spectrum[18]);
  quad(ul+18*hw, high, ul+(18+1)*hw, high, ll+(18+1)*lw, low, ll+18*lw, low);
  rect(ll+18*lw, low, lw, kh);
      // Key 20
  fill(palette_spectrum[19]);
  quad(ul+19*hw, high, ul+(19+1)*hw, high, ll+(19+1)*lw, low, ll+19*lw, low);
  rect(ll+19*lw, low, lw, kh);
      // Key 21
  fill(palette_spectrum[20]);
  quad(ul+20*hw, high, ul+(20+1)*hw, high, ll+(20+1)*lw, low, ll+20*lw, low);
  rect(ll+20*lw, low, lw, kh);
      // Key 22
  fill(palette_spectrum[21]);
  quad(ul+21*hw, high, ul+(21+1)*hw, high, ll+(21+1)*lw, low, ll+21*lw, low);
  rect(ll+21*lw, low, lw, kh);
      // Key 23
  fill(palette_spectrum[22]);
  quad(ul+22*hw, high, ul+(22+1)*hw, high, ll+(22+1)*lw, low, ll+22*lw, low);
  rect(ll+22*lw, low, lw, kh);
      // Key 24
  fill(palette_spectrum[23]);
  quad(ul+23*hw, high, ul+(23+1)*hw, high, ll+(23+1)*lw, low, ll+23*lw, low);
  rect(ll+23*lw, low, lw, kh);
      // Key 25
  fill(palette_spectrum[24]);
  quad(ul+24*hw, high, ul+(24+1)*hw, high, ll+(24+1)*lw, low, ll+24*lw, low);
  rect(ll+24*lw, low, lw, kh);
      // Key 26
  fill(palette_spectrum[25]);
  quad(ul+25*hw, high, ul+(25+1)*hw, high, ll+(25+1)*lw, low, ll+25*lw, low);
  rect(ll+25*lw, low, lw, kh);
      // Key 27
  fill(palette_spectrum[26]);
  quad(ul+26*hw, high, ul+(26+1)*hw, high, ll+(26+1)*lw, low, ll+26*lw, low);
  rect(ll+26*lw, low, lw, kh);
      // Key 28
  fill(palette_spectrum[27]);
  quad(ul+27*hw, high, ul+(27+1)*hw, high, ll+(27+1)*lw, low, ll+27*lw, low);
  rect(ll+27*lw, low, lw, kh);
      // Key 29
  fill(palette_spectrum[28]);
  quad(ul+28*hw, high, ul+(28+1)*hw, high, ll+(28+1)*lw, low, ll+28*lw, low);
  rect(ll+28*lw, low, lw, kh);
      // Key 30
  fill(palette_spectrum[29]);
  quad(ul+29*hw, high, ul+(29+1)*hw, high, ll+(29+1)*lw, low, ll+29*lw, low);
  rect(ll+29*lw, low, lw, kh);
      // Key 31
  fill(palette_spectrum[30]);
  quad(ul+30*hw, high, ul+(30+1)*hw, high, ll+(30+1)*lw, low, ll+30*lw, low);
  rect(ll+30*lw, low, lw, kh);
      // Key 32
  fill(palette_spectrum[31]);
  quad(ul+31*hw, high, ul+(31+1)*hw, high, ll+(31+1)*lw, low, ll+31*lw, low);
  rect(ll+31*lw, low, lw, kh);
      // Key 33
  fill(palette_spectrum[32]);
  quad(ul+32*hw, high, ul+(32+1)*hw, high, ll+(32+1)*lw, low, ll+32*lw, low);
  rect(ll+32*lw, low, lw, kh);
      // Key 34
  fill(palette_spectrum[33]);
  quad(ul+33*hw, high, ul+(33+1)*hw, high, ll+(33+1)*lw, low, ll+33*lw, low);
  rect(ll+33*lw, low, lw, kh);
      // Key 35
  fill(palette_spectrum[34]);
  quad(ul+34*hw, high, ul+(34+1)*hw, high, ll+(34+1)*lw, low, ll+34*lw, low);
  rect(ll+34*lw, low, lw, kh);
      // Key 36
  fill(palette_spectrum[35]);
  quad(ul+35*hw, high, ul+(35+1)*hw, high, ll+(35+1)*lw, low, ll+35*lw, low);
  rect(ll+35*lw, low, lw, kh);
      // Key 37
  fill(palette_spectrum[36]);
  quad(ul+36*hw, high, ul+(36+1)*hw, high, ll+(36+1)*lw, low, ll+36*lw, low);
  rect(ll+36*lw, low, lw, kh);
      // Key 38
  fill(palette_spectrum[37]);
  quad(ul+37*hw, high, ul+(37+1)*hw, high, ll+(37+1)*lw, low, ll+37*lw, low);
  rect(ll+37*lw, low, lw, kh);
      // Key 39
  fill(palette_spectrum[38]);
  quad(ul+38*hw, high, ul+(38+1)*hw, high, ll+(38+1)*lw, low, ll+38*lw, low);
  rect(ll+38*lw, low, lw, kh);
      // Key 40
  fill(palette_spectrum[39]);
  quad(ul+39*hw, high, ul+(39+1)*hw, high, ll+(39+1)*lw, low, ll+39*lw, low);
  rect(ll+39*lw, low, lw, kh);
      // Key 41
  fill(palette_spectrum[40]);
  quad(ul+40*hw, high, ul+(40+1)*hw, high, ll+(40+1)*lw, low, ll+40*lw, low);
  rect(ll+40*lw, low, lw, kh);

      // Capture the background image updated with colored keys
  updated = get();
}

//Create trigger effect from clicking on the coloured keys on the picture
void mousePressed() {
    // Initialize a tester
    color testcolor = 0;
    // Capture the color at mouse position
    testcolor = updated.get(mouseX, mouseY); // Get the color in the image
    // Play the corresponding sound sample (when the Nth color is clicked, it plays the Nth sample)
    for (int j = 0; j < soundsamples.length; j++) {
      if(testcolor == palette_spectrum[j]) { 
            soundsamples[j].trigger(); }
    }   
}

// Create triggers with keys from the keyboard
void keyPressed() {
  // You can use the square keys of the computer keyboard as the ones of a piano. (from '²' to 'C/c').
  if (key == '²') soundsamples[0].trigger(); // No capital version
  if (key == '1' || key == '&') soundsamples[1].trigger();
  if (key == '2' || key == 'é') soundsamples[2].trigger();
  if (key == '3' || key == '"') soundsamples[3].trigger();
  if (key == '4') soundsamples[4].trigger(); // Impossible to code... :(
  if (key == '5' || key == '(') soundsamples[5].trigger();
  if (key == '6' || key == '-') soundsamples[6].trigger();
  if (key == '7' || key == 'è') soundsamples[7].trigger();
  if (key == '8' || key == '_') soundsamples[8].trigger();
  if (key == '9' || key == 'ç') soundsamples[9].trigger();
  if (key == '0' || key == 'à') soundsamples[10].trigger();
  if (key == '°' || key == ')') soundsamples[11].trigger();
  if (key == '+' || key == '=') soundsamples[12].trigger();  
  if (key == 'A' || key == 'a') soundsamples[13].trigger(); 
  if (key == 'Z' || key == 'z') soundsamples[14].trigger(); 
  if (key == 'E' || key == 'e') soundsamples[15].trigger(); 
  if (key == 'R' || key == 'r') soundsamples[16].trigger(); 
  if (key == 'T' || key == 't') soundsamples[17].trigger(); 
  if (key == 'Y' || key == 'y') soundsamples[18].trigger(); 
  if (key == 'U' || key == 'u') soundsamples[19].trigger(); 
  if (key == 'I' || key == 'i') soundsamples[20].trigger(); 
  if (key == 'O' || key == 'o') soundsamples[21].trigger(); 
  if (key == 'P' || key == 'p') soundsamples[22].trigger(); 
  if (key == '¨' || key == '^') soundsamples[23].trigger(); 
  if (key == '£' || key == '$') soundsamples[24].trigger(); 
  if (key == 'Q' || key == 'q') soundsamples[25].trigger(); 
  if (key == 'S' || key == 's') soundsamples[26].trigger(); 
  if (key == 'D' || key == 'd') soundsamples[27].trigger(); 
  if (key == 'F' || key == 'f') soundsamples[28].trigger(); 
  if (key == 'G' || key == 'g') soundsamples[29].trigger(); 
  if (key == 'H' || key == 'h') soundsamples[30].trigger(); 
  if (key == 'J' || key == 'j') soundsamples[31].trigger(); 
  if (key == 'K' || key == 'k') soundsamples[32].trigger(); 
  if (key == 'L' || key == 'l') soundsamples[33].trigger(); 
  if (key == 'M' || key == 'm') soundsamples[34].trigger(); 
  if (key == '%' || key == 'ù') soundsamples[35].trigger();   
  if (key == 'µ' || key == '*') soundsamples[36].trigger();   
  if (key == '<' || key == '<') soundsamples[37].trigger();   
  if (key == 'W' || key == 'w') soundsamples[38].trigger();   
  if (key == 'X' || key == 'x') soundsamples[39].trigger();   
  if (key == 'C' || key == 'c') soundsamples[40].trigger(); 
}

