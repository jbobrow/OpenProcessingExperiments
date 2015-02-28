
int inv, it;
void setup() {
  size(512, 512);
  colorMode(HSB);
  inv = 1;
  it = 3;
}

void draw(){
  background(0);
  translate(256,256);
  if(inv == 1){
    koch( -128, -128, 128, -128, it);
    koch( 0, 128*sqrt(3)-128, -128, -128, it);
    koch( 128, -128, 0, 128*sqrt(3)-128, it);
  }
  else{
    koch( 128, -128, -128, -128, it);
    koch( -128, -128, 0, 128*sqrt(3)-128, it);
    koch( 0, 128*sqrt(3)-128, 128, -128, it);
  }
}

void mouseClicked(){
  inv*=-1;
}

void keyPressed(){
  switch(key){
    case '1': it = 1; break;
    case '2': it = 2; break;
    case '3': it = 3; break;
    case '4': it = 4; break;
    case '5': it = 5; break;
    case '6': it = 6; break;
  }
}

void koch(float x1, float y1, float x2, float y2, int i) {
  if (i>1) {
    koch( x1, y1, (x1+x1+x2)/3, (y1+y1+y2)/3, i-1);
    koch( (x1+x1+x2)/3, (y1+y1+y2)/3, (x1+x2)/2 - (y1-y2)*sqrt(3)/6, (y1+y2)/2 + (x1-x2)*sqrt(3)/6, i-1);
    koch( (x1+x2)/2 - (y1-y2)*sqrt(3)/6, (y1+y2)/2 + (x1-x2)*sqrt(3)/6, (x1+x2+x2)/3, (y1+y2+y2)/3, i-1);
    koch( (x1+x2+x2)/3, (y1+y2+y2)/3, x2, y2, i-1);
  }
  if (i==1) {
    stroke(2*sqrt(sq(y2-128)+sq(x1-128))%256, 192, 255);
    line(x1, y1, x2, y2);
  }
}



