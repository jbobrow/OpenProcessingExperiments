
int value= 230;
float valueB= 2;



void mousePressed() {
  if (mouseButton == LEFT && value <255){

    value = value+7;
  }
  else if (mouseButton == RIGHT && value < 255) {
    value = value;
  }

  else {
    value = value=0+1 ;
  }

 if(mouseButton == RIGHT && valueB <10) {
    valueB =valueB+0.5;
  }

  else if(mouseButton == LEFT && valueB<10){
    valueB= valueB;
  }

  else {
    valueB = valueB=0 ;
  }    


}



