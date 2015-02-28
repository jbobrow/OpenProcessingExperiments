
void keyPressed() {
  range = constrain(rangeCount,0,125);
  if (keyCode==UP) {
    rangeCount+=1;
  }
  if (keyCode==DOWN) {
     rangeCount-=1;
  }
  if (keyCode==RIGHT) {
    noiseValue+=0.001;
  }
  if (keyCode==LEFT) {
    noiseValue-=0.001;
  } 
}


