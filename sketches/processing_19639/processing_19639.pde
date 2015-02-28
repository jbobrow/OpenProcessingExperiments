
PFont font;
PFont font2;

void setup(){
   
  size(250, 250);
  background(#000000);
  //load both fonts
  font= loadFont("ARCHRISTY-100.vlw");
  font2= loadFont("AgencyFB-Reg-50.vlw");
  smooth();
  frameRate(5);
}
   
void draw()
{  //first font & different color and sizes
  textFont(font);
  fill(#03A0FF, 100);
  textSize(20);
  text("h9e1a6", random(250), random(250));
   fill(#9D03FF, 100);
  textSize(50);
  text("h9e1a6", random(250), random(250));
  
  //using 2nd font & different color and sizes
   textFont(font2);
  fill(#FF03AB, 100);
  textSize(20);
  text("h9e1a6", random(250), random(250));
   fill(#FEFF03, 100);
  textSize(50);
  text("h9e1a6", random(250), random(250));
  if(mousePressed) {
    background(0);
  }
}

