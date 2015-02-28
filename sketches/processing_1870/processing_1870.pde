
/*El paso de las nubes
 *por Dennys Regalado Diaz
 *
 *Utilizando Perlin noise (02 dic 2008)
 */
float xnoise = 0.0;
PImage []img = new PImage[2];
Timer timer;
int cont;
float ynoise = 0.0;
float inc = 0.01;
int h,w,offset;
void setup(){
  size(300,200);
  timer = new Timer(1);
  timer.start();
  w = width*2;
  cont = 0;
  h = height;
  img[0] = createImage(w,h, ARGB);
  img[1] = createImage(w,h, ARGB);
  offset=-img[0].width;
  for (int x = 0; x < w; x++) {
    int x2 = w-1-x;
    for (int y = 0; y < h ; y++) {      
      float gray = noise(xnoise, ynoise)*255;
      color c = color(map(gray,0,255,0,255),map(gray,0,255,100,255),map(gray,0,255,210,255));
      stroke(c);
      img[0].pixels[y*w + x] = img[1].pixels[y*w  + x2] = c;
      //        point(x, y);
      xnoise = xnoise + inc;

    }
    xnoise = 0;
    ynoise = ynoise + inc;
  }

  stroke(0);
  smooth();
  
}

void draw(){
  background(255);
  if(/*timer.terminado()*/true){
    image(img[(cont==1?1: 0)],offset,0);
    image(img[(cont==1?0 : 1)],offset+img[0].width,0);
    offset+=2;        

    if(offset == 0){
      cont = (cont == 1 ? 0 : 1);
      offset = -img[0].width;
    }

    timer.start();
  }
}


class Timer{
  int t_inicial;
  int lapso;
  Timer(int milisegundos){
    lapso = milisegundos;
  }
  void start(){
    t_inicial = millis();
  }
  boolean terminado(){
    return (millis()-t_inicial >= lapso);      
  }

}




