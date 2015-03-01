
ArrayList<Particle> particles;
int[] list;
int posX, posY;
PVector axis;
PFont font;
int count, max;
char typedKey = 'BB';

void setup() {
  colorMode(RGB,255,255,255);
  size(600,800);
  frameRate(30);
  noStroke();
  noCursor();
  font = createFont("FreeSansBold.ttf", 450);
  textFont(font);
  fill(0);
  count=0;
  max=550;
  textAlign(CENTER,CENTER);
  text(typedKey, width/2, height/2-70);
  list = new int[width*height];
  loadPixels();
  for(int y = 0; y<=height-1; y++){
    for(int x = 0; x<=width-1; x++){
      color pb = pixels[y*width+x];
      if(red(pb)<5){  list[y*width+x]=0;  }
      else {  list[y*width+x]=1;  }}}
  updatePixels();
  
  particles=new ArrayList<Particle>();
}

void draw() {
   if(count<max){
    int i=0;  while(i<3){
      axis = new PVector(int(random(100,width-100)),int(random(100,height-100)));
      if(list[int(axis.y*width+axis.x)]==0){
        particles.add(new Particle(axis.x,axis.y));
        i++;
        count++;
      }
    }
  }
  background(#FFFAF5);
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    fill(#000000);
    p.display();
    p.update();
  }
  for (int j = 0; j < particles.size(); j++) {
    Particle p = particles.get(j);
    fill(#FFFAF5);
    p.display2();
    p.update();
  }
}

void keyReleased(){
      if (key != CODED && key != ' ' && key != TAB && key != ENTER && key != RETURN) {
      background(#FFFFFF);
      typedKey = key;
      setup();
    }
}
class Particle {
  PVector location;
  PVector velocity;
  float scale;
  int radius;

  Particle(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector(random(1),random(1));
    scale=random(.35,.9);
    radius=int(scale*40);
  }

  void update() {
    location.add(velocity);
    if ((list[int(location.y)*width+int(location.x+velocity.x)]==1)   ||   (list[int(location.y)*width+int(location.x-velocity.x)]==1)) {  velocity.x *= -1;  }
    if ((list[int(location.y+velocity.y)*width+int(location.x)]==1) || (list[int(location.y-velocity.y)*width+int(location.x)]==1)) {  velocity.y *= -1;  }
  }

  void display() {
    ellipse(location.x,location.y,radius,radius);
  }
  
  void display2() {
    ellipse(location.x,location.y,radius-10,radius-10);
  }
}


