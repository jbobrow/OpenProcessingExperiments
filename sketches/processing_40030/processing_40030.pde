
boolean pressed3;
boolean pressed4;
boolean pressed8;
boolean pressed9;
boolean buttOff;
int  buttW;
int  buttH;
int y1, y2;
int x1, x2, x3, x4, x5;
boolean buttons [];



//------------------------------------
void setup() {
  size(800, 400);
  buttOff = true;
  buttH = buttW = 100;

  buttons= new boolean [10]; 

  for (int i=0; i<5; i++) {
    buttons [i]= false;
  }

  for (int i=5; i<10; i++) {
    buttons [i]= true;
  }

  x1=50;
  x2=200;
  x3= 350;
  x4= 500;
  x5= 650;
  y1= 50;
  y2= 200;
  pressed3= false;
  pressed4= false;
  pressed8= false;
  pressed9= false;
}



//------------------------------------
void mousePressed() {
  if ((mouseX > x1) && (mouseX < x1+100)  && 
    (mouseY > y1) && (mouseY < y1+100)) {
    buttons [0] = ! buttons [0];
  }

  if ((mouseX > x1) && (mouseX < x1+100)  && 
    (mouseY > y2) && (mouseY < y2+100)) {
    buttons [5] = ! buttons [5];
  }

  if ((mouseX > x3) && (mouseX < x3+100)  && 
    (mouseY > y1) && (mouseY < y1+100)) {
    buttons [2] = ! buttons [2];
  }
  if ((mouseX > x3) && (mouseX < x3+100)  && 
    (mouseY > y2) && (mouseY < y2+100)) {
    buttons [7] = ! buttons [7];
  }

  if ((mouseX > x4) && (mouseX < x4+100)  && 
    (mouseY > y1) && (mouseY < y1+100)) {
    if (pressed3 == false) {
      buttons [3] = ! buttons [3];
      pressed3 = true;
    }
  }

  if ((mouseX > x4) && (mouseX < x4+100)  && 
    (mouseY > y2) && (mouseY < y2+100)) {
    if (pressed8 == false) {
      buttons [8] = ! buttons [8];
      pressed8 = true;
    }
  }
}


void mouseReleased() {
  if ((mouseX > x2) && (mouseX < x2+100)  && 
    (mouseY > y1) && (mouseY < y1+100)) {
    buttons [1] = ! buttons [1];
  }

  if ((mouseX > x2) && (mouseX < x2+100)  && 
    (mouseY > y2) && (mouseY < y2+100)) {
    buttons [6] = ! buttons [6];
  }

  if ((mouseX > x3) && (mouseX < x3+100)  && 
    (mouseY > y1) && (mouseY < y1+100)) {
    buttons [2] = ! buttons [2];
  }

  if ((mouseX > x3) && (mouseX < x3+100)  && 
    (mouseY > y2) && (mouseY < y2+100)) {
    buttons [7] = ! buttons [7];
  }

  if ((mouseX > x5) && (mouseX < x5+100)  && 
    (mouseY > y1) && (mouseY < y1+100)) {
    if (pressed4 == false) {
      buttons [4] = ! buttons [4];
      pressed4 = true;
    }
  }

  if ((mouseX > x5) && (mouseX < x5+100)  && 
    (mouseY > y2) && (mouseY < y2+100)) {
    if (pressed9 == false) {
      buttons [9] = ! buttons [9];
      pressed9 = true;
    }
  }
}
//------------------------------------
void draw() {
  background(128);
  color onColor   = color(255);  
  color offColor  = color(0);


  //button0
  color whatColorToUse = (buttons[0]) ? onColor :offColor;
  fill (whatColorToUse ); 
  rect(x1, y1, buttW, buttH);

  //button1
  whatColorToUse = (buttons[1]) ? onColor :offColor;
  fill (whatColorToUse);
  rect( x2, y1, buttW, buttH);

  //button2
  whatColorToUse = (buttons[2]) ? onColor :offColor;
  fill (whatColorToUse);
  rect(x3, y1, buttW, buttH);

  //button3
  whatColorToUse = (buttons[3]) ? onColor :offColor;
  fill (whatColorToUse);
  rect( x4, y1, buttW, buttH);

  //button4
  whatColorToUse = (buttons[4]) ? onColor :offColor;
  fill (whatColorToUse);
  rect(x5, y1, buttW, buttH);

  //button5
  whatColorToUse = (buttons[5]) ? onColor :offColor;
  fill (whatColorToUse);
  rect( x1, y2, buttW, buttH);

  //button6
  whatColorToUse = (buttons[6]) ? onColor :offColor;
  fill (whatColorToUse);
  rect(x2, y2, buttW, buttH);

  //button7
  whatColorToUse = (buttons[7]) ? onColor :offColor;
  fill (whatColorToUse );
  rect( x3, y2, buttW, buttH);

  //button8
  whatColorToUse = (buttons[8]) ? onColor :offColor;
  fill (whatColorToUse);
  rect(x4, y2, buttW, buttH);

  //button9
  whatColorToUse = (buttons[9]) ? onColor :offColor;
  fill (whatColorToUse);
  rect( x5, y2, buttW, buttH);
}
                
                
