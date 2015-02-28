
/* Kevin Keables
DMST 2100
2011*/
int x=1;
int y=1;
int a=-24;
int b=75;
int c=26;
int d=75;
int speedx=10;
int speedy=8;
void setup() {
  size (900,420);
  smooth();
  strokeWeight(2);
}
void draw() {
  for (int j=0; j<20; j++) {
    for(int i = 0; i<20; i++) {
      fill(random((mouseY+1)/2),random((mouseX+1)/4),0);
      stroke (random(107100/ (mouseY+1)),random(229500/ (mouseX+1)),0);
      triangle (x+i*50,y+j*50,a+i*50,(y+j*50)+50,(a+i*50)+50,(y+j*50)+50);
      fill(random((mouseX+1)/4),random((mouseY+1)/2),0);
      stroke (random(107100/ (mouseY+1)),random(229500/ (mouseX+1)),0);
      triangle ((x+i*50)-49,y+j*50,(x+i*50)-25,(y+j*50)+50,(x+i*50)-1,y+j*50);
    }
  }
}     
