
int iterations=20,it=iterations/2;
char renderer='b';
float cx,cy,mx,my,zx,zy,zex;
float shrink,shrinkv,multi,trax,tray,traax,traay; 
int Translate;char fract='1';
boolean changed=true,freeze=false;
boolean julia;
void setup() {
  size(600,600,P2D);
  shrink=float(2)/float(width);
  shrinkv=shrink;
  Translate=width/2;
  multi=25.5;
  loadPixels();
}
void draw() {

  if(julia && !(freeze)) {
    cx=map(mouseX,0,width,-1,1);
    cy=map(mouseY,0,height,-1,1);
  }
  if(changed) {

    switch(renderer) {

    default:
      background(255);
      for(float x=0;x<width;x++) {
        for(float y=0;y<height;y++) {
          zx=(x-Translate)*shrinkv+trax;
          zy=(y-Translate)*shrinkv+tray;
          if(!julia) {
            cy=zy;
            cx=zx;
          }
          for(int i=0;i<iterations;i++) {
            zex=zx;
            fractal();
          }
          if(sqrt(zx*zx+zy*zy)<2) {
            pixels[int(x*width+y)]=color(0);
          }
        }
      }
      break;
    case 'a':
      background(0);
      for(float x=0;x<width;x++) {
        for(float y=0;y<height;y++) {
          zx=(x-Translate)*shrinkv+trax;
          zy=(y-Translate)*shrinkv+tray;
          if(!julia) {
            cy=zy;
            cx=zx;
          }
          for(int i=0;i<iterations;i++) {
            zex=zx;
            fractal();
            if(sqrt(zx*zx+zy*zy)>2) {
              pixels[int(x*width+y)]=color(255-i*multi);
              break;
            }
          }
        }
      }
      break;
    case 's':
      background(0);
      for(float x=0;x<width;x++) {
        for(float y=0;y<height;y++) {
          zx=(x-Translate)*shrinkv+trax;
          zy=(y-Translate)*shrinkv+tray;
          if(!julia) {
            cy=zy;
            cx=zx;
          }
          for(int i=0;i<iterations;i++) {
            zex=zx;
            fractal();
            if(sqrt(zx*zx+zy*zy)>2) {
              pixels[int(x*width+y)]=color((cos(map(i,0,20,0,TWO_PI))+1)*127.5);
              break;
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

      it=iterations/2;
      multi=float(255)/float(iterations);
    }
    else if(keyCode==RIGHT) {
      iterations=(iterations<100) ?iterations+1:iterations;
      it=iterations/2;
      multi=float(255)/float(iterations);
    }
    else if(keyCode==UP) {
      shrinkv*=.8;
    }
    else if(keyCode==DOWN) {
      shrinkv*=1.25;
    }
  }
  else if(key=='j') {
    julia=(julia)?false:true;
  }/*else if(key=='p'){
    saveFrame("fractal-####.png");
  }*/
  else if(key=='c') {
    tray=0;
    trax=0;
  }
  else if(key=='C'){
    trax=((float(mouseY)-Translate)*shrinkv+trax);
    tray=((float(mouseX)-Translate)*shrinkv+tray);
  }
  else if(key=='t') {
    tray+=map(mouseX-pmouseX,-3,3,shrinkv,-shrinkv);
    trax+=map(mouseY-pmouseY,-3,3,shrinkv,-shrinkv);
  } else if(key=='f'){
    freeze=(freeze)?false:true;
  }else if(key=='m'){
    mx=map(mouseX,0,width,-1,1);
    my=map(mouseY,0,height,-1,1);
  }else if(key=='M'){
    mx=0;my=0;
  }
  else if(int(key)<58 && int(key)>47){
    fract=key;
  }else{
    renderer=key;
  }
  changed=true;
}
void mouseDragged(){
  changed=true;
}
void mouseMoved() {
  if(julia) changed=true;
}
void fractal() {
  switch(fract){
  case '1':
  zx=zx*zx-zy*zy-cx-mx;
  zy=2*(zex*zy)-cy-my;
  break;
  case '2':
  zx=zx*zx-zy*zy-cx-mx;
  zy=2*(abs(zex*zy))-cy-my;
  break;
  case '3':
  zx=zx*zx-zy*zy-cx-mx;
  zy=2*sqrt(abs(zex*zy))-cy-my;
  break;
  case '4':
  zx=zx*zx-zy*zy-cx-mx;
  zy=2*(zex*zy/(cx/cy))-cy-my;
  break;
  case '5':
  zx=sin(zx);zex=zx;
  zx=zx*zx-zy*zy-cx-mx;
  zy=2*(zex*zy)-cy-my;
  break;
  case '6':
  
  zx=zx*zx-zy*zy-zx*cx-mx;
  zy=2*(zex*zy)-zy*cy-my;
  break;
   case '7':
  
  zx=(zx*zx-zy*zy-cx*mx);
  zy=(2*(zex*zy)-cy*my);
  break;
  case '8':
  
  zx=zx*zx-zy*zy+zx*zy-mx*zx-my*zy+cx+cy;
  zy=(2*(zex*zy)-cy-my);
  break;
  }
}


