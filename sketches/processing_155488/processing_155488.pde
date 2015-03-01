
import processing.serial.*;
Serial port;

sliderV sV1, sV2, sV3;

color cor;

void setup() {
  size(500, 500);

  println("Available serial ports:");
  println(Serial.list());

  // check on the output monitor wich port is available on your machine
  port = new Serial(this, Serial.list()[1], 9600);

  // create 3 instances of the sliderV class
  sV1 = new sliderV(100, 100, 90, 255, #FF0000);
  sV2 = new sliderV(200, 100, 90, 255, #00FF00);
  sV3 = new sliderV(300, 100, 90, 255, #0000FF);
}

void draw() {
  background(0);

  sV1.render();
  sV2.render();
  sV3.render();

  // send sync character
  // send the desired value
  port.write('R');
  port.write(sV1.p);
  port.write('G');
  port.write(sV2.p);
  port.write('B');
  port.write(sV3.p);
}

/* 
Slider Class - www.guilhermemartins.net
based on www.anthonymattox.com slider class
*/
class sliderV {
  int x, y, w, h, p;
  color cor;
  boolean slide;

  sliderV (int _x, int _y, int _w, int _h, color _cor) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    p = 90;
    cor = _cor;
    slide = true;
  }

  void render() {
    fill(cor);
    rect(x-1, y-4, w, h+10);
    noStroke();
    fill(0);
    rect(x, h-p+y-5, w-2, 13);
    fill(255);
    text(p, x+2, h-p+y+6);

    if (slide==true && mousePressed==true && mouseX<x+w && mouseX>x){
     if ((mouseY<=y+h+150) && (mouseY>=y-150)) {
        p = h-(mouseY-y);
        if (p<0) {
          p=0;
        }
        else if (p>h) {
          p=h;
        }
      }
    }
  }
}


