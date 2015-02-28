
int iterations=10;
char renderer='b';
float cx,cy;
float shrink,shrinkv,multi; 
int Translate;
boolean changed;
void setup() {
  size(600,600,P2D);
  shrink=float(2)/float(width);shrinkv=shrink;
  Translate=width/2;
  multi=25.5;
  loadPixels();
}
void draw() {

  cx=float(mouseX-Translate)*shrink;
  cy=float(mouseY-Translate)*shrink;
  if(changed) {
    background(255);
    switch(renderer) {
    default:
      for(float x=0;x<width;x++) {
        for(float y=0;y<height;y++) {
          float zx=(x-Translate)*shrinkv;
          float zy=(y-Translate)*shrinkv;
          for(int i=0;i<iterations;i++) {
            float zex=zx;
            zx=zx*zx-zy*zy+cx;
            zy=2*zy*zex+cy;
          }
          if(sqrt(zx*zx+zy*zy)<2) {
            pixels[int(x*width+y)]=color(0);
          }
        }
      }
      break;
    case 'a':
      for(float x=0;x<width;x++) {
        for(float y=0;y<height;y++) {
          float zx=(x-Translate)*shrinkv;
          float zy=(y-Translate)*shrinkv;
          for(int i=0;i<iterations;i++) {
            float zex=zx;
            zx=zx*zx-zy*zy+cx;
            zy=2*zy*zex+cy;

            if(sqrt(zx*zx+zy*zy)<2) {
              pixels[int(x*width+y)]=color(255-i*multi);
            }
          }
        }
      }
      break;
    }
    updatePixels();
    changed=false;
  }
}
void keyPressed() {
  if(key==CODED) {
    if(keyCode==LEFT) {
      iterations=(iterations>2) ?iterations-1:iterations;
      multi=float(255)/float(iterations);
    }
    else if(keyCode==RIGHT) {
      iterations=(iterations<100) ?iterations+1:iterations;
      multi=float(255)/float(iterations);
    }
    else if(keyCode==RIGHT) {
      iterations=(iterations<100) ?iterations+1:iterations;
      multi=float(255)/float(iterations);
    }else if(keyCode==UP){
      shrinkv-=.001;
    }else if(keyCode==DOWN){
      shrinkv+=.001;
    }
  }
  else {
    renderer=key;
  }
  changed=true;
}
void mouseMoved() {
  changed=true;
}


