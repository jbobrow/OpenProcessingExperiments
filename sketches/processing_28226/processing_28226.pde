
void Slide(){
  if(mouseX>777 && mouseX<877 && mouseY<590 && slide==1 ) {
    chapterX=chapterX-6;
  }
  if(chapterX<-797 && slide==1) {
    delay(700);
    chapterX=-797;
    slide=2;
  }
  if(mouseX>777 && mouseX<877 && mouseY<590 && slide==2) {
    chapterX=chapterX-6;
  }
  if(chapterX<-1674 && slide==2) {
    delay(700);
    chapterX=-1674;
    slide=3;
  }
  if(mouseX>777 && mouseX<877 && mouseY<590 && slide==3) {
    chapterX=chapterX-6;
  }
  if(chapterX<-2551 && slide==3) {
    delay(700);
    chapterX=-2551;
    slide=4;
  }
  ///// reverse////
  if(mouseX<100 && mouseX>0  && mouseY<590 && slide==2 ) {
    chapterX=chapterX+6;
  }
  if(chapterX>80 && slide==2) {
    delay(700);
    chapterX=80;
    slide=1;
  }
  if(mouseX<100 && mouseX>0  && mouseY<590 && slide==3) {
    chapterX=chapterX+6;
  }
  if(chapterX>-797 && slide==3) {
    delay(700);
    chapterX=-797;
    slide=2;
  }
  if(mouseX<100 && mouseX>0 && mouseY<590 && slide==4) {
    chapterX=chapterX+6;
  }
  if(chapterX>-1674 && slide==4) {
    delay(700);
    chapterX=-1674;
    slide=3;
  }
}


