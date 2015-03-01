
/**
 * Peace, Perfect Peace. 
 * by Matt Perkins. 
 * 
 * This sketch combines a sleeping face drawn with simple lines along with the outside world 
 * of wonder built up from ellipses and color palettes plotted via randomness and parametric 
 * equations.  The decaying parametric equations give the swirling circular effect. 
 * I was going for this feeling of calm amongst a brilliant array of life going on around
 * the sleeper.
 */
 
int loopCount = 0;
color[] colors;
int r = 0;
int g = 0;
int b = 0;
int currentColorIndex=0;
int circleLimiter=50;

void setup() {
  size(1024, 768);
  colorMode(RGB);
  background(255,255,255);
  smooth();
  frameRate(960);
  colors = new color[6];
  colors[0] = color(0,0,0);
  colors[1] = color(240,6,2);
  colors[2] = color(6,2,240);
  colors[3] = color(6,240,2);
  colors[4] = color(6,240,240);
  colors[5] = color(240,240,2);
  drawFace(); 
}

void drawFace() {
 
  line(0, 490, width, 490); //top
  line(400, 0, 400, height);  //down right
  line(360, 0, 360, height);  //down left
  line(385, 555, 400, 555);  //nose
  line(375, 560, 400, 560);  //mouth
  
  line(360, 535, 370, 535); //left eye right
  line(370, 490, 370, 535); //left eye down
  
  line(361, 535, 361, 538);  //lashes
  line(363, 535, 363, 538);
  line(366, 535, 366, 538);
  line(369, 535, 369, 538);

  line(400, 535, 405, 535); //right eye right
  line(405, 490, 405, 535); //right eye down
  
  line(401, 535, 401, 538);  //lashes
  line(404, 535, 404, 538);
  
}

void draw() {
  float noise = random(-20,20);
  float factor = map(loopCount, 0, 1000, 0, 10);
  float x = (float) ((Math.sin(loopCount+noise)*height/factor) + height/2);
  float y = (float) ((Math.cos(loopCount+noise)*width/factor) + width/2);
  fill(r+noise,g+noise,b+noise, random(55));
  drawBubble(x, y,2+(noise/(factor/circleLimiter)),random((noise/(factor/circleLimiter))));
  
  loopCount++;
  if (loopCount > 1000) {
    loopCount=0;
    currentColorIndex++;
    circleLimiter=circleLimiter-5;
    if (circleLimiter <=0) {
      circleLimiter=50;
    }
    r = (int) red(colors[currentColorIndex % colors.length]);
    g = (int) green(colors[currentColorIndex % colors.length]);
    b = (int) blue(colors[currentColorIndex % colors.length]);
  }
}

void drawBubble(float x, float y, float w, float h) {
  float h_r = h/2;
  float w_r = w/2;
  int num = random(15,75);
  for (float t=0; t< num; t++) {
    float x_t = (float) (Math.cos((t/num)*2*PI)*w_r) + x;
    float y_t = (float) (Math.sin((t/num)*2*PI)*h_r) + y;
    ellipse(x_t, y_t, 5, 5);
  }
  ellipse(x, y, w, h);
   
}

