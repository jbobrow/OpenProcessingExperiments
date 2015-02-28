
/*Nicole Strang
  ITGM 315
  Assignment 3 Part 1
  10/2/2012
   
  This script uses functions to draw Odeer. He is split into three parts: Head, torso, and legs.
  There is also an extra function to only draw the eyes.
  */
 
 
 
 
int localX = 400;
int localY = 400;
int gr1 = 225;
int gr2 = 102;
color color1 = color(255, 153, 51);
color color2 = color(255, 204, 102);

int i;
int o;
 
 
void setup() {
  size(800, 800);
  smooth();
  frameRate(30);
  rectMode(CORNERS);
  ellipseMode(CORNERS);
  background(255,255,204);
}

 
void draw(){
  odeerLegs(localX, localY, gr2, color2);
  odeerTorso(localX, localY, gr2, color1, color2);
  odeerHead(localX, localY, gr1, gr2, color1);
  odeerEyes(localX, localY, color(gr2), color(gr1));
}




void odeerHead(int localX, int localY, int grey1, int grey2, color c1) {
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


void odeerTorso(int localX, int localY, int grey2, color c1, color c2) {
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


void odeerLegs(int localX, int localY, int grey2, color c2) {
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

void odeerEyes(int localX, int localY, color c1, color c2) {
  stroke(c2);
  fill(c1);
  for(i=0; i<=80; i+=80){  ellipse(localX-120+i,localY-90,localX-100+i,localY-70);  }
}




