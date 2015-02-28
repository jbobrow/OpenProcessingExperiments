
//Osama Bush Laden
//Like the search for WMDs, ultimately pointless
//Click to see the picture and the scanning
//Move the mouse right to speed up, left to slow down

PImage bushladen;

int[] bushPixels = new int[258*315];
int direction = 1;
float speed = 0.2;
float speedAdjuster = 0.02;

float signal;

float oldMouseX = 0.0;

void setup(){
  stroke(255);
  bushladen = loadImage("bushladen.jpg");
  size(bushladen.width, bushladen.height); //258x315

  for(int i=0; i<width*height; i++) {
    bushPixels[i] = bushladen.pixels[i];
  }
}

void draw(){
  //If the scanning line goes off the screen, send it in the opposite direction
  if (signal > width-1 || signal < 0) {
    direction = direction * -1;
  }

  if(mouseX>oldMouseX){
    speed = speed + speedAdjuster;
  }
  if(mouseX<oldMouseX){
    speed = speed - speedAdjuster;
  }
  
  loadPixels();

  if(mousePressed) {//Show the Picture
    for (int i=0; i<width*height; i++){
      pixels[i] = bushPixels[i];
    }
    line(0, signal, width, signal);//Show the scanning line
  }
  else{//Show the pixel display
    if(signal<0) {
      signal = 0;
    }
    for(int i=0;i<width*height;i++) {
      pixels[i] = bushPixels[int((width*int(signal))+(i%width))];
    }
  }
  
  updatePixels();

  signal += (speed*direction);//Move the scanning line
  oldMouseX = mouseX;
}

