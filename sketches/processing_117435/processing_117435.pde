
PFont font;
int ypos;
int xpos;
float opa;
int inc;
color col;
boolean el;

void setup () {

  col = color (0,0,200);
  font = loadFont ("http://www.jaboston.com/agency.vlw");
  size (1200, 100);
  smooth();
  textSize (60);
  ypos=70;
  frameRate (120);
  el = false;
}

void draw () {
  background (0);
  if (el== true) {
col= color (int (random (255)),int (random (255)),int (random (255)));
 el= false;
 
  }
  
  inc++;
  xpos= inc/12;
  opa=mouseY*2.5;
  if(mousePressed) {
    inc=0;
    el = true;
  }
  
  if (inc>2000) {
  //fill (col, 80);
   inc = 1000;
   stroke(255);
   fill (col, opa);
   ellipse(xpos*10,ypos-10,25,25);
  
  }
  
 else{
   fill (127, 80);
   ellipse (mouseX, mouseY, 25,25);
   
 }
 
 fill (col,opa);
 text ("Type", 2*xpos,ypos);// this moves Creating until inc reaches 2000
 text ("In", 4*xpos,ypos);// multiplying x pos by 6 to increase spacing between words
 text ("Motion", 6*xpos,ypos);
 
 println (inc);
 
  }
