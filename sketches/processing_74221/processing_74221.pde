
int r = 255;
int g = 255;
int b = 255;
int value=0;

void setup() {
  size(400,400, P2D);
  smooth(4);
  background(120);
  
}

void draw(){
  
  fill(60);
  noStroke();
  rect(370, 370, 30, 30);
  fill(0,0,255);
  rect(370, 340, 30, 30);
  fill(0,255,0);
  rect(370, 310, 30, 30);
  fill(255,0,0);
  rect(370, 280, 30, 30);
  fill(255,255,255);
  rect(370, 250, 30, 30);
  fill(0,0,0);
  rect(370, 220, 30, 30);
  fill(value);
  rect(0,370,80,30);
  stroke(255);
  strokeWeight(2);
  line(width-23, height - 23, width-7, height-7);
  line(width-7, height - 23, width-23, height-7);
  line(20,395,60,395);
  line(20,380,39,395);
  line(40,375,40,394);
  line(40,395,60,380);
  
  if(mouseX<400 && mouseX>370 && mouseY<310 && mouseY>280 && mousePressed){
    r=255;
    g=0;
    b=0;
  }
  
  if(mouseX<400 && mouseX>370 && mouseY<340 && mouseY>310 && mousePressed){
    r=0;
    g=255;
    b=0;
  }
  
  if(mouseX<400 && mouseX>370 && mouseY<370 && mouseY>340 && mousePressed){
    r=0;
    g=0;
    b=255;
  }
  
  if(mouseX<400 && mouseX>370 && mouseY<280 && mouseY>250 && mousePressed){
    r=255;
    g=255;
    b=255;
  }
  
  if(mouseX<400 && mouseX>370 && mouseY<250 && mouseY>220 && mousePressed){
    r=0;
    g=0;
    b=0;
  } 
  
  
  if (mousePressed && pmouseX > 0){
  noStroke();
  stroke(r,g,b);
  strokeWeight(5);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
 
  
  if (mouseX>(width-30) && mouseY>(height-30) && mousePressed){
    
    background(120);
  }
}

void mouseDragged() 
{
  
  value=value+5;
  
  
  if (value > 255) {
    value = 0;
  }
}
