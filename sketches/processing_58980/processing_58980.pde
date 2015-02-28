

int lastPrint;
final int numStars = 10;
boolean cloudMode = false;
PImage img;
Star arr[] = new Star[numStars];
class Star{
  PVector pos;
  int size;
  
  Star(int x, int y, int size){
    this.size = size;
    pos = new PVector(x,y);
  }
  void draw(){
    noStroke();
    fill(255);
    ellipse(pos.x,pos.y,this.size,this.size);
  }
}

float scale = 0.025;
void setup() {
  size(400,400);
  img = new PImage(width,height);


 
  newPattern();

}

void draw() {
    background(0);
    
    if(cloudMode){
      for(int n=0;n<numStars;n++){
        arr[n].draw();
      }
      tint(255,200);
    }

    image(img,0,0);
}

void keyPressed() {
  if(key == 'c') {
    cloudMode = !cloudMode;
  }
  newPattern();
}

void newPattern(){
  lastPrint = millis();
  float scale;
  if(cloudMode) {
    scale = 0.005;
  } 
  else {
    scale = 0.08;
  }
  
  
  for(int i=0;i<width;i++) {
    for(int j=0;j<height;j++) {
      color col;
      if(cloudMode) {
        col = color(255*noise(scale*i,scale*j,lastPrint));
        
        for(int n=0;n<numStars;n++){
          arr[n] =new Star((int)random(width),(int)random(height),(int)random(2)+1);
        }
      } 
      else {

        col = color(255*noise(scale*i,scale*j,lastPrint));
      }

      img.set(i,j,col);

     
      
    }
  }
  if(!cloudMode){
    img.filter(THRESHOLD);
  }
}

