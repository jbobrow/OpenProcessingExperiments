
//Pedro Veneziano, March 17th, Creative Computing B, Benjamin Bacon

//I decided to make one big assignment out of two, so I could figure out how to create figures 
//keeping track of their parameters and adding a different vibration to each, in order to
//create some depth of field. Hope that`s fine!

/* @pjs preload= "bg.png"; */

PImage bg;
int[] posx = new int[1000];
int[] posy = new int[1000];
int[] px = new int[1000];
int[] py = new int[1000];
int[] cor = new int[1000];
int[] raio = new int[1000];
int[]vib = new int[1000];
int i = 0;
int time = 0;

void setup() {
  size(700,700);
  smooth();
  bg = loadImage("bg.png");
  noStroke();
  posx[0] = 1000;
  posy[0] = 1000;
  cor[0] = 0;
  raio[0] = 5;
  vib[0] = 0;
}

void draw() {
  background(255,80,80);
  image(bg, 0, 0);
  float far = dist(mouseX, mouseY, width/2, height/2);
  int col = round(map(far, 0, 495, 120, 0));
  int ray = round(map(far, 0, 495, 15, 180));
  for(int a = 0; a <= i; a += 1) {
    fill(cor[a]);
    ellipse(posx[a] + random(-vib[a], vib[a]), posy[a]+ random(-vib[a], vib[a]), raio[a], raio[a]);
  }
}

void mousePressed() {
  i = i + 1;
  float far = dist(mouseX, mouseY, width/2, height/2);
  posx[i] = mouseX;
  posy[i] = mouseY;
  px[i] = mouseX;
  py[i] = mouseY;
  cor[i] = round(map(far, 0, 495, 120, 0));
  raio[i] = round(map(far, 0, 495, 15, 180));
  vib[i] = round(map(far, 0, 495, 1, 4));
}
