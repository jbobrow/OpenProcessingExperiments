
int a = 50;
int b = 30;

int c = 100;
int d = 30;





void setup(){
 size (700,400);
 background (255);
 
}

void draw(){
 
 
}

void mousePressed(){
  if (mouseX < 160 && mouseX > 80 && mouseY < 80){
  d = 0;
  }
  
  if (mouseX < 80 && mouseY < 80){
  b = 0;
  }}

void mouseMoved(){
  background(255);
  fill(0,0,0,100);
  noStroke();
  ellipse(a,a,b,b);
  
  if (mouseX < 80 && mouseY < 80 && b < 331 && b > 1){
    b = b + 100;
  }
  if (mouseX > 80 && mouseY > 80 && b > 30){
    b = b - 5;
  }
  
    fill(0,0,0,100);
  noStroke();
  ellipse(c,a,d,d);
  
  if (mouseX < 160 && mouseX > 80 && mouseY < 80 && d < 331 && d > 1){
    d = d + 100;
  }
  if (mouseX > 160 && mouseY > 80 && d > 30){
    d = d - 5;
  }
  
}

