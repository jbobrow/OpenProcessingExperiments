
ArrayList clouds;

void setup() {
  size(800, 800);
  frameRate(10);
  smooth();
  clouds = new ArrayList();
    background(250,250,250);
}

void draw() {
  clouds.add(new Cloud());
  
  for (int i = 0; i < clouds.size(); i++){ 
    Cloud c = (Cloud) clouds.get(i);
      c .move();
      c .display();
  }
  
  if (clouds.size() > 100){
  clouds.remove(0);
  }
  
}

class Cloud{
float w; // width
float h; // height
float x = width /2; // x position
float y = height /2; // y position
float ranOp; // random opacity
float c; // color
float ranSep; // random seperation
float ranRed;
float ranGre;
float ranBlu;
  
  Cloud(){
  ranOp = random(1,10);
  ranRed = random(100,255);
  ranGre = 0;
  ranBlu = 0;
  //color changing
  if (ranRed <=150){
  ranRed = 255;
  ranGre = 255;
  ranBlu = 255;
  }else{
    ranRed = random(100,255);
    ranGre = 0;
    ranBlu = 0;
  }
  c = color(ranRed,ranBlu,ranGre, ranOp);
  ranSep = random(30,50);
  }
  

void display(){
  //movement speeds
  h = (int) constrain(x + random(-30, 30), 0, width); 
  w = (int) constrain(y + random(-30, 30), 0, height);
  fill(c);
  rectMode(CENTER);
  noStroke();
  
  for (int i = 0; i < ranSep; i = i+2){ // random cloud
  rect(random(-20,20)+x,random(-20,20)+y, i, i); // CLOUD
  
  x = h;
  y = w;
  }
  
} // Display Cloud


void move(){
  if (x>width-h || x<0+h || y>height-w || y<0+w) {
    h = width/2;
    w = height/2;
  }
}//move Cloud


}// class Cloud





