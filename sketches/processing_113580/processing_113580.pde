
int a = 50;
int b = 50; 
int c = 50;
int d = 50;

int x = 100;
int y = 100;



void setup(){
  size (300, 300);
}

void draw(){
  background(255);
  
  if ((mouseX > a) && (mouseX < a+c) && (mouseY > b) && (mouseY <b+d)){
    background (random(255),random(255), random(255));
    fill(0, 255, 0);
    rect(a/2, b/2, c*2, d*2);
    rect(a*2.5, b*2.5, c/2, d/2);
    rect(a*4, b*4, c/2, d/2);
    rect(a*3, a*3, c, d);
  }
  
  else {
    fill(0);
  }
  
  noStroke();  
  rect(a, b, c, d);
  
  if ((mouseX > x) && (mouseY > y) && (mouseX > x+y) && (mouseY > x+y)){
    background (255);
    fill(255, 0, 0);
    ellipse ( 175, 175, x/2, y/2);
    ellipse ( 125, 125, x/2, y/2);
    ellipse ( 200, 75, x/3, random(100));
    ellipse ( 50, 175, x/3, random(100));
    fill (0);
    rect( a, b, c, d);
  }
  else{
    fill(0);
  }
  
  noStroke();
  
  ellipse(250, 250, x, y);
  
}




  
  
  
  


