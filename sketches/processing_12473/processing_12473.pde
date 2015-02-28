
boolean clickyes = false;
 
 int x = 25;
 int y = 25;
 int w = 50;
 int h = 50;
 
void setup(){
  size(200, 200);
}

int click = 0;

void draw(){
 background(255);
  
  fill(0);
  rect(x, y, w, h);
  
  fill(click);
  ellipse(150, 50, 40, 40);
}

void mousePressed(){
 if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
  clickyes = !clickyes ;
  } 
  
if (clickyes) {
  click = 255;
} else{
  click = 0;
}
  
}



