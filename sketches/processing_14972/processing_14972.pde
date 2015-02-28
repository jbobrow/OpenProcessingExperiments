
//Most code atributed to Steven Kay.

PImage im;
float MAX_ASPECT=65.0;
float MIN_SIZE=2.0;

void setup() {
  size (453, 604);
  im=loadImage("littlejackson.jpg");
  background(0);
}

void mouseMoved() {
  MAX_ASPECT=mouseY/8.0;
MIN_SIZE=11.0-(mouseX/60.4);
}

void splitImage(float x, float y, float w, float h) {
  boolean ok=(w/h<MAX_ASPECT && h/w<MAX_ASPECT);
  if (!ok) return;
  if ((w<=MIN_SIZE || h<=MIN_SIZE)) {
    int area=0;
    float lumR=0, lumG=0, lumB=0;
    for (float xx=x;xx<x+w;xx++) {
      for (float yy=y;yy<y+h;yy++) {
        area++;
        int c=im.pixels[(int)yy*453+(int)xx];
        lumB+=(c&0xFF);
        lumG+=((c&0xFF00)>>8);
        lumR+=((c&0xFF0000)>>16);
      }
    }
    lumR/=area;
    lumG/=area;
    lumB/=area;
    fill(lumR, lumG, lumB);
    noStroke();
    rect(x,y,w,h);
    return;
  }
  
  int splittype=(int)random(2);
  switch(splittype) {
    case (0) : {
      splitImage(x,y,w/2,h);
      splitImage(x+(w/2),y,w/2,h);
      break;
    }
    case(1) : {
      splitImage(x, y, w, h/2);
      splitImage(x,y+(h/2),w,h/2);
      break;
    }
    case(2) : {
      splitImage(x,y,w/2,h/2);
splitImage(x+(w/2),y,w/2,h/2);
splitImage(x,y+(h/2),w/2,h/2);
splitImage(x+(w/2),y+(h/2),w/2,h/2);
break;
    }
    default: {
      break;
    }
  }
}
void draw() {
  splitImage(0,0,453,604);
}
        
        
        
        
        
        

