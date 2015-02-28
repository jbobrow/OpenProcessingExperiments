
boolean button = false;
int x=200;
int y=200;
int w=100;
int h=100;


void setup(){
  size(500,500);
}

void draw(){
  if (button){
    background(255);
    noStroke();
  } else {
    background(0);
    noStroke();
}
 fill(100);
 rect(x,y,w,h);
 ellipse(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed(){
  if(mouseX> x && mouseX < x+w && mouseY >y && mouseY < y+h){
    button=!button;
  }
}



 



