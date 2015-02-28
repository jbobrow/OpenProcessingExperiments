
PImage webIng; //objeto
int imgSize = 20;

void setup(){
  webIng = loadImage("http://apcmag.com/images/2012/masterclass_arduino_rolly.jpg");
  size(webIng.width, webIng.height);
  smooth();
  //load image from web server
}
void draw(){
  background(0);
  //image(webIng,0,0);
  for (int i=0; i<webIng.width; i+=imgSize){
    for (int j=0; j<webIng.height; j+=imgSize){
      color c = webIng.get(i,j); //obtiene la información de color del pixel
      stroke(c,100);
      strokeWeight(imgSize/2);
      line (i,j,width/2,height/2);
      fill(c,120);
      strokeWeight(1.5);
      stroke (c);
      ellipse (i,j,imgSize/2,imgSize/2);
    }
  }
}
