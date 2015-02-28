
/*Nicole Strang
  ITGM 315
  Assignment 2 Part 2
  9/23/2012
  
  This script allows further interaction between Odeer and the User.
  
  As long as the left mouse key is pressed, Odeer moves up and down
  and follows the cursor.
  
  Otherwise, Odeer returns to the center of the screen and does nothing.
  
  If the right mouse key is pressed, the mouse cursor location
  can change Odeer's coat color.
  
  If the shift key is pressed on the keyboard, Odeer returns to his usual color.
  */




int newX = 400;
int newY = 400;
int gr1 = 225;
int gr2 = 102;
color color1 = color(255, 153, 51);
color color2 = color(255, 204, 102);

int i;
int o;
int u=0;
boolean jumpUp=true;


void setup() {
  size(800, 800);
  smooth();
  frameRate(30);
  rectMode(CORNERS);
  ellipseMode(CORNERS);
  background(255,255,204);
}


void draw() {
  background(255,255,204);
  
  if(mousePressed==true && mouseButton==LEFT){
        background(255,255,204);
        
        if(abs(mouseX-pmouseX)<1){
          drawOdeer(mouseX, mouseY+u, gr1, gr2, color1, color2);
          if(u<=-50){  jumpUp=true;  }
          if(u>=50){  jumpUp=false;  }
          if(jumpUp){
            u+=7;
          }
          else{
            u-=7;
          }
        }
        else{
          drawOdeer(mouseX, mouseY, gr1, gr2, color1, color2);
        }
  }
  else if(mousePressed==true && mouseButton==RIGHT){
    background(255,255,204);
    
    color1 = color(mouseX/2, mouseY/2, 51);
    drawOdeer(newX, newY, gr1, gr2, color1, color2);
  }
  else {
    drawOdeer(newX, newY, gr1, gr2, color1, color2);
  }
  
  if(keyPressed){
    if(keyCode==SHIFT){
      color1 = color(255, 153, 51);
      color2 = color(255, 204, 102);
    }
  }
  
}


//A function for drawing Odeer is necessary to keep the draw function from getting bulky.
void drawOdeer(int localX, int localY, int grey1, int grey2, color c1, color c2) {
    //Ears
  noStroke();
  fill(grey1);
  for(i=0; i<=90; i+=90){  ellipse(localX-130+i,localY-170,localX-90+i,localY-130);  }    
  
  //Neck
  fill(c2);
  rect(localX-50,localY-60,localX-40,localY-20);
  
  //Legs
  for(i=0; i<=80; i+=80){  
    rect(localX-40+i,localY+30,localX-30+i,localY+110);
    rect(localX-40+i,localY+110,localX-10+i,localY+170);
  }
    rect(localX+30,localY+30,localX+60,localY+50);
  
  //Tail
  fill(c1);
  rect(localX+50,localY-40,localX+80,localY-10);
  
  //Head
  rect(localX-130,localY-150,localX,localY-60);
  
  //Body
  rect(localX-50,localY-20,localX+60,localY+30);
  
  //Hooves
  fill(grey2);
  for(i=0; i<=80; i+=80){  rect(localX-50+i,localY+170,localX-10+i,localY+190);  }
  
  //Stripes on head
  stroke(grey2);
  for(i=0; i<=90; i+=90){  
    for(o=0; o<=10; o+=10){  line(localX-130+i,localY-130+o,localX-90+i,localY-130+o);  }
  }
  
  //Stripes on Bod
  for(i=0; i<=30; i+=10){  line(localX-10+i,localY-20,localX-10+i,localY);  }
  
  
  //Eyes
  stroke(grey1);
  for(i=0; i<=80; i+=80){  ellipse(localX-120+i,localY-90,localX-100+i,localY-70);  }
}
  
