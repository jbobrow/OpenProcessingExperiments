
/*
Coded by Kof @ 
Fri Apr  4 23:19:39 CEST 2014



   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'
*/

float SPEED = 8.17;
float STEP = 110.33;
float SPREAD = 10013.97;

//////////////////////////////////////

ArrayList modulars;
int SIZE = 24;

//////////////////////////////////////

void setup(){

  size(600,600);

  modulars = new ArrayList();

  for(int y =0 ; y < height;y+=SIZE){
    for(int x =0 ; x < width;x+=SIZE){
      modulars.add(new Modular(x,y,SIZE));
    }
  }

  frameRate(30);
  noSmooth();


}


void draw(){

  for(Object o: modulars){
    Modular m = (Modular)o;
    m.draw();
  }
}


//////////////////////////////////////


class Modular{

  PGraphics img;
  int x,y,w,h;
  float cset[];

  Modular(int _x,int _y,int _d){

    x = _x;
    y = _y;

    w = _d;
    h = _d;

    cset = new float[w>=h?w:h];
    img = createGraphics(w,h,JAVA2D);

    fillColors();


  }

  void fillColors(){
    for(int i = 0 ;  i < cset.length;i++){
      // magic oneliner
      cset[i] = 255*(noise((frameCount/SPEED+i*STEP+modulars.indexOf(this)*SPREAD))*2.0-0.6);
      cset[i] = constrain(cset[i],0,255);
    }
    regenerate();

  }

  void regenerate(){
    img.beginDraw();
    img.noSmooth();
    img.rectMode(CENTER);
    img.noFill();
    for(int i = 0 ; i < w;i++){
      img.stroke(cset[i]);
      img.rect(w/2,h/2,i,i);
    }
    img.endDraw();
  }


  void draw(){
    fillColors();
    image(img,x,y);
  }
}

