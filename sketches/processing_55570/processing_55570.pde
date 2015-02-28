
int x1;
int y1;
int kolor = 255;

void setup(){
  size(700,350);
  background(25);
  smooth();
  ellipseMode(CENTER);
}


void draw(){
}
//mouse function
void mousePressed(){
    if (mouseButton == LEFT) {    
      //draws line of colour
      stroke (kolor);
    line (x1, y1, mouseX, mouseY);
    x1=mouseX;
    y1=mouseY;
    //line based on where you click
  } else if (mouseButton == RIGHT){
      kolor -= 40;
        if(kolor>255){
          kolor = 0;
        }
        //every time right mouse button is pressed, kolor value decreases by 40
        //when it is over 225, kolor is set back to 0
    } 
}

void mouseReleased(){
  if (mouseButton == LEFT) { 
      stroke (kolor);
      fill(kolor, 10);
      triangle(mouseX, mouseY, mouseX/3, mouseX/3, mouseY+30, mouseY+30);
      //draw triangle here
  }
  
}

void keyPressed(){
  if (key == ' '){
    fill(25);
    noStroke();
    rect(0,0, width, height);
  }
}
//draws rect over visible area and covers everything

