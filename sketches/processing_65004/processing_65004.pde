
int xo = 320;
int yo = 300;
int toguro = 320;
int genkai = 300;
int yusuke = 101;
int sensui = 100;
void setup (){
  size (640, 480);
  background (255);
}
void draw (){
  stroke(0);
  for (int i = 10; i < 610; i += 50) {
  for (int j = 10; j < 420; j += 70) {
    stroke(255);
ellipse(i, j, 50, 70);
stroke(0);
fill(#F013CB);
  }
    if((keyPressed) && (key == CODED)){
    if(keyCode == LEFT){
        fill(#2A20BC);
  quad(xo, yo, xo + 80, xo - 20, xo, xo + 80, xo + 80, xo + 80);
      xo--;
      if(keyCode == RIGHT){
          fill(#2A20BC);
  quad(xo, yo, xo + 80, xo - 20, xo, xo + 80, xo + 80, xo + 80);
        xo++;
        if(keyCode == UP){
            fill(#2A20BC);
  quad(xo, yo, xo + 80, xo - 20, xo, xo + 80, xo + 80, xo + 80);
          yo--;
          if(keyCode == DOWN){
              fill(#2A20BC);
  quad(xo, yo, xo + 80, xo - 20, xo, xo + 80, xo + 80, xo + 80);
            yo++;
          }
        }
      }
    }
   
    fill(#2A20BC);
  quad(xo, yo, xo + 80, xo - 20, xo, xo + 80, xo + 80, xo + 80);
  }
  fill (mouseX-mouseY, mouseX, mouseY-104);
  triangle (mouseX-50, mouseY-150, mouseX, mouseY, mouseX+50, mouseY-150);
  fill (203, 85, 104);
  stroke(0);
  if((mouseX > toguro) &&(mouseX < toguro + yusuke) &&
    (mouseY > genkai) && (mouseY < genkai + sensui)){
  fill(#DE12D0);
  } else {
    fill(#D6DE12);
  }
  rect(xo, yo, 100, 100);
  }
}
