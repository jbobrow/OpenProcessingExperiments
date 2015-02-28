
void setColors() {
  colorMode(HSB,360,100,100,100);
  backEraseTotal = color(0,0,85,100);
  backErase = color(0,0,85,60);
  calm = color(244,50,45,4);
  excitedSmall = color(37,100,100,8);
  excitedBig = color(0,0,0,100);
}

void acModeNew() {
  int acModeOld = acMode;
      acMode = int(random(-.5,2.5));
      if (acMode == acModeOld) {
        acModeNew();
      }
}

void sModeNew() {
  int sModeOld = sMode;
  sMode = int(random(-.5,2.5));
      if (sMode == sModeOld) {
        sModeNew();
      }
}

void symmSide() {
  fill(calm);
  
  if (sMode==0) {
  rect(width - symmetryProperty1, symmetryProperty2 * 7/8, symmetryProperty1, symmetryProperty1 );
  }
  
  if (sMode==1) {
  rect(width - symmetryProperty1, symmetryProperty4, symmetryProperty1, symmetryProperty1 );
  }
  
  if (sMode==2) {
rect(width - symmetryProperty1-50, symmetryProperty3, symmetryProperty1, symmetryProperty1 );
  }
  
}


/*
void rapidFire() {

  if (drawingMode == 0) {
    drawingMode = 1;
    //change the properties of our drawing, but *only* when we switch modes (not every frame!)
//    changeSymmetricComposition();

  } 
  else if (drawingMode == 1) {
    drawingMode = 0;
    //change the properties of our drawing, but *only* when we switch modes (not every frame!)
//    changeAsymmetricComposition();
  }
}

/*
void mouseReleased() {
  if (erase ==1) {
    erase=0;
  }
  if (erase ==0) {
    erase=1;
  }
}

void theEraser() {
  if (erase==1) {
    fill(back);
    rect(width/2,height/2,width,height);
  }
}



void reverseMode(int m) {
  if (m==0) {
    m=1;
  }
  else if (m==1) {
    m=0;
  }
}
*/

