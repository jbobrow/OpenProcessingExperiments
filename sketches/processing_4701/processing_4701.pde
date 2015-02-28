
/*
build onto Michael Winkler's Smiley
 http://www.openprocessing.org/visuals/?visualID=4700
 */
int num = 3;
MichaelWS[] mws;

void setup() {
  frameRate(20);
  size(768, 256);//size(256*num, 256);
  mws = new MichaelWS[num];
  for (int i = 0; i < num; i++) {
    mws[i]= new MichaelWS(i);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < num; i++) {
    mws[i].drawit();
  }
}

class MichaelWS {
  int ofset;
  float anim;
  MichaelWS(int temp_i) {
    ofset = temp_i*256;
  }
  void drawit(){
    if (abs(ofset-mouseX+128)<128) {
      anim = anim*0.9;
    } 
    else {
      anim = (100+anim*100)/101;
    }
    fill(255, 255-anim*2.55, 0); 
    smooth(); 
    strokeWeight(4); 
    ellipse(height*0.5+ofset, height*0.5, height*0.7, height*0.7); 
    noFill(); 
    bezier(
    64+ofset,
    134+anim/3,
    64+ofset,
    212-anim,
    192+ofset,
    212-anim,
    192+ofset,
    134+anim/3);
    fill(0);
    if (random(1)< anim*.001) {
      line(88+ofset, 96, 100+ofset, 96);
      line(256-88+ofset, 96, 256-100+ofset, 96);
    } else {
    ellipse(94+ofset,96,9,18); 
    ellipse(256-94+ofset,96,9,18);
    }
  }


}  








