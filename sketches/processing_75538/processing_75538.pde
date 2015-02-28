
int lastKey = 0;
int currentKey = 0;

void setup () {

  size (500, 500);
}

void draw () {
  int i = 1;
  int j = 1;

  background (0);
  fill (255);
  textAlign (CENTER);

  while (i < 10) {

    while (j < 10) {

      fill(255);
      if ((i == 1) && (j == lastKey)) { 
        fill(0, 200, 0);
      }
      else if ((j == 1) && (i == currentKey)) { 
        fill(0, 200, 0);
      }
      else if ( (i == currentKey) && (j == lastKey) ) {
        fill (200, 0, 0);
      }
      else if ( ((i == 1) || (j == 1)) && (i == lastKey) && (j == currentKey) ) {
        fill (200, 0, 0);
      }
      
      text (i*j, i*50, j*50);
      j++;
    }

    j = 1;
    i++;
  }
  
  if ((lastKey == 1) && (currentKey == 1)) {
    fill (200, 0, 0);
    text (1, 50, 50);
  }
}



//49-57,97-105


void keyReleased () {

  if ((keyCode >=49) && (keyCode <= 57)) {  
    lastKey = currentKey;
    currentKey = keyCode-48;
  }

  if ((keyCode >=97) && (keyCode <= 105)) {  
    lastKey = currentKey;
    currentKey = keyCode-96;
  }

  println("lastKey = "+lastKey);
  println("currentKey = "+currentKey);
}


