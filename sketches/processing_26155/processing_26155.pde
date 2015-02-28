
int x=20;
int y=10;

void setup() {
  size(500,500);
  smooth();
}

void draw () {
  fill(255,10);
  rect(0,0,width,height);
  //background(255);
  for(int j=0;j<50;j++) {
    for(int i=0; i<40; i++) {
      fill(11+i*20,218-j*15,227,10);
      triangle(x, y, x*20+100, y+i*6+20, x+i*5-100,y+i*8+100);
    }
  }

} 


