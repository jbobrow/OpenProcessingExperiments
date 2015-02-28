
 // blinking eye variables
import ddf.minim.*;
Minim minim;
AudioPlayer song;
float eye = 70;
float color1 = 35;
float color2 = 45;
float color3 = 65;
float color4 = 75;

void setup () {
  size(600,400);
  minim = new Minim(this);
  song = minim.loadFile("Nico_Vega_Beast.mp3");
}

void draw () {
  background(100, 20, 20);
  noStroke();
  smooth();
  fill(255);
  
  // Waveform when eyes close
  pushMatrix();
  
  translate(width/2, height/4);
  rotate(radians(frameCount % 360 * 2));
  
  for(int j = 0; j < 360; j++) { 
    if(song.mix.get(j)*200 > 50) {
      stroke(color1,100,100);
    } else {
      stroke(color2,100,100);
    }
    line(cos(j)*50, sin(j)*50, cos(j)*abs(song.left.get(j))*200 + cos(j)*50, sin(j)*abs(song.right.get(j))*200 + sin(j)*50);
  }

  for(int k = 360; k > 0; k--) {
    if(song.mix.get(k)*200 > 25) {
      stroke(color3,100,100);
    } else {
      stroke(color4,100,100);
    }
    line(cos(k)*50, sin(k)*50, cos(k)*abs(song.right.get(k))*200 + cos(k)*50, sin(k)*abs(song.left.get(k))*200 + sin(k)*50);  
  }
    
  popMatrix();
    
  // eyes left/right
  noStroke();
  ellipse(width/2-100, height/2, 100, eye);
  ellipse(width/2+100, height/2, 100, eye);
  
  // eye colour
  noStroke();
  fill(150,200,150);
  
  ellipse(width/2-100, height/2, 70, eye);
  ellipse(width/2+100, height/2, 70, eye);
 
  // -- MAPPING -- \\ 
  fill(0);
  noStroke();
  
  if(mousePressed) {
    eye = 0;
    // Closed eyes
    ellipse((width/2)+100, height/2, 100, 5);
    ellipse((width/2)-100, height/2, 100, 5);
    song.play();
  }
  
  if(!mousePressed) {
    eye = 70;
    // Right pupil
    float rightPupilX = map(mouseX, 0, width, (width/2)+85, (width/2)+115);
    float rightPupilY = map(mouseY, 0, width, (height/2)-15, (height/2)+30);
    ellipse (rightPupilX, rightPupilY, 20, 20);
    // Left pupil
    float leftPupilX = map(mouseX, 0, width, (width/2)-115, (width/2)-85);
    float leftPupilY = map(mouseY, 0, width, (height/2)-15, (height/2)+30);
    ellipse (leftPupilX, leftPupilY, 20, 20);
  }
   
  if(keyPressed) {
    song.pause();
  }
}
  


