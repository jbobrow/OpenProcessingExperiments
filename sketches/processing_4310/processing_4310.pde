
PImage a;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
int[][] aPixels;
int res = 4;

String[] images = {"1.jpg","dos.jpg","lil.jpg","mega.jpg","bomb.jpg","gal.jpg"};
int switchImage = 0;

void setup() 
{
  size(512, 384, P3D);
  noCursor();

  minim = new Minim(this);
  player = minim.loadFile("atari.mp3", 2048);
  player.play();

  aPixels = new int[width][height];
  a = loadImage(images[switchImage]);
  for(int i=0; i<height; i++) {
    for(int j=0; j<width; j++) {
      aPixels[j][i] = a.pixels[i*width+j];
    }
  }
}

void draw() 
{
  background(0);

 translate(width/2, height/1.8);
  // scale(0.6);

  rotateZ(HALF_PI/1);
  translate(-width/2.7, -height/1.5);


  for(int d = 0; d < player.bufferSize() - 0.1; d++)
    rotateX(-d/-1.5 + player.right.get(d)*13);

  for(int d = 0; d < player.bufferSize() - 0.1; d++)
    rotateY(-d/-1.5 + player.left.get(d)*13);


  for(int d = 0; d < player.bufferSize() - 0.1; d++)
    colorMode(RGB,random(200));



  float rr, gg, bb, tt;
  for(int i=0; i<height; i+=res) {
    for(int j=0; j<width; j+=res) {
      rr = red(aPixels[j][i]); 
      gg = green(aPixels[j][i]);
      bb = blue(aPixels[j][i]);
      tt = rr+gg+bb;
      stroke(rr, gg, bb);

      point(i/1, j/+1, gg/1);




    }
  }
}

void keyPressed() 




{
  if(key == 'q') {
    res = 4;
  } 
  else if (key == 'w') {
    res = 7; 
  } 
  else if (key == 'e') {
    res = 8;
  } 
  else if (key == 'r') {
    res = 9;
  } 
  else if (key == 't') {
    res = 10;
  }

  switch(key) {
  case '1': 
    switchImage = 0; 
    break;
  case '2': 
    switchImage = 1; 
    break;
  case '3': 
    switchImage = 2; 
    break;
  case '4': 
    switchImage = 3; 
    break;
  case '5': 
    switchImage = 4; 
    break;
  case '6': 
    switchImage = 5; 
    break;


  }

  setup();
}









