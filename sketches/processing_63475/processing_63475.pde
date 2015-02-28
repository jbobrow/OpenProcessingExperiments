
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/973*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**
 * Video Feedback Simulation by Rick Reed.<p>
 * 
 * Move Mouse to paint white dots, click to paint black dots.<br>
 * "a" spins left, "s" spins right, "z" zooms back, "x" zooms in, "u", "d", "l", and "r" moves image around. 
 * 
 */
int ox, oy; //stores old position for drawing line to new position if nessessary.


int r = 0; //keeps track of the rotation angle
int trlc = 0; //used to translate left and right to keep image centered
int tudc = 0;  //used to translate up and down to keep image centered

int trl = 0; //used to translate left and right, this acts wacky due to rotation
int tud = 0;  //used to translate up and down, this acts wacky due to rotation

int sc = 5; //keeps track of the amount to scale the image each draw cycle

float rx; //used to calculate trlc and tud
float ry; //used to calculate trlc and tud

void setup() {
  size(600, 600);
  //smooth(); //can't decide if I like it better with or without
  fill(0,1);
  strokeWeight(10);
  stroke(255);
  background(0);
  frameRate(100);
}


void draw() {

  if(mousePressed) {    
   stroke(0);
  } else {
   stroke(255);
  }
  
  line(ox, oy, mouseX, mouseY);
  
  ox = mouseX;
  oy = mouseY;
  PImage img = createImage(width, height, ARGB);  
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {//copy the image to img
     img.pixels[i] = pixels[i];
  }

if(keyPressed) { //handle some user input
    if(key == 'u') {
      tud = tud - 1; 
    } else if(key == 'd') {
      tud = tud + 1;      
    } else if(key == 'l') {
      trl = trl - 1; 
    } else if(key == 'r') {
      trl = trl + 1;      
    } else if(key == 'a') {
      r = r - 1; 
    } else if(key == 's') {
      r = r + 1;      
    } else if(key == 'z') {
      sc = sc + 1;      
    } else if(key == 'x') {
      sc = sc - 1;      
    }
}

  float th = TWO_PI - ((r / 180.0) * PI);
  float cx = width / 2.0;
  float cy = height / 2.0;
  
  rx = (cos(th) * cx) - (sin(th) * cy);
  ry = (sin(th) * cx) + (cos(th) * cy);
  
  rotate((r / 180.0) * PI);

  trlc = (int) (rx + cx);
  tudc = (int) (ry + cy);

  translate(trlc - width + trl,tudc - height + tud); 
  image(img, sc, sc, img.width - (2 * sc), img.height - (2 * sc));

}


