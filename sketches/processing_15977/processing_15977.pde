
//import fullscreen.*;
import java.util.ArrayList;

//FullScreen fs;

int h = 0;
PFont fontSmall = createFont("Sans", 12, true);
PFont fontLarge = createFont("Sans", 24, true);
int dau = 0;

ArrayList clouds = new ArrayList();

void setup(){
  size(640,480);
  colorMode(HSB, 255);
  
  noCursor();
  
  //fs = new FullScreen(this);
  //fs.enter();
}

void draw(){
  float back = 100*sin(frameCount/50.0)+100;
  background(back);
  
  fill(255-back);
  stroke(255-back);
  textFont(fontLarge);
  text("impression! - xi", 50 + 30*sin(frameCount/100.0), 400);
  strokeWeight(2);
  
  //write arrow
  stroke(255 - back);
  
  pushMatrix();
  translate(30*sin(frameCount/100.0) + 20, 20);
  rotate(sin(frameCount/100.0)/8.0);
  line(250, 390, 350, 330);
  line(350, 330, 320, 330);
  line(350, 330, 340, 360);
  popMatrix();
  
  strokeWeight(1);
  
  noFill();
  stroke(255);
  line(mouseX-2,mouseY,mouseX+2,mouseY);
  line(mouseX,mouseY-2,mouseX,mouseY+2);
  
  for(int i=0; i<clouds.size(); i++){
    Cloud c = (Cloud)clouds.get(i);
    c.draw();
    c.move();
  }
}

void mousePressed(){
  clouds.add(new Cloud(mouseX,mouseY));
  println(clouds.size());
}

void keyPressed(){
  if(key==BACKSPACE && clouds.size() > 0) clouds.remove(0);
  else if(key==ENTER && clouds.size() > 0) clouds = new ArrayList();
  else if(key=='d') dau = 1;
  else if(key=='i') dau = 2;
  else if(key=='n') dau = 0;
  else h = int(random(255));
}

class Cloud{
  int x = 0, y = 0, r = int(random(6));
  int b = int(random(20));
  
  int s = int(random(200));
  
  Cloud(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void move(){
    x += random(b)-(b/2);
    y += random(b)-(b/2)+random(4);
    
    if(x>=width) x=0;
    else if(x<=0) x=width;
    
    if(y>=height) y=0;
    else if(y<=0) y=height;
  }
  
  void draw(){
    noStroke();
    fill(h, s, 100, random(255));
    
    textFont(fontSmall);
    
    if(dau==0) ellipse(x,y,random(10)+r,random(10)+r);
    else if(dau==2) text("いんぷ", x , y);
    else text("だぅ", x , y);
  }
}

