
// XText Scroller
// ------------ //
// @paulsobrien

// vars
String greeting =  "--- merry x-mas ---"; // seasons greetings!
int r = 128;
int g = 12;
int b = 4;
float _width = 640;
float _height = 280;
float theta = 0.017f;
float bobOffset = 0.33f;
float amplitude = 23.17f;
float thetaBounce = 0.073f;
float x, y, cx, cy, tx, ty, by;
float greetingScrollSpeed = 3.33f;
float greetingX, gMin, greetingLength, kerning;
float greetingY = 33f; // font baseline


// ----------------- //
//       SETUP
// ------------------//

void setup()
{
  size(_width, _height);
  background(r,g,b);
  frameRate(48);
  smooth(1);
  fill(0, 0, 0, 0);
  stroke(0, 0, 0, 0);
  cx = _width/2f;
  cy = _height/2f;
  greetingLength = greeting.length();
  // font kerning and x offsets, works best with monospace things
  kerning = _width / greetingLength * 0.33f;
  greetingX = ( (_width / greetingLength) * (greetingLength / kerning) );
  gMin = greetingLength * greetingX * -1f;
}


// ----------------- //
//       DRAW
// ------------------//
void draw()
{
 background(r,g,b);

 if (tx > gMin)
 {
   theta += thetaBounce;
   tx -= greetingScrollSpeed;
   ty = sin(theta) * amplitude;
 }
 else
 {
  tx = _width;
 }
 
 // draw text layers with funny offsets
 fill(90, 12, 4, 255); // shadow 
 showGreeting(tx + 2f, greetingY - 6.0f);
 
 fill(222, 222, 22, 164); // orangey
 showGreeting(tx - 7, greetingY + (ty / 8.0f));
 
 fill(255, 0, 22, 122); // red
 showGreeting(tx - 12f, greetingY + 1f);
}


// ----------------- //
//      METHODS
// ------------------//


void showGreeting(float x, float y)
{
 for (int i=0; i < greetingLength; i++)
 {
  Character c = greeting.charAt(i);
    
  // renders and animates the chars in the format  x, y, c  
  // where x is the font spaced out + translating along the screen right to left
  // where y is bobbing with each char bobbing sin -i plus the font and screen offsets
  // where c is our current character           // note: cy - y is just a font screen offset
    
  renderWords( (greetingX * i) + x, (ty * ( sin((-i * bobOffset) + theta)) + (cy - y) ), c );
 } 
}
void renderWords(float x, float y, Character c)        // render chars with custom vertex font
{
 if (c.equals("m"))
 {
  beginShape();
    vertex(x+0, y+0);    vertex(x+17, y+0);   vertex(x+27, y+18);   vertex(x+36, y+0);
    vertex(x+53, y+0);   vertex(x+55, y+71);  vertex(x+36, y+71);   vertex(x+36, y+35);
    vertex(x+27, y+54);  vertex(x+18, y+37);  vertex(x+18, y+71);   vertex(x+-2, y+71);
  endShape(CLOSE);
 }
 if (c.equals("e"))
 {
  beginShape();
    vertex(x+0, y+0);     vertex(x+51, y+0);   vertex(x+53, y+16);  vertex(x+16, y+16);
    vertex(x+16, y+27);   vertex(x+43, y+27);  vertex(x+44, y+44);  vertex(x+16, y+44);
    vertex(x+16, y+54);   vertex(x+53, y+53);  vertex(x+53, y+71);  vertex(x+-3, y+71);
  endShape(CLOSE);
 }
 if (c.equals("r"))
 {
  beginShape();
    vertex(x+0, y+0);     vertex(x+50, y+0);    vertex(x+52, y+53);  vertex(x+40, y+53); 
    vertex(x+54, y+71);   vertex(x+24, y+71);   vertex(x+17, y+62);  vertex(x+17, y+35); 
    vertex(x+35, y+35);   vertex(x+33, y+17);   vertex(x+17, y+17);  vertex(x+17, y+35);
    vertex(x+17, y+71);   vertex(x+0, y+71); 
  endShape(CLOSE);
 }
 if (c.equals("y"))
 {
  beginShape();
    vertex(x+0, y+0);    vertex(x+17, y+0);    vertex(x+26, y+17);    vertex(x+35, y+0);
    vertex(x+53, y+0);   vertex(x+35, y+34);   vertex(x+35, y+71);    vertex(x+17, y+71);
    vertex(x+17, y+34);
  endShape(CLOSE);
 }
 if (c.equals("x"))
 {
  beginShape();
    vertex(x+0, y+0);    vertex(x+17, y+0);    vertex(x+27, y+13);    vertex(x+36, y+0);
    vertex(x+53, y+0);   vertex(x+53, y+18);   vertex(x+41, y+36);    vertex(x+53, y+53);
    vertex(x+53, y+71);  vertex(x+36, y+71);   vertex(x+27, y+58);    vertex(x+17, y+71);
    vertex(x+1, y+71);   vertex(x+1, y+54);    vertex(x+13, y+36);    vertex(x+0, y+17);
  endShape(CLOSE);
 }
 if (c.equals("a"))
 {
  beginShape();
    vertex(x+1, y+0);     vertex(x+50, y+0);    vertex(x+53, y+71);   vertex(x+36, y+71);
    vertex(x+35, y+53);   vertex(x+17, y+53);   vertex(x+17, y+36);   vertex(x+35, y+36);
    vertex(x+36, y+18);   vertex(x+17, y+17);   vertex(x+17, y+71);   vertex(x+0, y+71);
  endShape(CLOSE);
 }
 if (c.equals("s"))
 {
  beginShape();
    vertex(x+17, y+0);    vertex(x+52, y+0);    vertex(x+53, y+17);   vertex(x+35, y+19);
    vertex(x+36, y+44);   vertex(x+34, y+71);   vertex(x+1, y+71);    vertex(x+0, y+54);
    vertex(x+17, y+55);   vertex(x+16, y+20);
  endShape(CLOSE);
 }
 if (c.equals("-"))
 {
  beginShape();
    vertex(x+10, y+25);  vertex(x+44, y+26);  vertex(x+44, y+43);  vertex(x+11, y+44);
  endShape(CLOSE);
 }
}
