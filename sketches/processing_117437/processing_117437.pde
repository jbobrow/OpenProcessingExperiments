
PFont font;
int ypos;
int xpos;
float opa;
int inc;
color col;
boolean G;


  void setup () {
    
  col= color (0,0,100);
  font = loadFont ("didot.vlw");
  size (1200, 300);
  smooth ();
  textSize (150);
  ypos=200;
  frameRate (120);
  G= false;
 
  
}

void draw () {
  background (0);
  if (G == true) {
  col= color (int (random (255)),int (random (255)),int (random (255)));
  G= false;
  
}

inc++;
xpos= inc/10;
opa= mouseY*1;
if (mousePressed) {
inc=0;
G=true;

}

if (inc>1000) {
  inc=500;
  stroke (255);
  fill (col,opa);
  ellipse (xpos*10,ypos-10,25,25);

}

else {
  fill (127,80);
  ellipse (mouseX, mouseY, 25,25);
  
}

fill (col,opa);
text ("T", 2*xpos,ypos);
text ("Y", 4*xpos,ypos);
text ("P", 6*xpos,ypos);
text ("O", 8*xpos,ypos);
text ("G", 10*xpos,ypos);
text ("R", 12*xpos,ypos);
text ("A", 14*xpos,ypos);
text ("P", 16*xpos,ypos);
text ("H", 18*xpos,ypos);
text ("Y", 20*xpos,ypos);

println (inc);

}
