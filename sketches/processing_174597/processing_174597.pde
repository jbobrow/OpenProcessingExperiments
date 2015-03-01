
int a;
int c;
int x = 0;

void setup() {
  size(500,500);
  smooth();
  noStroke();
  fill(0);
  a = 30;
  c = 0;
  
  
}

void draw() {
 // background(255);
  fill(random(255),random(255),random(255));

}

void mouseDragged(){
  rect(mouseX,mouseY,a,a);
}
  
  
void mouseMoved(){
  ellipse(mouseX,mouseY,20,20);

}
  
  


void mousePressed() {
  background(random(234),random(242),random(122));
}
void keyPressed() {

  if(key == CODED) {
    if(keyCode == UP) { 
     a+=2;
    }else if (keyCode == DOWN) {    
     a-=2;
    }
  }
}


