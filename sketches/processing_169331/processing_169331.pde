
int count;
int[] list;
PImage letter;
PVector axis;
ArrayList<Tentacle> tentacles;
float noiseScale=3;
PFont font;
char typedKey = 'L';
int max;

void setup() {
  size (600,800);
  colorMode(HSB,360,100,100);
  background(#FFFAF5);
  frameRate(150);
  strokeWeight(0.1);
  stroke(#333333);
  tentacles= new ArrayList<Tentacle>();
  max=300;
  count=0;
  
  font = createFont("FreeSansBold.ttf", 450);
  textFont(font);
  fill(#000000);
  textAlign(CENTER,CENTER);
  text(typedKey, width/2, height/2-70);
  list = new int[width*height];
  loadPixels();
  for(int y = 0; y<=height-1; y++){
    for(int x = 0; x<=width-1; x++){
      color pb = pixels[y*width+x];
      if(red(pb)<5)  list[y*width+x]=0;  
      else  list[y*width+x]=1;  }}
  updatePixels();
  
  background(#FFFAF5);
  int i=0;
  while(i<20){
    axis = new PVector(random(100,width-100),random(100,height-100));
    if(list[int(axis.y)*width+int(axis.x)]==0){
      tentacles.add(new Tentacle(axis.x,axis.y));
      i++;
    }
  }
}

void draw(){
  strokeWeight(0.1);
  for(int i = 0; i < tentacles.size(); i+=1) {
    Tentacle t=tentacles.get(i);
    t.update();
    if(t.dead){
      tentacles.remove(i); 
      if(count++<max){
        int j=0;
        while(j<1){
          axis = new PVector(random(100,width-100),random(100,height-100));
          if(list[int(axis.y)*width+int(axis.x)]==0){
            tentacles.add(new Tentacle(axis.x,axis.y));
            j++;
          }
        }
      }
    }
  }
}

void keyReleased(){
      if (key != CODED && key != ' ' && key != TAB && key != ENTER && key != RETURN) {
      background(#FFFFFF);
      typedKey = key;
      setup();
    }
}
class Tentacle{
  float x,y;
  float radius;
  float decrease;
  boolean dead;
  float incx;
  float incy;
  float sat = 0;
  float bright = 91;
  
  Tentacle(float xx, float yy){
    x=xx;
    y=yy;
    radius = 15;
    incx = width/2+random(-100,100);
    incy = height/2+random(-100,100);
    decrease = random(-0.3, -0.02);
  } 
  
  void update(){
    fill(#FFFAF5);
    bright+=0.2;
    ellipse(x, y, radius, radius);
    radius = radius + decrease;
    incx = incx + 0.05;
    incy = incy + 0.02;
    x = x + (noise(incx) - 0.5)*noiseScale;
    y = y + (noise(incy) - 0.5)*noiseScale;
    if (radius < 0) dead=true;
  } 
}


