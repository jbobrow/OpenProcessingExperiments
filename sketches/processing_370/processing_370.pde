
/*

 clock : four sixteen : by seejayjames
 
 uses three values for "seconds, minutes, hours", starting when sketch starts.
 seconds length chosen at random; minutes and hours are even multiples of previous (2-16),
 also chosen at random. so the overall hour length or pulse -- the light blue circle --
 can be anywhere from a half second (if values are 125 ms * 2 * 2)
 to about 4 minutes (1000 ms * 16 * 16 = 256 seconds).
 
 The mouse sets the new origin and randomizes these multiples;
 key "m" changes the multiples only;
 key "x" clears the screen.
 
 it's a gradual evolution of the image based upon these values and the mouse placement,
 and a low alpha level of each so that the redraw keeps adding color.
 
 enjoy...you won't know what the real time is, but then again,
 a break from knowing that is nice, right? ;)
 
 */



int frac_current; // fastest of the three
int frac_mod=1000;
float frac_size;
float frac_stroke_hue=0;
float frac_stroke_sat=30;
float frac_stroke_bright=180;
float frac_stroke_alpha=10;

int secs_current; // middle
int secs_mod=8000;
float secs_size;
float secs_stroke_hue=270;
float secs_stroke_sat=300;
float secs_stroke_bright=180;
float secs_stroke_alpha=15;

int mins_current; // longest
int mins_mod=32000;
float mins_size;
float mins_x;
float mins_y;
float mins_stroke_hue=200;
float mins_stroke_sat=300;
float mins_stroke_bright=150;
float mins_stroke_alpha=15;


void setup() {
  size(900,600); // can change, everything is relative to this
  mins_x=width/2;
  mins_y=height/2;
  frameRate(30);
  colorMode(HSB,360); // circle-style numbers
  strokeWeight(1);
  noFill();
  smooth();
  background(0);

}

void draw() {

  // use modulus to provide the repeating time cycles
  frac_current=millis() % frac_mod;
  secs_current=millis() % secs_mod;
  mins_current=millis() % mins_mod;

  // map these values to circle sizes
  frac_size=map(frac_current,0,frac_mod,0,width*0.7);
  secs_size=map(secs_current,0,secs_mod,0,width*0.85);
  mins_size=map(mins_current,0,mins_mod,0,width*0.85);

  refresh();

}

void refresh() {

  stroke(mins_stroke_hue,mins_stroke_sat,mins_stroke_bright,mins_stroke_alpha);
  ellipse(mins_x,mins_y,mins_size,mins_size);
  // longest one :: starts at mouse location

  stroke(secs_stroke_hue,secs_stroke_sat,secs_stroke_bright,secs_stroke_alpha);
  ellipse(width-mins_x,height-mins_y,secs_size,secs_size);
  // middle one :: opposite from mins, for balance of overall image

  stroke(frac_stroke_hue,frac_stroke_sat,frac_stroke_bright,frac_stroke_alpha);
  ellipse(mouseX,mouseY,frac_size,frac_size);
  // fastest one :: always at mouse location

}

void mousePressed() {
  new_mods();
  mins_x=mouseX;
  mins_y=mouseY;
}

void keyPressed() {
  if(key=='x') {
    background(0);
  }
  if(key=='m') {
    new_mods();
  }

}


void new_mods() { // Set new values for time cycles

  frac_mod=int(random(125,1000));
  secs_mod=int(random(1,8)) * 2 * frac_mod;
  mins_mod=int(random(1,8)) * 2 * secs_mod;
  println("Mods : " + " " + frac_mod + " " + secs_mod + " " + mins_mod);

}

// ----------------------------------------------------------
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

