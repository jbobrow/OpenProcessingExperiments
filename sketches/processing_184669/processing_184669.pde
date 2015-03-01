
scream[] shouts;

int nrofshouts = 10;
int lastshout=0;
int mp =0;


int x,y;

void setup() {
  size(500, 500);
  smooth();
  textAlign(CENTER, CENTER);
  background(0);  
  fill(128);
  textSize(10);
  text("click canvas",width-35,height-15);
  
  shouts = new scream[nrofshouts];
  for (int i = 0; i < nrofshouts; i++){
    shouts[i] = new scream(random(0,width),random(0,height), color(random(0,255),random(0,255),random(0,255)));
  }
}

void mousePressed(){
  mp=1;
  lastshout++;
  if (lastshout > nrofshouts-1) {lastshout=0;} 
}

void draw(){
  background(0);  
  fill(128);
  textSize(10);
  text("click canvas",width-35,height-15);
  
  for (int i = 0; i < nrofshouts; i++){
    shouts[i].grow();
  }
  
  if (mp==1){
     
    shouts[lastshout] = new scream(mouseX, mouseY, color(random(0,255),random(0,255),random(0,255)));
    mp=0;
  }  
}

class scream{
  float x,y;
  int size=1;
  color c;
  
  scream(float tempx, float tempy, color tempcolor){
    x=tempx;
    y=tempy;
    c=tempcolor;       
  }
 
  void grow(){
    fill(c, 200); 
    textSize(size++);
    text("hi",x,y);
  }
}


