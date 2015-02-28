

//a variable to store the maximum # of elements in the array
int MAX = 2;

//declare array names and allocate the space to store them
color[] cc = new color[MAX];


int i=10;
int s=i/5;

void setup (){
  size(600,600);
  
 // noLoop();
  frameRate(30);
  smooth();
    // generate variables of array
  for (int i = 0; i<MAX; i++) {
    cc[i] = color(random(255), random(255), random(255));
  }
  background(cc[int(random(MAX))]);
}

void draw(){

  for (int x=0; x<width; x=x+i) {
    for (int y=0; y<height; y=y+i) {  
      float a = random(0,1);
      if (a<0.05){
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
        fill(cc[0]);
        rect(x, y, s, s);
      }
      if (a>0.5){
        noStroke();
        fill(cc[1]);
        rect(x, y, s, s);
      }
    }
  }
}

void mousePressed() {
  // generate variables of array
  for (int i = 0; i<MAX; i++) {
    cc[i] = color(random(255), random(255), random(255));
  }
}

