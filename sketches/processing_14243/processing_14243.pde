
void setup() {
  size(600,600);
  smooth();
  background(255);
}

void draw() {
  if (mousePressed && mouseButton == LEFT) {
    float a=0;
    float b=0;
    float c=0;
    float d=0;
    for (int i=1;i<width;i+=random(40)) {
      for (int j=1;j<height;j+=random(40)) {
        if ((j%2)==1) {
          fill(random(255),random(255),random(255), random(255));
          float t = random(sqrt(j));
          float s = random(sqrt(i));
          stroke(random(255),random(255),random(255), random(255));
          //        line(random(i),random(j),random(i),random(j));
          rotate(random(360));
          ellipse(i, j, t, s);
          ellipse(i, j, t+1,s+1);
        }
        if ((j%7)==0) {
          a = random(j);
          b = random(i);
        }
        if ((j%7)==2) {
          c = random(600-i);
          d = random(600-j);
        }
        stroke(random(255),random(255),random(255), random(60));
//        if(a!=0 && b!=0 && c!=0 && d!=0) {
//          if (i%2==0) {
//            line(a,b,c,d);
//          }else{
//            line(a,c,b,d);
//          }
//        }
      }
    }
  }
}

void mousePressed() {
  if (mouseButton==RIGHT)background(255);
}
                
