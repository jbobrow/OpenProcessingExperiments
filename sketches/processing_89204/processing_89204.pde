
int width=10;
int height=10;
int color_v=0;
 

void setup() {
  size(300, 300);
  background(0);
}
  
void draw(){
  }
  
  
void mouseDragged() {
  noStroke();
  fill(500+color_v*0.5, 0+color_v, 0+color_v);
  ellipse(mouseX, mouseY, width, height);
}
  
  
void keyPressed() {
  if (key == 'q') {
    color_v=360;
  }
  
  if (key == 'w') {
    color_v=200;
  }
  
  if(key == 's') {saveFrame("screenshot-####.png");}
 
  
  if (key == 'e') {
    color_v= 100;
  }
  
    if (key == 'r') {
    color_v= 0;
  }
    
    
  if (key == 'a') {
    background(256, 256, 256);
  }
  
  if (key == '3') {
    width=50;
    height=50 ;
  }
  
  
  if (key == '1') {
    width=5;
    height=5 ;
  }
  
  if (key == '2') {
    width=30;
    height=30 ;
  }
  if (key == '4') {
    width=100;
    height=100;
  }
}
