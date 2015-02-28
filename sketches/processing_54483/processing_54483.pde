

int i=40;
int s=i/5;

void setup (){
  size(600,600);
  background(255);
  //  noLoop();
  frameRate(30);
  smooth();
}

void draw(){
  noStroke();
  fill(255,20);
  rect(0,0,width,height);
  for (int x=0; x<width; x=x+i) {
    for (int y=0; y<height; y=y+i) {  
      float a = random(0,1);
      if (a<0.2){
        rectdraw(x, y, s);
      }
    }
  }

}


void rectdraw(int stx, int sty, int s){

  for (int x=stx; x<stx+i; x=x+s) {
    for (int y=sty; y<sty+i; y=y+s) {
      float a = random(0,1);
      if (a<0.5){
        noStroke();
        fill(random(255));
        rect(x, y, s, s);
      }
    }
  }

}

