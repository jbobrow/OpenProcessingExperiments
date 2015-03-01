
boolean[] keys;
int x = 400;
int y = 300;

void setup() {
  size(800,600);
  background(220,20,0);
  rect(100,100,600,400,10);
  ellipse(60,540,80,80);
  ellipse(740,540,80,80);
  frameRate(50);
  img = loadImage("licensedLogos_etch.gif");
  keys = new boolean[4];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
}

void draw() {
  image(img,260,-10);
  if (keys[0]) {
    y--;
  }
  if (keys[1]) {
    x--;
  }
  if (keys[2]) {
    y++;
  }
  if (keys[3]) {
    x++;
  }
  stroke(0);
  point(x,y);
}

void keyPressed(){
  if (key == 'w' || key == 'W' || keyCode == UP) {
    keys[0]=true;
  }
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    keys[1]=true;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    keys[2]=true;
  }
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    keys[3]=true;
  }
  if (key == ' '){
  setup();
  x = 400;
  y = 300;
  }
}
void keyReleased(){
  if (key == 'w' || key == 'W' || keyCode == UP) {
    keys[0]=false;
  }
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    keys[1]=false;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    keys[2]=false;
  }
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    keys[3]=false;
  }
}


