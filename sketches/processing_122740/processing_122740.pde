
PImage nic1;
PImage nic2;
PImage nic3;
PImage nic4;
PImage nic5;
PImage nic6;
PImage currentPic;

int rValue = 255;
int gValue = 255;
int bValue = 255;

float picSize = 3;
boolean eraserClicked = false;

void setup(){
  size(800,600);
  nic1 = loadImage("NC1.png");
  nic2 = loadImage("NC2.png");
  nic3 = loadImage("NC3.png");
  nic4 = loadImage("NC4.png");
  nic5 = loadImage("NC5.png");
  nic6 = loadImage("NC6.png");
  currentPic = nic1;
  noTint();
  
  //instructions
  textSize(20);
  fill(0, 102, 153, 150);
  text("Eraser", 100, 30);
  text("Choose a face", 70, 100);
  text("255", 70, 380);
  text("Select RGB", 80, 460);
  text("values here", 80, 490);
  text("0", 70, 580);
  fill(0, 102, 153);
  textSize(56);
  text("DRAW!", 350, 300);
  
}

void draw(){
  
  //Eraser Selection
  noFill();
  stroke(0);
  ellipse(80,20,30,30);
  
  //Swatches
  int r;
  r = 20;
  noStroke();
  int rshade = 255;
  int gshade = 255;
  int bshade = 255;
  int currentY;
  int clickedY;
  
  //Color choice
  color currentColor = color(rValue, gValue, bValue);

  
  if (mousePressed) {
    //If eraser clicked
    if ((mouseX < 90) && (mouseX > 60)){
      if (mouseY < 30){
        eraserClicked = true;
      }
    }
    //Choosing faces
    if (mouseX < 60) {
      if (mouseY < 50) {
        currentPic = nic5;
        eraserClicked = false;
      }
      if ((mouseY > 49) && (mouseY < 100)){
        currentPic = nic2;
        eraserClicked = false;
      }
      if ((mouseY > 99) && (mouseY < 150)){
        currentPic = nic1;
        eraserClicked = false;
      }
      if ((mouseY > 149) && (mouseY < 200)){
        currentPic = nic4;
        eraserClicked = false;
      }
      if ((mouseY > 199) && (mouseY < 250)){
        currentPic = nic6;
        eraserClicked = false;
      }
      if ((mouseY > 249) && (mouseY < 300)){
        currentPic = nic3;
        eraserClicked = false;
      }
      //RGB selection
      //1st Row
      if ((mouseY > 360) && (mouseY < 360+r)){
        if((mouseX > 0) && (mouseX < r)){
          rValue = 255;
        }
        if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 255;
        }
        if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 255;  
        }
      }
      //2nd row
      if ((mouseY > 360+r-1) && (mouseY < 360+r*2)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 230;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 230;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 230;
       }
     }
     //3rd row
     if ((mouseY > 360+r*2-1) && (mouseY < 360+r*3)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 205;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 205;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 205;
       }
     }
     //4th row
     if ((mouseY > 360+r*3-1) && (mouseY < 360+r*4)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 180;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 180;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 180;
       }
     }
     //5th row
     if ((mouseY > 360+r*4-1) && (mouseY < 360+r*5)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 155;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 155;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 155;
       }
     }
     //6th row
     if ((mouseY > 360+r*5-1) && (mouseY < 360+r*6)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 130;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 130;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 130;
       }
     }
      //7th row
     if ((mouseY > 360+r*6-1) && (mouseY < 360+r*7)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 105;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 105;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 105;
       }
     }
      //8th row
     if ((mouseY > 360+r*7-1) && (mouseY < 360+r*8)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 80;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 80;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 80;
       }
     }
      //9th row
     if ((mouseY > 360+r*8-1) && (mouseY < 360+r*9)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 55;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 55;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 55;
       }
     }
      //10th row
     if ((mouseY > 360+r*9-1) && (mouseY < 360+r*10)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 30;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 30;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 30;
       }
     }
     //11th row
     if ((mouseY > 360+r*10-1) && (mouseY < 360+r*11)){
       if((mouseX > 0) && (mouseX < r)){
          rValue = 5;
       }
       if((mouseX > r-1) && (mouseX < r*2)){
          gValue = 5;
       }
       if((mouseX > r*2-1) && (mouseX < r*3)){
          bValue = 5;
       }
     }
   }
   
   //Eraser
   if (eraserClicked == true){
     fill(205);
     noStroke();
     ellipse(mouseX,mouseY,30,30);
   }
   
    //if clicked outside of the selection boxes
    if (mouseX > 59) {
      if (eraserClicked == false){
       tint(currentColor);
       image(currentPic, mouseX-((currentPic.width/picSize)/2), mouseY-((currentPic.height/picSize)/2),currentPic.width/picSize,currentPic.height/picSize);
      }
    }
  }
  
  
  for(int y = 360; y < 570; y += r) {
    for(int x = 0; x < 60; x += r){
      if(x < 20){
        fill(rshade,0,0);
        rshade -= 30;
      }
      if((x > 19) && (x < 40)){
        fill(0,gshade,0);
        gshade -= 30;
      }
      if((x >39) && (x < 60)){ 
        fill(0,0,bshade);
        bshade -= 30;
      }
    rect(x,y,r,r);
   
    }
  }
  
  
  //Cage face minis
  noTint();
  image(nic5,0,0,nic5.width/5,nic5.height/5);
  image(nic2,0,50,nic2.width/5,nic2.height/5);
  image(nic1,0,100,nic1.width/5,nic1.height/5);
  image(nic4,0,150,nic4.width/5,nic4.height/5);
  image(nic6,0,200,nic6.width/5,nic6.height/5);
  image(nic3,0,250,nic3.width/5,nic3.height/5);
  
  //hue box
  noStroke();
  fill(currentColor);
  rect(0,300,60,60);
  

    
}



