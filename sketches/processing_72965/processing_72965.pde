
int h;
float border;


void setup(){
  size(900,600);
  smooth();
  colorMode(HSB,360,100,100,100);
  background(0,0,0);
  h=0;
  border=30.5;
}

void draw(){
   if(mouseX>400&&mouseX;<500&&mouseY;>550&&mouseY;<600){
    if(mousePressed){
      background(175,54,99);
    }
  }
   if(mouseX>250&&mouseX;<350&&mouseY;>550&&mouseY;<600){
    if(mousePressed){
      background(282,63,74);
    }
  }
  if(mouseX>550&&mouseX;<650&&mouseY;>550&&mouseY;<600){
    if(mousePressed){
      background(h,95,55);
    }
  }
  if(mouseX>100&&mouseX;<200&&mouseY;>550&&mouseY;<600){
    if(mousePressed){
      background(0,0,0);
    }
  }
  if(mouseX>700&&mouseX;<800&&mouseY;>550&&mouseY;<600){
    if(mousePressed){
      background(99,0,99);
    }
  }
    h++;
    border++;
    strokeWeight(5);
    noFill();
    stroke(6,99,border);
    if (border>70){
      border=30;
    }
    quad(20,20,20,580,880,580,880,20);
    strokeWeight(2);
    quad(10,10,10,590,890,590,890,10);
    stroke(h,99,34);
    fill(h,95,55);
    if(mouseX<20||mouseX>880||mouseY<20||mouseY>580){
      fill(0,0,0);
      stroke(0,0,0);
    }
    if (mousePressed){
      ellipse(mouseX,mouseY,abs(pmouseX-mouseX),abs(pmouseX-mouseX));
    }
    if (h>360){
      h=0;
    }
     stroke(6,99,border);
    fill(175,54,99);
    rect(400,550,100,50);
    fill(282,63,74);
    rect(250,550,100,50);
    fill(h,95,55);
    rect(550,550,100,50);
    fill(0,0,0);
    rect(100,550,100,50);
    fill(99,0,99);
    rect(700,550,100,50);
  
  
}
