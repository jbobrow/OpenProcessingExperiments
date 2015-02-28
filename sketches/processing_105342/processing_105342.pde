
PImage picture1,picture2,picture3;
float x,y;

void setup(){
  size(600,400);
}

void draw(){
  x=mouseX;
  y=mouseY;
  
  ellipse(100,100,50,50);
  ellipse(295,100,50,50);
  ellipse(500,100,50,50);
}

void mousePressed(){
    if ((mouseX>75&&mouseX<125)&&(mouseY>75&&mouseY<125)) {
      picture1=loadImage("1.png");
      image(picture1,0,200,200,200);
    } else if((mouseX>270&&mouseX<320)&&(mouseY>75&&mouseY<125)) {
      picture2=loadImage("2.png");
      image(picture2,200,200,200,200);
    } else if((mouseX>475&mouseX<525)&&(mouseY>75&&mouseY<125)) {
      picture3=loadImage("3.png");
      image(picture3,400,200,200,200);
    } else {
      
    }
    
}


