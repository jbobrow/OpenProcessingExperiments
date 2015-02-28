
void mouseClicked(){
  reset();
}

void keyTyped(){
  if(key==' ')
    reset();
  if(key=='c')
    useColors = !useColors;
  
  if(key=='b')
    invertColors = !invertColors;

  if(key=='g')
    instantGrow = !instantGrow;

  if(key=='p')
    pause = !pause;
}

