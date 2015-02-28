
//Scroll the map by moving mouse to edges of screen

PImage img;
int mapx = 256;
int mapy = 256;

void setup() {

size(512,512);
rectMode(CORNER);
imageMode(CENTER);
ellipseMode (CENTER);
img = loadImage("1024map.jpg");
frameRate(25);

}
//scrolling
void draw(){
 image(img,mapx,mapy);
 if (mouseX<50){
   mapx = mapx+3;
 }
 if (mouseX>462){
   mapx = mapx-3;
 }  
 if (mouseY<50){
   mapy = mapy+3;
 }
 if (mouseY>462){
   mapy = mapy-3;
//limits
 }
 if (mapx<0){
  mapx = 0;
 }
 if (mapx>512){
  mapx = 512;
 }
 if (mapy<0){
  mapy = 0;
 }
 if (mapy>512){
  mapy = 512;
 }
//interface
 println(mapy);
 fill (255,3,3);
 ellipse(256,256,30,30);
 noStroke();
 fill (255,150);
 rect(0,0,512,50);
 rect(0,0,50,512);
 rect(0,462,512,50);
 rect(462,0,50,512);
}
 






