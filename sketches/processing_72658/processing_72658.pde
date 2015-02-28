
int xpos;
int ypos;
int dis;
PImage img;
int px;
int diam;
int specks;

void setup () {
  size(800, 600);
  background(0,0,0);
  smooth();
  frameRate(30);
  
  img = loadImage("yosemite.jpg");
  
  xpos=width/2;
  ypos=height/2; 
  dis=15;
  diam=2;
  
  specks=5;
  
  noStroke();
}


void draw () {
 //Draw circle
  img.loadPixels();

 for(int x=0; x<10*specks; x++){
 px= xpos+ypos*width;
 

if (px<height*width-1){
 fill(red(img.pixels[px]), green(img.pixels[px]), blue(img.pixels[px]));
}

if(px>height*width-1 || px<1){
  fill(0,0,0);
}
 ellipse(xpos, ypos, diam, diam); 
 
 
 
// Next ellipse location
 if(xpos<=0+dis){
   xpos = xpos + dis;
 }
 if(xpos>=width-dis){
  xpos = xpos - dis; 
 }
 if(ypos<=0+dis){
   ypos = ypos + dis;
 }
 if(ypos>=height-dis){
  ypos = ypos - dis; 
 }
 else{ 
 xpos = xpos + int(random(-dis,dis));
 ypos = ypos + int(random(-dis,dis));
 }
}


if (keyPressed) {
  if (key == '=' || key == '+'){
    diam = diam + 2;
  }
  if (key == '-' || key == '_'){
    if (diam > 2){
    diam = diam - 2;
    }
  }
  if (key == '1'){
    specks = 1;
  }
  if (key == '2'){
    specks = 2;
  }
    if (key == '3'){
    specks = 3;
  }  if (key == '4'){
    specks = 4;
  }  if (key == '5'){
    specks = 5;
  }  if (key == '6'){
    specks = 6;
  }  if (key == '7'){
    specks = 7;
  }  if (key == '8'){
    specks = 8;
  }
    if (key == '9'){
    specks = 9;
  }
    if (key == '0'){
    specks = 10;
  }
}
  



}


