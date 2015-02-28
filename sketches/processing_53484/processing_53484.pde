
float thetaX=0,thetaY=0,thetaZ=0;
boolean click=false;
int amount=0;
int vamount=0;
int direction=1;
int vdirection=1;
float alf=7;
color buffer[];
boolean inverted = false;
color background_color[] = {color(0),color(255,0,0)};
int bg_index = 0;

int REQUIRED_WIDTH = 512;
int REQUIRED_HEIGHT = 160;

void setup() {
  size(512,160,P3D);
  background(0);
  frameRate(8);
  
  buffer = new color[width*height];
}

void draw() {
  loadPixels();
  for(int i = 0; i < pixels.length; i++) {
    buffer[i] = color(((255-alf)/255.0)*red(pixels[i]) + (alf/255.0)*red(background_color[bg_index]),
                      ((255-alf)/255.0)*green(pixels[i]) + (alf/255.0)*green(background_color[bg_index]),
                      ((255-alf)/255.0)*blue(pixels[i]) + (alf/255.0)*blue(background_color[bg_index]),
                      255);
  }
  updatePixels();
  background(background_color[bg_index]);
  
  loadPixels();
  if(inverted)
    stroke(254,0,0);
  else
    stroke(1);
  strokeWeight(3);
  if(inverted)
    fill(1);
  else
    fill(254,0,0);
  amount+=(5*direction);
  vamount+=(1*vdirection);
  if(amount>=width/2 || amount<=-width/2) {
    inverted=!inverted;
    direction *= -1;
  }
  if(vamount>=height/2 - 90 || vamount<=-height/2 + 90) {
    vdirection *= -1;
  }
  pushMatrix();
  translate(width/2-amount,height/2-vamount);
  rotateY(thetaY);
  rotateX(thetaX);
  rotateZ(thetaZ);
  rectMode(CENTER);
  box(75,75,75);
  if(!click){
    thetaY+=.25;
    thetaX+=.5*5.0/6.0;
  }
  //println(red(background_color[bg_index]) + "," + green(background_color[bg_index]) + "," + blue(background_color[bg_index]));
  popMatrix();
  for(int i=0; i < pixels.length; i++) {
    if(red(pixels[i]) == red(background_color[bg_index]) &&
       green(pixels[i]) == green(background_color[bg_index]) &&
       blue(pixels[i]) == blue(background_color[bg_index])) {
         pixels[i] = buffer[i];
    }
  }
  updatePixels();
  
  if(amount>=width/2 || amount<=-width/2) {
    bg_index = (bg_index+1)%2;
  }
}

void mousePressed() {
  click=true;
}

void mouseDragged() {
  if(mouseY>=height/2) {
    thetaZ+=.01*float(pmouseX-mouseX);
  } else {
    thetaZ+=.01*float(mouseX-pmouseX);
  }
  if(mouseX>=width/2) {
    thetaZ+=.01*float(mouseY-pmouseY);
  } else {
    thetaZ+=.01*float(pmouseY-mouseY);
  }
}

void mouseReleased() {
  click=false;
}

