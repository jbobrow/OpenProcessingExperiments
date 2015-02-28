
PFont txt;
float R=0;
float plus=0;

void setup() {
  size(250,250);
  smooth();
  txt = loadFont("Impact-48.vlw");
  frameRate(60);
}

void draw() {
  background(0);
  textMode(CENTER);
  textFont(txt,48);

  translate(width/2,height/2);
  rotate(R);
  
  translate(50,0);
  rotate(R*(-1+plus));
  text("L7P3R9",-65,0);
  R+=.01;
}

void keyPressed(){
 if (key=='q') {plus+=-1;} 
 if (key=='Q') {plus+=1;}
}

