
void setup() {
  size(500,500);
  println(0/256f/5);
}

float t, T, x, y, H=255,s=0.2,S=255,w=4;
boolean q=true,d=false,e=false;
void draw() {
  if(!e) {
    background(H);
    t+=x=s;
    T+=mouseX/256f*x-x;
    noStroke();
    for (y=0;++y<256;) {
      fill(200,200,y+200,200);
      rect(0, 256+y,510, 1);
      x=256/y+t;
      fill(x%20*9);
      x=T+noise(x/99)*60-30;
      rect(256-x*y-2*y, 256+y, y*w, (y/4)*20);
    }
    
    loadPixels();
    if((pixels[249750]&0xff-((pixels[249750]>>8)&0xff))>0 && frameCount > 200) {
      H--;
    }
  
    if(H==0) {
      background(0);
      e=true;
    } else if (w < 2) {
      background(255);
      e=true;
    }
    
    s += 0.0001;
    w -= 0.0005;
    S+=d==true?1:-1;
    if(frameCount%255==0){d=!d;H+=50;}
    H=H>255?255:H;
    fill(0,S);
    rect(0,0,500,500);
    
    fill(128);
    rect(0,0,map(w,4,2,0,500),20);
  }
}


