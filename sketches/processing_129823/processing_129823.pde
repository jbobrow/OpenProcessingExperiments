
float blockW = 80;

boolean button = false;

int x = 18;
int y = 660;
int w = 20;
int h = 20;
PImage title;
PImage spinBG;
PImage spinBGw;
PImage spin01;
PImage spin01w;
PImage spin02;
PImage spin02w;
PImage spin03;
PImage spin03w;
PImage spin04;
PImage spin04w;
PImage spin05;
PImage spin05w;
PImage spin06;
PImage spin06w;
PImage spin07;
PImage spin07w;

void setup() {
  size(700,700);
  title= loadImage("title.jpg");
  spinBG= loadImage("spinBG.jpg");
  spinBGw= loadImage("spinBGw.jpg"); 
  spin01= loadImage("spin01.jpg");
  spin01w= loadImage("spin01w.jpg");
  spin02= loadImage("spin02.jpg");
  spin03= loadImage("spin03.jpg");
  spin04= loadImage("spin04.jpg");
  spin05= loadImage("spin05.jpg");
  spin06= loadImage("spin06.jpg");
  spin07= loadImage("spin07.jpg");
  spin02w= loadImage("spin02w.jpg");
  spin03w= loadImage("spin03w.jpg");
  spin04w= loadImage("spin04w.jpg");
  spin05w= loadImage("spin05w.jpg");
  spin06w= loadImage("spin06w.jpg");
  spin07w= loadImage("spin07w.jpg");
  
}

void draw() {
  image(spinBG,0,0);
  //1
  if (button && mouseX >= 1 && mouseX <= blockW) {
    image(spinBGw,0,0);
  }
  //2 
  else if (button && mouseX >= blockW && mouseX <= blockW*2) {
    image(spin01w,0,0);
  }
  //3
   else if (button && mouseX >= blockW*2 && mouseX <= blockW*3) { 
    image(spin02w,0,0);
  }
  //4
  else if (button && mouseX >= blockW*3 && mouseX <= blockW*4) { 
    image(spin03w,0,0);
  }
  //5
  else if (button && mouseX >= blockW*4 && mouseX <= blockW*5) { 
    image(spin04w,0,0);
  }
  //6
  else if (button && mouseX >= blockW*5 && mouseX <= blockW*6) { 
    image(spin05w,0,0);
  }
  //7
  else if (button && mouseX >= blockW*6 && mouseX <= blockW*7) { 
    image(spin06w,0,0);
  }
  
   //8
  else if (button && mouseX >= blockW*7 && mouseX <= blockW*8) { 
    image(spin07w,0,0);
  }
  
     //9
  else if (button && mouseX >= blockW*8 && mouseX <= blockW*9) { 
    image(spinBGw,0,0);
  }
  
     /*/10
  else if (button && mouseX >= blockW*9 && mouseX <= blockW*10) { 
    image(spin01w,0,0);
  }
  
     //11
  else if (button && mouseX >= blockW*10 && mouseX <= blockW*11) { 
    image(spin02w,0,0);
  }
  
     //12
  else if (button && mouseX >= blockW*11 && mouseX <= blockW*12) { 
    image(spin03w,0,0);
  }
  
     //13
  else if (button && mouseX >= blockW*12 && mouseX <= blockW*13) { 
    image(spin04w,0,0);
  }
  
     //14
  else if (button && mouseX >= blockW*13 && mouseX <= blockW*14) { 
    image(spin05w,0,0);
  }
  
     //15
  else if (button && mouseX >= blockW*14 && mouseX <= blockW*15) { 
    image(spin06w,0,0);
  }
  
  
     //16
  if (button && mouseX >= blockW*15 && mouseX <= blockW*16) { 
    image(spin07w,0,0);
  }
  
     //17
  if (button && mouseX >= blockW*16 && mouseX <= blockW*17) { 
    image(spinBGw,0,0);
  }
  
     //8
  else if (button && mouseX >= blockW*17 && mouseX <= blockW*18) { 
    image(spin07w,0,0);
  }
  */
  // no info
  else if (mouseX >= 1 && mouseX <= blockW) {
    image(spinBG,0,0);
  }
  else if (mouseX >= blockW && mouseX <= blockW*2) {
    image(spin01,0,0);
  }
  //3
 else if (mouseX >= blockW*2 && mouseX <= blockW*3) { 
    image(spin02,0,0);
  }
  //4
 else if (mouseX >= blockW*3 && mouseX <= blockW*4) { 
    image(spin03,0,0);
  }
  //5
 else if (mouseX >= blockW*4 && mouseX <= blockW*5) { 
    image(spin04,0,0);
  }
  //6
 else if (mouseX >= blockW*5 && mouseX <= blockW*6) { 
    image(spin05,0,0);
  }
  //7
 else if (mouseX >= blockW*6 && mouseX <= blockW*7) { 
    image(spin06,0,0);
  }
  
   //8
  else if (mouseX >= blockW*7 && mouseX <= blockW*8) { 
    image(spin07,0,0);
  }
  
     //9
 else if (mouseX >= blockW*8 && mouseX <= blockW*9) { 
    image(spinBG,0,0);
  }
  
     //10
 else if (mouseX >= blockW*9 && mouseX <= blockW*10) { 
    image(spin01,0,0);
  }
  
     //11
 else if (mouseX >= blockW*10 && mouseX <= blockW*11) { 
    image(spin02,0,0);
  }
  
     //12
 else if (mouseX >= blockW*11 && mouseX <= blockW*12) { 
    image(spin03,0,0);
  }
  
     //13
 else if (mouseX >= blockW*12 && mouseX <= blockW*13) { 
    image(spin04,0,0);
  }
  
     //14
 else if (mouseX >= blockW*13 && mouseX <= blockW*14) { 
    image(spin05,0,0);
  }
  
     //15
 else if (mouseX >= blockW*14 && mouseX <= blockW*15) { 
    image(spin06,0,0);
  }
  
  
     //16
 else if (mouseX >= blockW*15 && mouseX <= blockW*16) { 
    image(spin07,0,0);
  }
  
     //17
 else if (mouseX >= blockW*16 && mouseX <= blockW*17) { 
    image(spinBG,0,0);
  }
  
  
    //8
  else if (mouseX >= blockW*17 && mouseX <= blockW*18) { 
    image(spin07,0,0);
  }
  
  //title 
  if (mouseX < 1 && mouseY < 1) { 
  image(title,0,0);
  }
 
  fill(0);
  rect(x,y,w,h);
}

// When the mouse is pressed, the state of the button is toggled.   
// Try moving this code to draw() like in the rollover example.  What goes wrong?
void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = !button;
  }  
}




