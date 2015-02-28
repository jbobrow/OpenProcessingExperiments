


int x=0;
int y=0;
int sw=1;
color c=0;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  stroke(c);
  strokeWeight(sw);
  x=mouseX;
  y=mouseY;
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    //ellipse(x,y,obk,obm);
  }
  if (keyPressed) {
    if (key=='g') {
      c=color(0, 255, 0);
    }
    if (key=='m') {
      c=color(8, 234, 252);
    }
    if (key=='p') {
      c=color(255, 0, 239);
    }
    if (key=='r') {
      c=color(255, 0, 0);
    }
    if (key=='y') {
      c=color(254, 255, 0);
    }
    if (key=='o') {
      c=color(255, 128, 0);
    }
    if (key=='b'){
      c=color(0,0,255);
    }
    if(key=='k'){
      c=color(0);
    }
  
    if (key=='0') {
      background(255);
    }
    if (key=='w') {
      c=color(220);
    }
     if (key=='e') {
      c=color(255);
    }
    
  }
}
void keyPressed(){
  switch(key) {
    case 'a':
 // if( key == 'a'){
    fill(0,255,0);
    triangle(mouseX, mouseY, mouseX+10, mouseY+10, mouseX+10, mouseY-10);
    break;
  }
}




void mouseDragged() { 
  fill(0);
  
if (key=='2') {  
ellipse(mouseX, mouseY, 100, 100);
      triangle(mouseX, mouseY, mouseX+10, mouseY+10, mouseX+10, mouseY-10);
}
  
} 




