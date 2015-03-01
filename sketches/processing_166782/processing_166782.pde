
PImage img,pic;
boolean eat =false;
void setup(){
 size(1000,1000);
 background(255);

}
void draw(){
  img = loadImage("john.png");
  if(eat)
     tint(255,0,0);
  else tint(#EBFF6C);
  image(img,300,200);
  
 if ( mousePressed)
 {
  eat = true;
  tint(255);
  pic = loadImage("coldnoodle.png");
  
  image(pic,50,300);
  }

}

