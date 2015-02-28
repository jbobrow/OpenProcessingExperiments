
//import processing.opengl.*;
import processing.serial.*;
Serial port;
String buff = "";
int xval = 0, yval = 0, zval = 0, oldxval =0, oldyval=0, oldzval=0;
int NEWLINE = 10;
int n;

PImage[] images = new PImage[25];

// images per row
int imgrow = 6;

int timer;

// size of thumbs
int t_width = 200;
int t_height = 120;

// counter for the selected image
int selectedimg = 0;

void setup() {

  //  port = new Serial(this, Serial.list()[1], 9600);
  size(1200,800);
  //   loading images






  File checkthumbs = new File(dataPath("pictures/thumbs/" + (images.length-1) + "_thumb.jpg"));
  if (!checkthumbs.exists()) {
    for (int i = 0; i < images.length; i++) { 
      images[i] = loadImage("pictures/"+i+".jpg");
      images[i].resize(200, 120);
      images[i].save(dataPath("pictures/thumbs/" + i +"_thumb.jpg"));
    }
  }
  else {
    for (int i = 0; i < images.length; i++) { 
      images[i] = loadImage("pictures/thumbs/"+i+"_thumb.jpg");
    }
  }
}

void draw() {
  timer++;

  //  while (port.available() > 0) {
  //    serialEvent(port.read());
  //  }





  background(0);

  //oldxval=xval;
  //oldyval=yval;
  //oldzval=zval;

  for (int i = 0; i < images.length; i++) {
    display();

    //  arduino();
  }
}


void display () {



  for (int i = 0; i < images.length; i++) {

    // setting transparency for not-selected images
    tint(120, 50); 
    if (i == selectedimg) {
      // no tranparency for selected image
      noTint();
    }
    if (i < imgrow) {
      image(images[i],i*200,0,200,120);
    }
    else if (i >= imgrow && i < imgrow*2) {
      image(images[i],(i*200)-width,t_height,t_width,t_height);
    }
    else if (i >= imgrow*2 && i < imgrow*3) {
      image(images[i],(i*200)-width*2,t_height*2,t_width,t_height);
    }
    else if (i >= imgrow*3 && i < imgrow*4) {
      image(images[i],(i*200)-width*3,t_height*3,t_width,t_height);
    }
  }
}


void arduino() {
  if (timer > 10) {

    if (oldxval > 110) {
      selectedimg++;
    }

    if (oldxval < 50) {
      selectedimg--;
    }

    if (oldyval > 110) {
      selectedimg = selectedimg+imgrow;
    }
    if (oldyval < 50) {
      selectedimg = selectedimg-imgrow;
    }

    timer = 0;
  }
}

void keyPressed() {

  if (keyCode == RIGHT) {
    selectedimg++;
  }
  if (keyCode == LEFT) {
    selectedimg--;
  }
  if (keyCode == DOWN) {
    selectedimg = selectedimg+imgrow;
  }
  if (keyCode == UP) {
    selectedimg = selectedimg-imgrow;
  }
  if (selectedimg > images.length || selectedimg < 0) {
    selectedimg = 0;
  }
}



void serialEvent(int serial) 
{ 
  if(serial != NEWLINE) { 
    buff += char(serial);
  } 
  else {
    // The first character tells us which axis this value is for
    char c = buff.charAt(0);
    // Remove it from the string
    buff = buff.substring(1);
    // Discard the carriage return at the end of the buffer
    buff = buff.substring(0, buff.length()-1);
    // Parse the String into an integer
    if (c == 'X')
      xval = Integer.parseInt(buff)/4;
    else if (c == 'Y')
      yval = Integer.parseInt(buff)/4;
    else if (c == 'Z')
      zval = Integer.parseInt(buff)/4;
    // Clear the value of "buff"
    buff = "";
  }
}


