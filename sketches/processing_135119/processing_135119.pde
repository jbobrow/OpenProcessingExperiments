
int x=0;
PImage G1;
PImage G2;
PImage G3;
PImage W1;
PImage G4;
PImage G5;
PImage G6;
PImage W2;
PImage G7;
PImage G8;
PImage G9;
PImage W3;
PImage G10;
PImage G11;
PImage G12;
PImage W4;
void setup(){
  size(2000,150);
  G1=loadImage("G1.jpg");
  G2=loadImage("G2.jpg");
  G3=loadImage("G3.jpg");
  W1=loadImage("W1.jpg");
  W2=loadImage("W2.jpg");
  W3=loadImage("W3.jpg");
  W4=loadImage("W4.jpg");
  G4=loadImage("G4.jpg");
  G5=loadImage("G5.jpg");
  G6=loadImage("G6.jpg");
  G7=loadImage("G7.jpg");
  G8=loadImage("G8.jpg");
  G9=loadImage("G9.jpg");
  G10=loadImage("G10.jpg");
  G11=loadImage("G11.jpg");
  G12=loadImage("G12.jpg");
}
 void draw(){
background(0);
  if (mouseX<125 && mouseY<height){
   image(G1,0,0,125,height);
  }else if(mouseX<250 && mouseX>125 && mouseY<height){
     image(G2,125,0,125,height);
  }else if(mouseX<375 && mouseX>250 && mouseY<height){
    image(G3,250,0,125,height);
  }else if(mouseX<500 && mouseX>375 && mouseY<height){
    image(W1,375,0,125,height);
    }else if(mouseX<625 && mouseX>500 && mouseY<height){
    image(G4,500,0,125,height);
    }else if(mouseX<750 && mouseX>625 && mouseY<height){
   image(G5,625,0,125,height);
  }else if(mouseX<875 && mouseX>750 && mouseY<height){
    image(G6,750,0,125,height);
   }else if(mouseX<1000 && mouseX>875 && mouseY<height){
   image(W2,875,0,125,height);
    }else if(mouseX<1125 && mouseX>1000 && mouseY<height){
   image(G7,1000,0,125,height);
    }else if(mouseX<1250 && mouseX>1125 && mouseY<height){
   image(G8,1125,0,125,height);
   }else if(mouseX<1375 && mouseX>1250 && mouseY<height){
   image(G9,1250,0,125,height);
    }else if(mouseX<1500 && mouseX>1375 && mouseY<height){
   image(W3,1375,0,125,height);
   }else if(mouseX<1625 && mouseX>1500 && mouseY<height){
   image(G10,1500,0,125,height);
    }else if(mouseX<1750 && mouseX>1625 && mouseY<height){
   image(G11,1625,0,125,height);
    }else if(mouseX<1875 && mouseX>1750 && mouseY<height){
   image(G12,1750,0,125,height);
   }else if(mouseX<2000 && mouseX>1875 && mouseY<height){
   image(W4,1875,0,125,height);
  } 
  }



