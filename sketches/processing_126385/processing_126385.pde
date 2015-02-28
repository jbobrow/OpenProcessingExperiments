
/*@pjs preload="1.png";*/
/*@pjs preload="2.png";*/
/*@pjs preload="3.png";*/
/*@pjs preload="4.png";*/
/*@pjs preload="5.png";*/
/*@pjs preload="6.png";*/
/*@pjs preload="7.png";*/
/*@pjs preload="8.png";*/
/*@pjs preload="9.png";*/

//imageNo
PImage i1; 
PImage i2; 
PImage i3; 
PImage i4; 
PImage i5; 
PImage i6; 
PImage i7; 
PImage i8; 
PImage i9;
//clickFlag
int c11 = 0; 
int c12 = 0; 
int c13 = 0; 
int c21 = 0; 
int c22 = 0; 
int c23 = 0; 
int c31 = 0; 
int c32 = 0; 
int c33 = 0; 

void setup(){
  size(450, 450);
  background(100,100,255);
  smooth();
  //load Image
  i1 = loadImage("1.png");
  i2 = loadImage("2.png");
  i3 = loadImage("3.png");
  i4 = loadImage("4.png");
  i5 = loadImage("5.png");
  i6 = loadImage("6.png");
  i7 = loadImage("7.png");
  i8 = loadImage("8.png");
  i9 = loadImage("9.png");
  //image Color
  tint(255, 255, 255, 255);
  //rect Color
  fill(100,100,255);
}

void draw(){
  //draw line
  for(int y=0; y<=450; y+=150){
      line(0, y, 450, y); 
    }
  for(int x=0; x<=450; x+=150){
      line(x, 0, x, 450); 
  }
}

void mouseClicked(){
  //1,1
  if(mouseX>=0 && mouseX<=150 && mouseY>=0 && mouseY<=150){
    //println ("Mouse Click 1,1");
    if(c11 == 9){
      rect(0,0,150,150);
      c11 = 0;
    }
    else if(c11 == 8){
      rect(0,0,150,150);
      image(i9,0,0);
      c11 ++; 
    }
    else if(c11 == 7){
      rect(0,0,150,150);
      image(i8,0,0);
      c11 ++;
    }
    else if(c11 == 6){
      rect(0,0,150,150);
      image(i7,0,0);
      c11 ++;
    }
    else if(c11 == 5){
      rect(0,0,150,150);
      image(i6,0,0);
      c11 ++;
    }
    else if(c11 == 4){
      rect(0,0,150,150);
      image(i5,0,0);
      c11 ++;
    }
    else if(c11 == 3){
      rect(0,0,150,150);
      image(i4,0,0);
      c11 ++;
    }
    else if(c11 == 2){
      rect(0,0,150,150);
      image(i3,0,0);
      c11 ++;
    }
    else if(c11 == 1){
      rect(0,0,150,150);
      image(i2,0,0);
      c11 ++;
    }
    else if(c11 == 0){
      rect(0,0,150,150);
      image(i1,0,0);
      c11 ++;
    }
  } 
    //1,2
  if(mouseX>=151 && mouseX<=300 && mouseY>=0 && mouseY<=150){
    //println ("Mouse Click 1,2");
        if(c12 == 9){
      rect(151,0,150,150);
      c12 = 0;
    }
    else if(c12 == 8){
      rect(151,0,150,150);
      image(i9,151,0);
      c12 ++; 
    }
    else if(c12 == 7){
      rect(151,0,150,150);
      image(i8,151,0);
      c12 ++;
    }
    else if(c12 == 6){
      rect(151,0,150,150);
      image(i7,151,0);
      c12 ++;
    }
    else if(c12 == 5){
      rect(151,0,150,150);
      image(i6,151,0);
      c12 ++;
    }
    else if(c12 == 4){
      rect(151,0,150,150);
      image(i5,151,0);
      c12 ++;
    }
    else if(c12 == 3){
      rect(151,0,150,150);
      image(i4,151,0);
      c12 ++;
    }
    else if(c12 == 2){
      rect(151,0,150,150);
      image(i3,151,0);
      c12 ++;
    }
    else if(c12 == 1){
      rect(151,0,150,150);
      image(i2,151,0);
      c12 ++;
    }
    else if(c12 == 0){
      rect(151,0,150,150);
      image(i1,151,0);
      c12 ++;
    }
  } 
    //1,3
  if(mouseX>=301 && mouseX<=450 && mouseY>=0 && mouseY<=150){
    //println ("Mouse Click 1,3");
        if(c13 == 9){
      rect(301,0,150,150);
      c13 = 0;
    }
    else if(c13 == 8){
      rect(301,0,150,150);
      image(i9,301,0);
      c13 ++; 
    }
    else if(c13 == 7){
      rect(301,0,150,150);
      image(i8,301,0);
      c13 ++;
    }
    else if(c13 == 6){
      rect(301,0,150,150);
      image(i7,301,0);
      c13 ++;
    }
    else if(c13 == 5){
      rect(301,0,150,150);
      image(i6,301,0);
      c13 ++;
    }
    else if(c13 == 4){
      rect(301,0,150,150);
      image(i5,301,0);
      c13 ++;
    }
    else if(c13 == 3){
      rect(301,0,150,150);
      image(i4,301,0);
      c13 ++;
    }
    else if(c13 == 2){
      rect(301,0,150,150);
      image(i3,301,0);
      c13 ++;
    }
    else if(c13 == 1){
      rect(301,0,150,150);
      image(i2,301,0);
      c13 ++;
    }
    else if(c13 == 0){
      rect(301,0,150,150);
      image(i1,301,0);
      c13 ++;
    }
  } 
    //2,1
  if(mouseX>=0 && mouseX<=150 && mouseY>=151 && mouseY<=300){
    //println ("Mouse Click 2,1");
        if(c21 == 9){
      rect(0,151,150,150);
      c21 = 0;
    }
    else if(c21 == 8){
      rect(0,151,150,150);
      image(i9,0,151);
      c21 ++; 
    }
    else if(c21 == 7){
      rect(0,151,150,150);
      image(i8,0,151);
      c21 ++;
    }
    else if(c21 == 6){
      rect(0,151,150,150);
      image(i7,0,151);
      c21 ++;
    }
    else if(c21 == 5){
      rect(0,151,150,150);
      image(i6,0,151);
      c21 ++;
    }
    else if(c21 == 4){
      rect(0,151,150,150);
      image(i5,0,151);
      c21 ++;
    }
    else if(c21 == 3){
      rect(0,151,150,150);
      image(i4,0,151);
      c21 ++;
    }
    else if(c21 == 2){
      rect(0,151,150,150);
      image(i3,0,151);
      c21 ++;
    }
    else if(c21 == 1){
      rect(0,151,150,150);
      image(i2,0,151);
      c21 ++;
    }
    else if(c21 == 0){
      rect(0,151,150,150);
      image(i1,0,151);
      c21 ++;
    }
  } 
    //2,2
  if(mouseX>=151 && mouseX<=300 && mouseY>=151 && mouseY<=300){
    //println ("Mouse Click 2,2");
        if(c22 == 9){
      rect(151,151,150,150);
      c22 = 0;
    }
    else if(c22 == 8){
      rect(151,151,150,150);
      image(i9,151,151);
      c22 ++; 
    }
    else if(c22 == 7){
      rect(151,151,150,150);
      image(i8,151,151);
      c22 ++;
    }
    else if(c22 == 6){
      rect(151,151,150,150);
      image(i7,151,151);
      c22 ++;
    }
    else if(c22 == 5){
      rect(151,151,150,150);
      image(i6,151,151);
      c22 ++;
    }
    else if(c22 == 4){
      rect(151,151,150,150);
      image(i5,151,151);
      c22 ++;
    }
    else if(c22 == 3){
      rect(151,151,150,150);
      image(i4,151,151);
      c22 ++;
    }
    else if(c22 == 2){
      rect(151,151,150,150);
      image(i3,151,151);
      c22 ++;
    }
    else if(c22 == 1){
      rect(151,151,150,150);
      image(i2,151,151);
      c22 ++;
    }
    else if(c22 == 0){
      rect(151,151,150,150);
      image(i1,151,151);
      c22 ++;
    }
  } 
    //2,3
  if(mouseX>=301 && mouseX<=450 && mouseY>=151 && mouseY<=300){
    //println ("Mouse Click 2,3");
        if(c23 == 9){
      rect(301,151,150,150);
      c23 = 0;
    }
    else if(c23 == 8){
      rect(301,151,150,150);
      image(i9,301,151);
      c23 ++; 
    }
    else if(c23 == 7){
      rect(301,151,150,150);
      image(i8,301,151);
      c23 ++;
    }
    else if(c23 == 6){
      rect(301,151,150,150);
      image(i7,301,151);
      c23 ++;
    }
    else if(c23 == 5){
      rect(301,151,150,150);
      image(i6,301,151);
      c23 ++;
    }
    else if(c23 == 4){
      rect(301,151,150,150);
      image(i5,301,151);
      c23 ++;
    }
    else if(c23 == 3){
      rect(301,151,150,150);
      image(i4,301,151);
      c23 ++;
    }
    else if(c23 == 2){
      rect(301,151,150,150);
      image(i3,301,151);
      c23 ++;
    }
    else if(c23 == 1){
      rect(301,151,150,150);
      image(i2,301,151);
      c23 ++;
    }
    else if(c23 == 0){
      rect(301,151,150,150);
      image(i1,301,151);
      c23 ++;
    }
  } 
    //3,1
  if(mouseX>=0 && mouseX<=150 && mouseY>=301 && mouseY<=450){
    //println ("Mouse Click 3,1");
        if(c31 == 9){
      rect(0,301,150,150);
      c31 = 0;
    }
    else if(c31 == 8){
      rect(0,301,150,150);
      image(i9,0,301);
      c31 ++; 
    }
    else if(c31 == 7){
      rect(0,301,150,150);
      image(i8,0,301);
      c31 ++;
    }
    else if(c31 == 6){
      rect(0,301,150,150);
      image(i7,0,301);
      c31 ++;
    }
    else if(c31 == 5){
      rect(0,301,150,150);
      image(i6,0,301);
      c31 ++;
    }
    else if(c31 == 4){
      rect(0,301,150,150);
      image(i5,0,301);
      c31 ++;
    }
    else if(c31 == 3){
      rect(0,301,150,150);
      image(i4,0,301);
      c31 ++;
    }
    else if(c31 == 2){
      rect(0,301,150,150);
      image(i3,0,301);
      c31 ++;
    }
    else if(c31 == 1){
      rect(0,301,150,150);
      image(i2,0,301);
      c31 ++;
    }
    else if(c31 == 0){
      rect(0,301,150,150);
      image(i1,0,301);
      c31 ++;
    }
  } 
    //3,2
  if(mouseX>=151 && mouseX<=300 && mouseY>=301 && mouseY<=450){
    //println ("Mouse Click 3,2");
        if(c32 == 9){
      rect(151,301,150,150);
      c32 = 0;
    }
    else if(c32 == 8){
      rect(151,301,150,150);
      image(i9,151,301);
      c32 ++; 
    }
    else if(c32 == 7){
      rect(151,301,150,150);
      image(i8,151,301);
      c32 ++;
    }
    else if(c32 == 6){
      rect(151,301,150,150);
      image(i7,151,301);
      c32 ++;
    }
    else if(c32 == 5){
      rect(151,301,150,150);
      image(i6,151,301);
      c32 ++;
    }
    else if(c32 == 4){
      rect(151,301,150,150);
      image(i5,151,301);
      c32 ++;
    }
    else if(c32 == 3){
      rect(151,301,150,150);
      image(i4,151,301);
      c32 ++;
    }
    else if(c32 == 2){
      rect(151,301,150,150);
      image(i3,151,301);
      c32 ++;
    }
    else if(c32 == 1){
      rect(151,301,150,150);
      image(i2,151,301);
      c32 ++;
    }
    else if(c32 == 0){
      rect(151,301,150,150);
      image(i1,151,301);
      c32 ++;
    }
  } 
    //3,3
  if(mouseX>=301 && mouseX<=450 && mouseY>=301 && mouseY<=450){
    //println ("Mouse Click 3,3");
        if(c33 == 9){
      rect(301,301,150,150);
      c33 = 0;
    }
    else if(c33 == 8){
      rect(301,301,150,150);
      image(i9,301,301);
      c33 ++; 
    }
    else if(c33 == 7){
      rect(301,301,150,150);
      image(i8,301,301);
      c33 ++;
    }
    else if(c33 == 6){
      rect(301,301,150,150);
      image(i7,301,301);
      c33 ++;
    }
    else if(c33 == 5){
      rect(301,301,150,150);
      image(i6,301,301);
      c33 ++;
    }
    else if(c33 == 4){
      rect(301,301,150,150);
      image(i5,301,301);
      c33 ++;
    }
    else if(c33 == 3){
      rect(301,301,150,150);
      image(i4,301,301);
      c33 ++;
    }
    else if(c33 == 2){
      rect(301,301,150,150);
      image(i3,301,301);
      c33 ++;
    }
    else if(c33 == 1){
      rect(301,301,150,150);
      image(i2,301,301);
      c33 ++;
    }
    else if(c33 == 0){
      rect(301,301,150,150);
      image(i1,301,301);
      c33 ++;
    }
  } 
}


