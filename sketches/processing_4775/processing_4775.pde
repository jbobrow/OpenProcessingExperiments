
void mouseClicked(){
  resetPartial();
}

void keyTyped(){
  if(key == '-')
    growthScaling = growthScaling/1.2;
  if(key == '=')
    growthScaling = growthScaling*1.2;

  if(key == '[')
    deltaRandomR = deltaRandomR/1.2;
  if(key == ']')
    deltaRandomR = deltaRandomR*1.2;
    
  if(key == ' ')
    resetPartial();
  if(key == 'r')
    reset();
}

//vary: strokeColor
//      growthScaling
//      deltaRandomR
//      nPoints
//      
//      

