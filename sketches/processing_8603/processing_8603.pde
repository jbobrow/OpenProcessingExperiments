
PImage pic;
float rotation;
float Scale=1;
float x;
float y;

void setup(){
  rotation=0;
  Scale=1;
  x=0;
  y=0;
  size(screen.width, screen.height);
  background(128);
  noStroke();
  smooth();
  pic=loadImage("http://openprocessing.org/images/header.png");
  imageMode(CENTER);
  translate(width/2,height/2);
  image(pic,0,0,width/2,height/2);
}

void draw(){
  background(128);
  if(mousePressed && mouseButton==LEFT){
    if(mouseX>pmouseX){
      translate((width/2)+x,(height/2)+y);
      rotation+=5;
      rotate(radians(rotation));
      scale(Scale);
      image(pic,0,0,width/2,height/2);
    }
    else if(mouseX<pmouseX){
      translate((width/2)+x,(height/2)+y);
      rotation-=5;
      rotate(radians(rotation));
      scale(Scale);
      image(pic,0,0,width/2,height/2);
    }
    else{
      translate((width/2)+x,(height/2)+y);
      rotate(radians(rotation));
      scale(Scale);
      image(pic,0,0,width/2,height/2);
    }
  }
  else if(mousePressed && mouseButton==RIGHT){
    if(mouseY>pmouseY){
      translate((width/2)+x,(height/2)+y);
      Scale+=0.05;
      rotate(radians(rotation));
      scale(Scale);
      image(pic,0,0,width/2,height/2);
    }
    else if(mouseY<pmouseY){
      translate((width/2)+x,(height/2)+y);
      Scale-=0.05;
      rotate(radians(rotation));
      scale(Scale);
      image(pic,0,0,width/2,height/2);
    }
    else{
      translate((width/2)+x,(height/2)+y);
      rotate(radians(rotation));
      scale(Scale);
      image(pic,0,0,width/2,height/2);
    }
  }
  else{
    translate((width/2)+x,(height/2)+y);
    rotate(radians(rotation));
    scale(Scale);
    image(pic,0,0,width/2,height/2);
  }
  if(keyPressed && key=='r'){
    setup();
  }
  if(keyPressed && key==CODED && keyCode==UP){
    y+=5;
  }
  else if(keyPressed && key==CODED && keyCode==DOWN){
    y-=5;
  }
  else if(keyPressed && key==CODED && keyCode==RIGHT){
    x-=5;
  }
  else if(keyPressed && key==CODED && keyCode==LEFT){
    x+=5;
  }
}


