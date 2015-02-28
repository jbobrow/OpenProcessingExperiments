
//HighSpeed by Evan White
void setup(){
  size(600,400);
}
void draw(){
  PImage ff;
  ff= loadImage("ff-logo-big.png");
  tint(constrain (mouseX,100,255),constrain (mouseY,0,250),mouseY+100,150);
  for(int a=0; a<600; a++){
    image (ff,a*10+-300,0);
  }
  PImage chr;
  chr=loadImage("google-chrome-logo.png");
  tint(constrain (mouseY,100,255),constrain (mouseX,0,255),mouseY+100,50);
  for(int c=0; c<600;c++){
    image(chr,c*10+100,100);
  }
  PImage saf;
  saf=loadImage("safari_icon.png");
  tint(constrain (mouseY,100,255),constrain (mouseX,0,255),mouseY+100,25);
  for(int b=0; b<600; b++){
    image(saf,b*10+300,0);
  }
}






