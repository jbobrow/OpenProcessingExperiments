
void setup() {
  noStroke();
  size(100,100);
}


int C=40;

void draw() {
 
  background(0);
  ellipse(mouseX,mouseY,mouseY,50);

if (mousePressed) {
  fill (0);//fill black
}
  
  else{
    fill(255,255,255,C); //(no mouse click will be white
    C=C+1;
  } 

if (C>255){
 C= 40; 
}

  
}

