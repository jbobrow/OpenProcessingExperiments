
ArrayList imgList;
PShape img1, img2, img3, img4, img5, img6, img7, img8, img9;
PShape dotBackground;

import processing.pdf.*;
boolean record = false;
boolean paused = false;
  
  triPerson [] triCollection = new triPerson[40];
color [] palette = {
  //#80314C, #B7504F, #F8BE63, #C7C58B, #FEFCB1, #024357, #598574, #355265, #9DAD83
  #664B31, #EB5E91, #EB391F, #EB891B, #A47D34, #5F9898, #93C1AE, #727D76, #CED8D6

};


void setup()
{
  size(600, 400);
  frameRate(30);
  background(#ffffff);
  smooth();
  
   img1 = loadShape("art_01.svg");
   img2 = loadShape("art_02.svg");
   img3 = loadShape("art_03.svg");
   img5 = loadShape("art_08.svg");
   img6 = loadShape("art_06.svg");
   img8 = loadShape("art_08.svg");
   
   img1.disableStyle();
   img2.disableStyle();
   img3.disableStyle();
   img5.disableStyle();
   img6.disableStyle();
   img8.disableStyle();
   
   
   imgList = new ArrayList();
   imgList.add(img1);
   imgList.add(img2);
   imgList.add(img3);
   imgList.add(img5);
   imgList.add(img6);
   imgList.add(img8);
   
   dotBackground = loadShape("background.svg");

  for (int i = 0; i < triCollection.length; i++) {
    triCollection[i] = new triPerson(random(0, width), random(0, height));
    //triCollection[i] = color(palette[(int)random(palette.length)]);
  }
  
}

void draw() {
  if (record) {
    beginRecord(PDF, "filename-####.pdf");
  }
  
  background(#FFFFFF);
  
  shape(dotBackground, 0, 0, 300, 300);
  shape(dotBackground, 300, 0, 300, 300);
  shape(dotBackground, 0, 300, 300, 300);
  shape(dotBackground, 300, 300, 300, 300);
  
  for (int i = 0; i < triCollection.length; i++) {
    triCollection[i].run();
  }
  
  if (record) {
    endRecord();
    record = false;
  }
}


