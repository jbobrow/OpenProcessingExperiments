
float y=100;
float c=100;
float d=80;
float e=100;
float f=70;
void setup() {
  size(860,860);
  background(20);
}
void draw() {
  noStroke();
  for(int y=0; y<670; y=y+10) {
    for(int x=0; x<400; x=x+16) {
      float a = dist(x,y,10,400);
      fill(random(255),random(130),random(230));
      stroke((sin(a*0.1)+1)*100);
      rect(x+a,y+a,2.2,30);
    }
  }
  noStroke();
  for(int c=0;c<500; c=c+10) {
    for(int d=0; d<300; d=d+18) {
      float b= dist(c,d,130,70);
      fill(random(140), random(180), random(255));
      stroke((sin(b*0.3)+1)*120);
      rect(c+b, d+b, 4,16);
    }
  }
  noStroke();
  for(int e=0;e<1100; e=e+10) {
    for(int f=0; f<200; f=f+10) {
      float g= dist(e,f,400,100);
      fill(random(255), random(150), random(20));
      stroke((sin(g*0.6)+1)*240);
      rect(e+g, f+g, 5,25);
    }
  }
}


