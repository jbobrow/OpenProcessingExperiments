
int ell = 0;


void setup(){
size(400, 400);
smooth();
background(160, 170, 255);
}

void draw(){
  fill(160, 170, 255, 0);
  noStroke();
  rect(0, 0, width, height);

  if(mousePressed){
fill(160, 170, 255, 20);
  

stroke(255, 255, ell);
strokeWeight(1);
ellipse(mouseX, mouseY, ell, ell);

ell=ell + 5;
  }

}

void mouseReleased(){
 ell = 0;
}

