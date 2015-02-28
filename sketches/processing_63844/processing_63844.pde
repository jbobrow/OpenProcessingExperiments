
void setup() {
size (500,500);
colorMode (RGB,255,255,255,100);
background (0,0,255);
smooth();
fill (255,205,0);
strokeWeight(10);

ellipse (250,250,400,400);
fill(255,255,255);

ellipse (125,125,100,100);
ellipse (375,125,100,100);
ellipse (250,350,200,100);

ellipse (125,125,50,50);
fill (0);
ellipse (375,125,50,50);

fill(0);
ellipse (250,380,150,25);

}



void draw() {
  if(mousePressed) {
    stroke(255,205,0);
  } else {
    stroke(0);
  }
  line(mouseX-1, mouseY, mouseX+1, mouseY);
  line(mouseX, mouseY-1, mouseX, mouseY+1); 

}

void keyPressed() {
   
    saveFrame("smiley.png");
}


