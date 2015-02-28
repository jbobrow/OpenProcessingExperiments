
//claire gustavson, section A, copywrite 2012.
float myValue;
int value = 100;
void setup() {
  size (400, 400);
  background (255, 255, 200);
  textSize (1);
  textAlign (CENTER);
 
   
  
}

void draw () {
  
  fill (255, 255-value, value, 25);
 rect (0,0,400, 400);
  sluts();
}

void sluts () {
  smooth ();
 
  fill((random (200)), value , 250);
  text ("Girls Just Wanna Have FUN!",mouseX, mouseY);
}


void mouseClicked () {
  
  float f;
  f=map(myValue, 1, 900, 0, 1);
  if (myValue >900) {
    myValue=1;
  } 
  else {
    myValue = myValue+10;
  }
  //textSize (f*100+1);
  textSize(myValue);
}

void keyPressed() {
  if (value == 100) {
    value = 250;
  } else {
    value = 100;
  }
}

