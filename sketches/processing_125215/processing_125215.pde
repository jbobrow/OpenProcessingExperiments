
//tablet functionality library. all credits to Andres Colubri @ www.interfaze.info
import codeanticode.tablet.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//setting global variables
int brush_size = 1;
int h = 720;
int w = 1280;
//cr, cg and cb are the color variables, changeable by keyboard keys, respectively,
// H/U, J/I, and K/O, for up/down changes
int cr = 0;
int cg = cr;
int cb = cg;
int alpha = 255;
boolean display = false;
boolean tabletM = false;
boolean squareM, triangleM, circleM, lineM;
PImage temp_bg;
PImage logo;
PFont menu_font;
//max_brush defines the maximum brush size, which in turn depends on the
//size of the output window, so as to never have a brush that is too large
//for a small output window. In this program, the window has a size of 1280x720,
//but that can be changed easily by whoever wants to, mantaining the relative size
//of the maximum brush and the area of the window. This mathematical mrelation was arbitratily chosen.
int max_brush = int(25*4*sqrt(h*w/(1280*720)));

//audio stuff
Minim       minim;
AudioOutput out;
Oscil       wave;

//tablet stuff
Tablet tablet;

//framerate is set to higher value so that, given a better computer, the drawn lines
//will be smoother
void setup() {
  size(1280, 720);
  background(#FFE9A5);
  frameRate(120);
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil(2200, 0.5, Waves.TRIANGLE);
  wave.patch(out);
  out.setGain(-80);
  lineM = true;
  squareM = false;
  triangleM = false;
  circleM = false;  
  tablet = new Tablet(this);
  logo = loadImage("logo.png");
}

void draw() {
  //clicking creates a point, holding and dragging creates a line
  if (!display && mousePressed && lineM) {
    println(freq);
    if (!tabletM) //if there is no tablet input, just use the brush_size
      strokeWeight(brush_size);
    else
      strokeWeight(brush_size*tablet.getPressure());
    stroke(cr, cg, cb);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }

  //The screen is divided equally in three consecutive octaves, ranging from 125 to 1000Hz.
  //Each octave, however, sets only the interval of frequencies possible there.
  //The actual note played will depend on the values of R, G and B chosen by the user.
  //RGB values may be represented as points on a three-dimensional Cartesian plot in which X=R, G=Y and B=Z.
  //So pure blue would be point (0,0,255), and pure red would be (255,0,0). Yellow would be (255,255,0), while purple would be (255,0,255).
  //The frequency is mapped 
  //frequency of the wave is mapped to mouseY, lower in the screen means lower frequency
  //higher means higher frequency
  //float freq = map(mouseY, 0, h, 770, 60);
  float freq = 0;
  if (lineM)
    freq = map(mouseY, 0, h, 1000, 125);
  else {
    if (mouseY <= height/3) {
      freq = map(sqrt(cr*cr+cg*cg+cb*cb), 0, 255, 249, 125);
    }
    else if (mouseY > height/3  && mouseY < 2*height/3) {
      freq = map(sqrt(cr*cr+cg*cg+cb*cb), 0, 255, 499, 250);
    }
    else if (mouseY >= 2*height/3) {
      freq = map(sqrt(cr*cr+cg*cg+cb*cb), 0, 255, 1000, 500);
    }    
  }    
  wave.setFrequency(freq);

  //panning is mapped to mouseX
  float pan = map(mouseX, 0, w, -1.0, 1.0);
  out.setPan(pan);
}

void mousePressed() {
  if (!display) {
    if (squareM) {
      playSound(100, 300);
      fill(cr, cg, cb, alpha);
      noStroke();
      pushMatrix();
      translate(mouseX, mouseY); 
      rotate(random(0, TAU));
      rect(-brush_size/2, -brush_size/2, brush_size, brush_size);
      popMatrix();
    }
    else if (triangleM) {
      playSound(100, 300);
      fill(cr, cg, cb, alpha);
      noStroke();
      pushMatrix();
      translate(mouseX, mouseY); 
      rotate(random(0, TAU));
      triangle(0, 0-2*(brush_size*sqrt(3)/2)/3, 0-(brush_size/2), 0+((brush_size*sqrt(3)/2)/3), 0+(brush_size/2), 0+((brush_size*sqrt(3)/2)/3) );
      popMatrix();
    }
    else if (circleM) {
      playSound(100, 300);
      fill(cr, cg, cb, alpha);
      noStroke();
      ellipse(mouseX, mouseY, brush_size, brush_size);
    }
    else if (lineM)
      //as you draw a line, sound fades in
      out.shiftGain(out.getGain(), map(brush_size, 0, 100, 0.01, 2.5), 100);
  }
}

void mouseDragged() {
}

void mouseReleased() {
  //releasing the mouse fades sound out
  if (lineM)
    out.shiftGain(out.getGain(), -80, 2000);
}  

//fade in and out for clicking brushes
void playSound(int fadeIn, int fadeOut) {
  int map_alpha = int(map(alpha, 0, 255, 0, 100));
  int now = millis();
  int has_faded_in = now + fadeIn;
  float goalGain = map(brush_size+map_alpha/2, 0, 100, -30, 5);
  out.shiftGain(out.getGain(), goalGain, fadeIn);
  while (millis () < has_faded_in);
  out.shiftGain(goalGain, -80, fadeOut);
}

//displays the "menu" or info screen
void showDisplay() {
  //reloads original background, in case this function was called inside during the process of changing one of the variables it displays
  imageMode(CORNER);
  image(temp_bg, 0, 0);
  //darkens the screen
  noStroke();
  fill(0, 0, 0, 255*0.6);
  rect(0, 0, w, h);
  //displays menu text and logo
  logo.resize(0, 300);
  imageMode(CENTER);
  image(logo, w/2, 100);
  menu_font = loadFont("chalet.vlw");
  textFont(menu_font);
  textAlign(CENTER, CENTER);
  textSize(21);
  fill(255, 255, 255);
  String tabletOnOff;
  if (tabletM)
    tabletOnOff = "ON";
  else
    tabletOnOff = "OFF";
  String s = "MENU\n Red: " + cr + "\nGreen: " + cg + "\nBlue: " + cb + "\n Alpha: " + alpha + "\nBrush: " + brush_size + " / " + max_brush + "\nTablet: "+tabletOnOff+"\n____\nINSTRUCTIONS:\nQ for Line, W for Square,\nE for Circle and R for Triangle.\nS for screen capture.\nV is random mode. T for Tablet. ";
  pushMatrix();
  translate(0, 150);
  text(s, w/2, h/3-50);
  strokeWeight(1);
  stroke(#ffffff);
  //these if statements display the current type of brush, as well as its size and color
  if (lineM) {
    fill(cr, cg, cb);
    strokeWeight(brush_size);
    stroke(cr, cg, cb);
    line(w/2-20, 5*h/8-20, w/2+20, 5*h/8+20);
  }
  else if (squareM) {
    fill(cr, cg, cb, alpha);
    rect(w/2-brush_size/2, 5*h/8-brush_size/2, brush_size, brush_size);
  }
  else if (circleM) {
    fill(cr, cg, cb, alpha);
    ellipse(w/2, 5*h/8, brush_size, brush_size);
  }
  else if (triangleM) {
    fill(cr, cg, cb, alpha);
    triangle(w/2-brush_size/2, 5*h/8+brush_size*sqrt(3)/6, w/2, 5*h/8-brush_size*sqrt(3)/3, w/2+brush_size/2, 5*h/8+brush_size*sqrt(3)/6);
  }
  popMatrix();
}

void keyPressed() {
  //s or S creates a screenshot
  if (key == 's' || key == 'S')
    saveFrame("screenshot-###.png");

  //Red, Green and Blue selectors
  //They usually increment or decrement five units at a time, unless they are 15 units close to their limits,
  // in which case they are changed one unit at a time.
  if ((key == 'u' || key == 'U') && cr < 255) {
    if (cr > 240)
      cr++;
    else 
      cr += 5;
    if (display)
      showDisplay();
  }
  if ((key == 'h' || key == 'H') && cr >= 5) {
    cr -= 5;
    if (display)
      showDisplay();
  }
  if ((key == 'i' || key == 'I') && cg < 255) {
    cg += 5;
    if (display)
      showDisplay();
  }
  if ((key == 'j' || key == 'J') && cg >= 5) {
    cg -= 5;
    if (display)
      showDisplay();
  }
  if ((key == 'o' || key == 'O') && cb < 255) {
    cb += 5;
    if (display)
      showDisplay();
  }
  if ((key == 'k' || key == 'K') && cb >= 5) {
    cb -= 5;      
    if (display)
      showDisplay();
  }
  //random mode!
  if (key == 'v' || key == 'V') {
    cr = int(random(0, 255));
    cg = int(random(0, 255));
    cb = int(random(0, 255));
    brush_size = int(random(0, max_brush));
    alpha = int(random(1, 255));
    if (display)
      showDisplay();
  }    

  //d or D hides or shows the display.
  if (key == 'd' || key == 'D') {
    if (!display) {
      temp_bg = get();
      display = true;
      showDisplay();
    }
    else {
      imageMode(CORNER);
      image(temp_bg, 0, 0);
      display = false;
    }
  }

  //c or C clears the screen  
  if (key == 'c' || key == 'C')
    background(#FFE9A5);

  //tablet mode on/off
  if (key == 't' || key == 'T') {
    if (tabletM) {
      tabletM = false;
      if (display)
        showDisplay();
    }
    else {
      tabletM = true;
      if (display)
        showDisplay();
    }
  } 

  //line mode
  if (key == 'q' || key == 'Q') {
    lineM = true;
    squareM = false;
    triangleM = false;
    circleM = false;
    if (display)
      showDisplay();
    wave.setWaveform(Waves.SINE);
  }

  //square mode
  if (key == 'w' || key == 'W') {
    wave.setWaveform(Waves.SQUARE);
    lineM = false;
    squareM = true;
    triangleM = false;
    circleM = false;
    if (display)
      showDisplay();
  }

  //circle mode
  if (key == 'e' || key == 'E') {
    wave.setWaveform(Waves.SAW);
    lineM = false;
    squareM = false;
    triangleM = false;
    circleM = true;
    if (display)
      showDisplay();
  }

  //triangle mode
  if (key == 'r' || key == 'R') {
    wave.setWaveform(Waves.TRIANGLE);
    lineM = false;
    squareM = false;
    triangleM = true;
    circleM = false;
    if (display)
      showDisplay();
  }

  if (key == CODED) {
    //UP or DOWN arrows change brush size
    if (keyCode == UP && brush_size < max_brush) {
      brush_size++;
      if (display)
        showDisplay();
    } 
    else if (keyCode == DOWN && brush_size > 1) {
      brush_size--;
      if (display)
        showDisplay();
    }
    //LEFT and RIGHT keys change the alpha channel of colors
    else if (keyCode == RIGHT && alpha < 255) {
      alpha += 5;
      if (display)
        showDisplay();
    } 
    else if (keyCode == LEFT && alpha >= 5) {
      alpha -= 5;
      if (display)
        showDisplay();
    }
  }
}


