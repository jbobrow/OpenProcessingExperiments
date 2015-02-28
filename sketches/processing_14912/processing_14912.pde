
PFont mysuperfont;
PFont font2;
float xpos, ypos;
float xspeed = 2.8;
float yspeed = 2.2;  

int xdirection = 1;  
int ydirection = 1; 

void setup(){
  size(500,300);
  mysuperfont = loadFont("Algerian-30.vlw");
  font2 = loadFont("ColonnaMT-50.vlw");
  xpos = width/2;
  ypos = height/2;

}

void draw(){
background(203,203,203);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height || ypos < 0){
    ydirection *= -1;
  }
  textFont(mysuperfont);
  fill(130, 0, 20);
  text("I Love Pigeons", 150, ypos);
  
  textFont(font2);
  fill(13, 150, 250);
  text("Guess What...", xpos, 200);
}

