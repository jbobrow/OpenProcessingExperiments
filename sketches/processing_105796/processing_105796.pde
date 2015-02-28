
int counter;
boolean[] keys = new boolean[4];
final int J = 0;
final int L = 1;
final int I = 2;
final int K = 3;

int x1 = 100;
int y1 = 100;
int x2 = 100;
int y2 = 110;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  for (int i = 0; i < keys.length; i++) {
    keys[i] = false;
  }
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(0,0,0);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
    rect(x1,y1,10,20);
    rect(x2,y2,30,10);
  if (keys[K] == true) {
    y1+=10;
    y2+=10;
    keys[K] = false;
  }
  
void keyPressed() {
  if (key == 'j') {
    keys[J] = true;
  } else if (key == 'l') {
    keys[L] = true;
  } else if (key == 'i') {
    keys[I] = true;
  } else if (key == 'k') {
    keys[K] = true;
  }
}

void keyReleased() {
  if(key == 'j') {
    keys[J] = false;
  } else if(key == 'l') {
    keys[L] = false;
  } else if(key == 'i') {
    keys[I] = false;
  } else if (key == 'k') {
    keys[K] = false;
  }
}

  
}
