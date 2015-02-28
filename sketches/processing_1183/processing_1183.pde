
/**
<p>Font-dependant feedback loop. Click to toggle color. The internal representation of the screen is printed to the screen. A fractal pattern emerges from the font chosen for printing.</p>
<p>Originally written for the <a href="http://en.wikipedia.org/wiki/Handyboard">Handyboard</a> using Interactive C. I used the knob to peek() at different locations in memory (see <a href="check-memory.ic">code</a>), finding rapidly changing odd characters in some memory regions (see <a href="feedback.mov">video</a>).</p>
<p>I'm guessing it's either printing:</p>
<ol>
 <li>the display buffer</li>
 <li>the timer</li>
</ol>
<p>This applet implements the first possibility. Right now it runs off brightness information rather than the hex representation directly, it's easier to see the fractal pattern in an <a href="equilibrium.png">earlier version</a>.</p>
*/

PFont font;
int fontHeight = 6;
int fontWidth = 4;

int digits = 2;
int chunksWide = 120 * 2 / 3;
int chunksHigh = 90 * 2 / 3;

boolean colors = false;

void setup() {
  frameRate(30);
  //size(chunksWide * fontWidth * digits, chunksHigh * fontHeight);
  size(640, 360);
  colorMode(HSB, 1);
  
  font = loadFont("ShakaGraphics-8.vlw");
  textFont(font, 8);
  
  fill(0);
  noStroke();
  background(1);
}

void draw() {
  loadPixels();
  
  int[] pixelsCopy = new int[pixels.length];
  arraycopy(pixels, pixelsCopy);
  
  fill(0,0,1,.3);
  rect(0,0,width,height);
  
  for(int i = 0; i < chunksHigh; i++) {
    for(int j = 0; j < chunksWide; j++) {
      String next = hex((int) (brightness(pixelsCopy[j + i * width]) * 255), 2);
      String str = "";
      str += (char) (next.charAt(0) + (int) map(mouseX, 0, width, -37, 55));
      str += (char) (next.charAt(1) + (int) map(mouseY, 0, height, -37, 55));
      fill(0);
      if(colors)
        fill(random(.1) + (random(1) > 0.5 ? 0 : .5), random(.1) + .5, .6);
      else
        fill(0);
      text(str, j * digits * fontWidth, fontHeight * (i + 1));
    }
  }
}

void mousePressed() {
  colors = colors ? false : true;
}

