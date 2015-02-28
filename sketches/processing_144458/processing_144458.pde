
float updown;
float leftright;
int a;
 
void setup(){
  size(750,750);
  frameRate (100);
  updown=300;
  leftright=50;
  
}
void draw(){
  background(0,255,0);
  noStroke();
  fill(random (0,255),random(0,255),random (0,255));
  ellipse(leftright, updown, 190,190);
  if(keyPressed==true){
    if(key=='a'){
      leftright=leftright-5;
    }
    if(key=='d'){
      leftright=leftright+5;
    }
    if(key=='w'){
      updown=updown-5;
    }
    if(key=='s'){
      updown=updown+5;
    }
  }
  fill (#000080);
  rect(250,0,40,500);
  rect(500,250,40,500);
  
 
}


