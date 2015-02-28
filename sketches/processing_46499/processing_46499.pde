
PImage myImage;
PImage myImage2;
PImage myImage3;
PImage myImage4;

void setup(){
  size(350,516);
  myImage= loadImage("monalisa.png");
  myImage2= loadImage("eyelids.png");
  myImage3= loadImage("hand.png");
  myImage4= loadImage("shavedhead.png");
  background(30);
}

void draw(){
  image(myImage,25,25,300,466);

  //eye blink
  if(mouseX>138){
    if(mouseX<187){
      if(mouseY>122){
        if(mouseY<130){
          image(myImage2,132,118,58,15);
        }
      }
    }
  }
  
  //hand
  if(mouseX>82){
    if(mouseX<158){
      if(mouseY>237){
        if(mouseY<275){
          image(myImage3,40,240,216,236);
        }
      }
    }
  }
  
  //shaved head
  if(mouseX>100){
    if(mouseX<200){
      if(mouseY>373){
        if(mouseY<444){
          image(myImage4,44,41,234,224);
        }
      }
    }
  }
  
}

