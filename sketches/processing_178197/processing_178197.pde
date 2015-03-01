
import ddf.minim.*;

/*
mouse:
pos x - number of lines to be draw, centerX
pos y - centerY
drag - to draw

backgroud:
the night sky, milkyway

sound:
bells, 3 sempls for 14 special mouse positions

keyboard:
1-3 = color mode: 1 - cold, 2 - medium, 3 - warm
s = save 
del, backspace = erase

text: --
*/


int counter = 1;
int palete = 2;

Minim minim;
AudioSample sample1, sample2, sample3;

PImage sky;

color[] palete1 = {
  color(111,13,255,60),
  color(37,12,232,60),
  color(25,63,255,60),
  color(28,100,232,60),
  color(13,90,255,60)
};
color[] palete2 = {
  color(13,249,255,60),
  color(12,232,37,60),
  color(251,255,0,60),
  color(232,163,18,60),
  color(255,74,13,60)
};
color[] palete3 = {
  color(255,161,11,60),
  color(232,117,10,60),
  color(255,88,2,60),
  color(232,52,10,60),
  color(255,22,11,60)
};


void setup(){
  size(900,600);
  colorMode(RGB,255,255,255,100);
  noFill();
  
  
  sky = loadImage("sky.jpg");
  background(sky);
  
  minim = new Minim(this);
  sample1 = minim.loadSample("sample1.wav");
  sample2 = minim.loadSample("sample2.wav");
  sample3 = minim.loadSample("sample3.wav");
  
}

void draw(){
  
  //image(sky,0,0);
  if(mousePressed){
    
    int posX = (int)map(mouseX,0,width,0,100);
    int posY = (int)map(mouseY,0,height,0,100);
    
    switch(posX){
      case 20:
        sample1.trigger();
        break;
      case 70:
        sample2.trigger();
        break;    
    }
    switch(posY){
      case 20:
        sample1.trigger();
        break;
      case 70:
        sample2.trigger();
        break;    
    }
    
    pushMatrix();
    translate(width/30, height/30);
    int circleResolution = (int)map(mouseX,0,height,4,10);
    int radius = (int)map(mouseX,0,height,10,50);//20;
    float angle = TWO_PI/(circleResolution);
    
    strokeWeight(2);  
    
    beginShape();
    for (int i = 0; i<=circleResolution; i++){
      switch(palete){
        case 1:
          stroke(palete1[(int)random(5)]);
          break;
        case 2:
          stroke(palete2[(int)random(5)]);
          break;
        case 3:
          stroke(palete3[(int)random(5)]);
          break;      
      }
      float x = mouseX + sin(angle*i)*radius;
      float y = mouseY + cos(angle*i)*radius;
      vertex(x,y);
    }
    endShape();
    popMatrix(); 
  }   
}

void keyReleased(){
  if(key == DELETE || key == BACKSPACE){
    background(sky);
  }  
  if(key == 's' || key == 'S'){
    saveFrame("screenshot"+counter+".png");
    counter++;
  }
  
  switch(key){
    case '1':
      palete = 1;
      break;
    case '2':
      palete = 2;
      break;
    case '3':
      palete = 3;
      break;
  }
}

