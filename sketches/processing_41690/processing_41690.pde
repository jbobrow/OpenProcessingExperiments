
import ddf.minim.*;


int i, x, y;
boolean saudio = true;

float freq = 60;
float pan = 0;
float h; 

float xpos =350;
float ypos =200;

float angle = 0.0;
float offset = 60;
float scalar = 40;
float speed = 0.05;

float opacity = 50; 

Minim minim;
AudioPlayer alien1;
AudioPlayer noise1;
AudioPlayer noise2;


void setup() {
  size(500, 500); 
  minim = new Minim(this);
  alien1 = minim.loadFile("alien1.wav"); 
  noise1 = minim.loadFile ("noise1.wav");
   noise2 = minim.loadFile ("noise2.wav");
 
 
  
  
  //sine.portamento(10);
 // out.addSignal(sine);
  //sine.setPan (1);
  smooth();
  noFill();
  noCursor();
  strokeWeight(4);
  h = height ;
  x = 0;
  y = 10;
}

void draw() {
  background(0); 
  float red = 255 - (20 * i); 

  if(red > 255) red = 255; 
  
  stroke(255, red, 0, opacity);
  
  i = 0; 
  while(i < y) {
    xpos = xpos + (mouseX - xpos) /30.0;
    ypos = ypos +(mouseY -ypos)/30.0;

    beginShape();
    
    float y1=offset +sin(angle) * scalar;
    float y2=offset +sin(angle +0.4) *scalar;
    float y3=offset +sin(angle + 0.8) *scalar;
    float y4 =offset +sin (angle+1.2)*scalar;
    float y5=offset +sin(angle+1.6) * scalar;
    float y6=offset +sin(angle +2) *scalar;
    float y7=offset +sin(angle + 2.4) *scalar;
    float y8 =offset +sin (angle+2.8)*scalar;

    bezier(mouseX, mouseY, mouseX+10, mouseY+10, mouseX+ 0, mouseY+90, xpos+ 25, ypos+80+y1);
    bezier(mouseX, mouseY, mouseX+10, mouseY+30, mouseX+ 0, mouseY+90, xpos- 25, ypos+80+y2);
    bezier(mouseX, mouseY, mouseX+20, mouseY+20, mouseX+ 0, mouseY+80, xpos+ 15, ypos+60+y3);
    bezier(mouseX, mouseY, mouseX+20, mouseY+40, mouseX+ 0, mouseY+80, xpos- 15, ypos+60+y4);
    bezier(mouseX, mouseY, mouseX+30, mouseY+30, mouseX+ 0, mouseY+70, xpos+ 35, ypos+80+y5);
    bezier(mouseX, mouseY, mouseX+30, mouseY+50, mouseX+ 0, mouseY+70, xpos- 35, ypos+80+y6);
    bezier(mouseX, mouseY, mouseX+40, mouseY+40, mouseX+ 0, mouseY+60, xpos+ 45, ypos+60+y7);
    bezier(mouseX, mouseY, mouseX+40, mouseY+60, mouseX+ 0, mouseY+60, xpos- 45, ypos+60+y8);
 
    angle +=speed;
    endShape();
    i++;
  }
}

void keyPressed() {
  if(keyCode == UP) 
    if(alien1.isPlaying() == false ) {
      alien1.loop(0);
    }
   
  
   if(keyCode == DOWN) 

    if(noise1.isPlaying()==false) {
      noise1.loop(0);
    }
      
       if(keyCode == RIGHT) 

    if(noise2.isPlaying()==false) {
      noise2.loop(0);
  }
}


