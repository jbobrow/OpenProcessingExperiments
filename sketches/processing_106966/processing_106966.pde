
color[] colors;
color[] copy;
int stripeWidth;

void setup() {
 size(700, 700);
 noStroke();
 frameRate(2);

 stripeWidth = width / 7; 
 colors      = new color[7];
 copy        = new color[7];
 colors[0]   = color(255, 255, 255); // White
 colors[1]   = color(255, 255, 0);   // Yellow
 colors[2]   = color(0, 255, 255);   // Cyan
 colors[3]   = color(0, 255, 0);     // Green
 colors[4]   = color(255, 0, 255);   // Magenta
 colors[5]   = color(255, 0, 0);     // Red
 colors[6]   = color(0, 0, 255);     // Blue
}

void draw() {
 background(0);
 
 for (int i = 0, j = colors.length; i < j; i++) {
  fill(colors[i]);
  rect(i * stripeWidth, 0, stripeWidth, height);
 } 
 
 for (int i = 0, j = colors.length; i < j; i++) copy[i]   = colors[(i + 1) % j];
 for (int i = 0, j = colors.length; i < j; i++) colors[i] = copy[i];
}
