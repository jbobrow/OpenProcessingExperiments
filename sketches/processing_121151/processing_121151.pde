
PImage a;
float dz, sx, sy, sw, sh, x, y;
int estado=0, n=0;

void setup() {
  size(480, 270);
  a=loadImage("http://www.wallpapersultrahd.com/ultrahd/fractal3840x2160.jpg", "jpg");
  sx=0.0;
  sy=0.0;
  sw=a.width;
  sh=a.height;
  dz=pow(sw/width, 1.0/119.0);
  //smooth();
  frameRate(60);
  //println("dz="+dz);
}

void draw() {
  //background(0);
  copy(a, int(sx), int(sy), int(sw), int(sh), 0, 0, width, height);
  //println("sx="+sx+", "+"sy="+sy+", "+"sw="+sw+", "+"sh="+sh);
  switch(estado) {
    case 0:
      if(++n==120) {
        n=0;
        //x=random(a.width-width);
        //y=random(a.height-height);
        x=int(random(a.width/8-width/8))*8;
        y=int(random(a.height/8-height/8))*8;
        estado=1;
      }
      break;
    case 1:
      if(++n==120) {
        //sx=x;
        //sy=y;
        //sw=width;
        //sh=height;
        n=0;
        estado=2;
      }
      else {
        sx+=x/120;
        sy+=y/120;
        sw/=dz;
        sh/=dz;
      }
      break;
    case 2:
      if(++n==120) {
        n=0;
        estado=3;
      }
      break;
    case 3:
      if(++n==120) {
        //sx=0;
        //sy=0;
        //sw=a.width;
        //sh=a.height;
        n=0;
        estado=0;
      }
      else {
        sx-=x/120;
        sy-=y/120;
        sw*=dz;
        sh*=dz;
      }
      break;
    default:
      break;
  }
}

