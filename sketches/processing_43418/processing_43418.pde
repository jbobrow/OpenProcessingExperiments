
/**********************************************

Click mouse to change pictures

Press keys 0-9 to change "amount of hairiness"

**********************************************/

int u = 25;        //default thickness
String[] IMAGES = {"img.jpg", "img1.jpg", "lights.jpg"};
PImage[] imgs;
int imgInd = 0;
//final int numPics = 3;
PImage pic;
int pos = 0;

void setup(){

  imgs = new PImage[IMAGES.length];
  for(int i=0; i<IMAGES.length; i++) {
    imgs[i] = loadImage(IMAGES[i]);
    imgs[i].loadPixels();
  }
  pic = imgs[pos];
  
  size (600,450);
  background(255);
}

void draw(){

  for(int i = 0; i<400; i++){
    int rx = (int)random(width-1);
    int ry = (int)random(height-1);
    int ra = (int)random(rx-u, rx+u);
    int rb = (int)random(ry-u, ry+u);

    color c = pic.pixels[ry*width + rx];

    for (int r = 255; r>0; r=r){
      if(red(c)<=r && (red(c)>=r-40)){

        for (int g = 255; g>0; g=g){
          if(green(c)<=g && (green(c)>=g-40)){

            for (int b = 255; b>0; b=b){
              if(blue(c)<=b && (blue(c)>=b-40)){
                stroke (r-15,g-15,b-15);
                line(rx,ry,ra,rb);
              }b -= 30;
            }
          }g -= 30;
        }
      }r -= 30;
    }
  }
}

void keyPressed(){
  if (key == '0'){         //not very hairy at all
    u = 1;
  }
  if (key == '1'){
    u = 4;
  }
  if (key == '2'){
    u = 7;
  }
  if(key == '3'){
    u = 11;
  }
  if(key == '4'){
    u = 17;
  }
  if (key == '5'){
    u = 25;
  }
  if(key == '6'){
    u = 32;
  }
  if(key == '7'){
    u = 40;
  }
  if(key == '8'){
    u = 50;
  }
  if (key == '9'){        //quite hairy
    u = 60;
  }

}

void mousePressed(){
  pos++;
  pos = pos%3;
  pic = imgs[pos];

}

