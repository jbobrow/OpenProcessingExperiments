
/*Nicole Strang
  ITGM 315
  Assignment 3 Part 3
  10/2/2012
   
  This script uses a new class called Odeer to create some Odeer clones. They dance when
  the left mouse button is hit.
  */
 
 
 
 
Odeer clone1, clone2, clone3;

int xpos = 400;
int ypos = 400;
int gr1 = 225;
int gr2 = 102;
color color1 = color(255, 153, 51);
color color2 = color(255, 204, 102);

int i;
int o;
int u;
 
 
void setup() {
  size(800, 800);
  smooth();
  frameRate(30);
  rectMode(CORNERS);
  ellipseMode(CORNERS);
  background(255,255,204);
  
  clone1 = new Odeer();
  clone2 = new Odeer();
  clone3 = new Odeer();
}

 
void draw(){
  background(255,255,204);
  
  clone1.displayStill(xpos/2, ypos/2, gr1, gr2, color1, color2);
  clone2.displayStill(xpos+xpos/2, ypos/2, gr1, gr2, color1, color2);
  clone3.displayStill(xpos, ypos+ypos/2, gr1, gr2, color1, color2);
  
  if(mousePressed==true && mouseButton==LEFT){
   background(255,255,204);
   clone1.dance(xpos/2, ypos/2, gr1, gr2, color1, color2); 
   clone2.dance(xpos+xpos/2, ypos/2, gr1, gr2, color1, color2); 
   clone3.dance(xpos, ypos+ypos/2, gr1, gr2, color1, color2); 
  }
  
}




//Odeer Class
class Odeer{
  
  int localX;
  int localY;
  int p;
  color c1;
  color c2;
  color colorBG;
  int grey1;
  int grey2;
  boolean headbob;
  
  Odeer(){
    int localX = width/2;
    int localY = height/2;
    color c1 = color(255, 153, 51);
    color c2 = color(255, 204, 102);
    int grey1;
    int grey2;
    headbob = true;
    colorBG = color(255,255,204);
  }
  
  void drawLegs(int localX, int localY, int grey2, color c2) {
  //Legs
  noStroke();
  fill(c2);
  for(i=0; i<=80; i+=80){ 
    rect(localX-40+i,localY+30,localX-30+i,localY+110);
    rect(localX-40+i,localY+110,localX-10+i,localY+170);
  }
  rect(localX+30,localY+30,localX+60,localY+50);
    
  //Hooves
  fill(grey2);
  for(i=0; i<=80; i+=80){  rect(localX-50+i,localY+170,localX-10+i,localY+190);  }
  }
  
  void drawTorso(int localX, int localY, int grey2, color c1, color c2) {
    //Neck
    noStroke();
    fill(c2);
    rect(localX-50,localY-60,localX-40,localY-20);
    
    //Tail
    fill(c1);
    rect(localX+50,localY-40,localX+80,localY-10);
  
    //Body
    rect(localX-50,localY-20,localX+60,localY+30);
    
    //Stripes on Bod
    stroke(grey2);
    for(i=0; i<=30; i+=10){  line(localX-10+i,localY-20,localX-10+i,localY);  }
  }
  
  void drawHead(int localX, int localY, int grey1, int grey2, color c1) {
    //Ears
    noStroke();
    fill(grey1);
    for(i=0; i<=90; i+=90){  ellipse(localX-130+i,localY-170,localX-90+i,localY-130);  }
    
    //Head
    fill(c1);
    rect(localX-130,localY-150,localX,localY-60);
    
    //Stripes on head
    stroke(grey2);
    for(i=0; i<=90; i+=90){ 
      for(o=0; o<=10; o+=10){  line(localX-130+i,localY-130+o,localX-90+i,localY-130+o);  }
    }
  }
  
  void drawEyes(int localX, int localY, color c1, color c2) {
    stroke(c2);
    fill(c1);
    for(i=0; i<=80; i+=80){  ellipse(localX-120+i,localY-90,localX-100+i,localY-70);  }
}
  
  void displayStill(int localX, int localY, int grey1, int grey2, color c1, color c2) {
    drawLegs(localX, localY, grey2, color2);
    drawTorso(localX, localY, grey2, c1, c2);
    drawHead(localX, localY, grey1, grey2, c1);
    drawEyes(localX, localY, grey2, grey1);
  } 
  
  void dance(int localX, int localY, int grey1, int grey2, color c1, color c2) {
    
    drawLegs(localX, localY, grey2, c2);
    
    if(u<=-20){  headbob=true;  }
        if(u>=20){  headbob=false;  }
        if(headbob){
          u+=2;
        }
        else{
          u-=2;
        }
    
    p+=3;
    if(p>255){  p = 0;  }
    c1 = color(p, p/2, p/3);
    drawTorso(localX, localY, grey2, c1, c2);
    drawHead(localX+u, localY, grey1, grey2, c1);
    drawEyes(localX+u, localY, grey2, grey1);

      }
    
  
  
}
