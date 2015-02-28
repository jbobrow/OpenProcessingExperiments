
/*frame rate independent oscillator!
This only works at frequencies that are lower than the frame rate
remember sin(angle in radians) = something between -1 and 1, depending on angle
we can take the product of sin() and multiply it to be the right scale for our animation!
Jack Perkins, 2009, jackaperkins BATS! gmail.com */

float wave; // our variable for keeping track of current wave position (goes from 0-2PI)
float freq; // desired frequency, used to figure out how much to increment wave by

void setup(){
  size(300,300);
  wave=0;
  freq=0.23;
  frameRate(30); //my favorite is 9997
}

void draw(){
  background(255); // hurrrr durrrr

  //incrementing wave
  if (wave+hz(freq)>2*PI) { //if the new wave will be over 2PI ...
    wave=(wave+hz(freq)-2*PI); //then roll it over 
  } else {
    wave+=hz(freq); //otherwise just add the increment to wave
  }
  
  line(50,45,100,45); //draw top and bottom lines
  line(50,255,100,255);
  
  //draw our moving line based on the sin() of wave
  line(50,150+100*sin(wave),100,150+100*sin(wave));  //multiply the product of sin() by how many pixels we want it to sway
}


//figuring out our increment value per frame
float hz(float x) { //take in our desired freq as X
  return((2*PI*x)/frameRate); //2PI is one complete cycle, so multiply by freq and divide by frame
}


// increase or decrese frequency, bugs out if you go over 1hz per frame!
void keyPressed() {
  if (key=='='){
     freq=freq*1.3;
  } else if (key=='-'){
    freq=freq/1.3;
  }
}



