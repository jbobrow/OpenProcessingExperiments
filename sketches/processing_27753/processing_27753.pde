

int iterations=20;
char renderer='b';
float cx,cy,zx,zy,ma,zex;
String files="01";
float shrink,shrinkv,multi; 
int translatex,translatey,num,rand=1,qual=1;
boolean changed,julia,colored=true;
void setup() {
  size(400,400,P2D);
  shrink=float(2)/float(width);
  shrinkv=shrink;
  translatex=width/2;
  translatey=height/2;
  multi=25.5;
  loadPixels();
}
void draw() {
  if(!julia) {
    if(key!='p') {
      background(125);
      switch(renderer) {
      default:
        if(colored) {
          for(float x=0;x<width;x+=qual) {
            for(float y=0;y<height;y+=qual) {
              zx=(x-translatex)*shrinkv-cx;
              zy=(y-translatey)*shrinkv;
              ma=0;
              num=0;
              for(int i=0;i<iterations;i++) {
                zx=zx+cx;
                zex=zx;
                zx=log(sqrt(zx*zx+zy*zy));
                zy=abs(zy)+cy;
                zy=atan2(zex,zy);
                if(0==i%rand) {
                  ma+=sqrt(zx*zx+zy*zy);
                }
                else {
                  num+=1;
                }
              }
              pixels[int(x*width+y)]=color(map(ma/(iterations-num),0,1.5,0,255),map(zx,-1,1,0,255),map(zy,-1,1,0,255));
            }
          }
        }
        else {
          for(float x=0;x<width;x+=qual) {
            for(float y=0;y<height;y+=qual) {
              zx=(x-translatex)*shrinkv-cx;
              zy=(y-translatey)*shrinkv;
              ma=0;
              num=0;
              for(int i=0;i<iterations;i++) {
                zx=zx+cx;
                zex=zx;
                zx=log(sqrt(zx*zx+zy*zy));
                zy=abs(zy)+cy;
                zy=atan2(zex,zy);
                if(0==i%rand) {
                  ma+=sqrt(zx*zx+zy*zy);
                }
                else {
                  num+=1;
                }
              }
              pixels[int(x*width+y)]=color(map(ma/(iterations-num),.1,1.1,0,255));
            }
          }
        }
        break;
      case '1':
        for(float x=0;x<width;x+=qual) {
          for(float y=0;y<height;y+=qual) {
            zx=(x-translatex)*shrinkv-cx;
            zy=(y-translatey)*shrinkv;
            for(int i=0;i<iterations;i++) {
              zx=zx+cx;
              zex=zx;
              zy=zy+cy;
              zx=log(sqrt(zx*zx+zy*zy));
              zy=(zy!=0) ? atan(zex/zy):HALF_PI;
            }
            pixels[int(x*width+y)]=color(map(sqrt(zy*zy+zx*zx),0,2,0,255),map(zx,-1,1,0,255),map(zy,-1,1,0,255));
          }
        }

        break;
      case '2':
        for(float x=0;x<width;x+=qual) {
          for(float y=0;y<height;y+=qual) {
            zx=(x-translatex)*shrinkv-cx;
            zy=(y-translatey)*shrinkv;
            for(int i=0;i<iterations;i++) {
              zx=zx+cx;
              zex=zx;
              zy=zy+cy;
              zx=log(sqrt(zx*zx+zy*zy));
              zy=(zy!=0) ? atan(zex/zy):HALF_PI;
            }
            pixels[int(x*width+y)]=color(map(zx,-1,1,0,255));
          }
        }

        break;
      }
    }
  }
  else {
    if(key!='p') {
      background(255);
      switch(renderer) {
      default:
        for(float x=0;x<width;x++) {
          for(float y=0;y<height;y++) {
            zx=(x-translatex)*shrinkv;
            zy=(y-translatey)*shrinkv;
            cx=zx;
            cy=zy;
            float ma=0;
            for(int i=0;i<iterations;i++) {

              zx=zx+cx;
              zex=zx;
              zx=log(sqrt(zx*zx+zy*zy));
              zy=abs(zy)+cy;
              zy=atan2(zex,zy);
              ma+=sqrt(zx*zx+zy*zy);
            }
            pixels[int(x*width+y)]=color(map(ma/iterations,0,1.5,0,255),map(zx,-1,1,0,255),map(zy,-1,1,0,255));
          }
        }
        break;
      case '1':
        for(float x=0;x<width;x++) {
          for(float y=0;y<height;y++) {
            zx=(x-translatex)*shrinkv;
            zy=(y-translatey)*shrinkv;
            cx=zx;
            cy=zy;
            for(int i=0;i<iterations;i++) {
              zx=zx+cx;
              zex=zx;
              zy=zy+cy;
              zx=log(sqrt(zx*zx+zy*zy));
              zy=(zy!=0) ? atan(zex/zy):HALF_PI;
            }
            pixels[int(x*width+y)]=color(map(sqrt(zy*zy+zx*zx),0,2,0,255));
          }
        }

        break;
      case '2':
        for(float x=0;x<width;x++) {
          for(float y=0;y<height;y++) {
            zx=(x-translatex)*shrinkv;
            zy=(y-translatey)*shrinkv;
            cx=zx;
            cy=zy;
            for(int i=0;i<iterations;i++) {
              zx=zx+cx;
              zex=zx;
              zy=zy+cy;
              zx=log(sqrt(zx*zx+zy*zy));
              zy=(zy!=0) ? atan(zex/zy):HALF_PI;
            }
            pixels[int(x*width+y)]=color(map(zx,-1,1,0,255));
          }
        }

        break;
      }
    }
  }

  updatePixels();
  changed=false;
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
    else if(keyCode==UP) {
      shrinkv*=.80;
    }
    else if(keyCode==DOWN) {
      shrinkv*=1.25;
    }
  }
  else {
    if(key=='w') {
      translatex+=2;
    }
    else if(key=='s') {
      translatex-=2;
    }
    else if(key=='d') {
      translatey+=2;
    }
    else if(key=='a') {
      translatey-=2;
    }
    else if(key=='j') {
      julia=(julia)?false:true;
    }
    else if(key=='i') {
      rand=(int)map(mouseX,0,width,1,iterations);
    }
    else if(key=='c') {
      rand=(int)map(mouseX,0,width,1,iterations);
    }
    
    else if(key=='q') {
      qual=(qual==1)? 2:1;
    }
    else if(key=='p') {
      save(files+".png");
      if(files.charAt(1)-48==9) {
        files=nf((files.charAt(0)-47)*10,2);
      }
      else {
        files=nf((files.charAt(0)-48)*10+files.charAt(1)-47,2);
      }
    }
    else {
      renderer=key;
    }
  }
  changed=true;
}
void mouseDragged() {

  cx=float(mouseX-width/2)*shrink;
  cy=float(mouseY-height/2)*shrink;
}
float clog(float x1,float y1) {
  if(y1>0) {
    float arg= (x1!=0) ? atan(x1/y1):HALF_PI;
    float y2=(arg>=0) ? arg:arg+PI;
    return y2;
  }
  else {
    float arg= (x1!=0) ? atan(x1/y1):HALF_PI+PI;
    float y2=(arg>=0) ? arg+PI:arg+TWO_PI;
    return y2;
  }
}

